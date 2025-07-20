{ pkgs, lib, cfg, opts, tweakDefs, renderConfig, hudImporter }:

let
  enabledHuds = lib.filter (v: v != null) (
    lib.mapAttrsToList (name: cfg:
      if cfg.enable then name else null
    ) cfg.hud
  );

  hudName =
    if builtins.length enabledHuds == 1 then builtins.head enabledHuds
    else if builtins.length enabledHuds == 0 then null
    else throw "Only one HUD can be enabled under tf2Config.hud";

  hudDrv = if hudName != null then hudImporter cfg.hud else null;

  enabledTweakConfigs =
    lib.pipe cfg.enableTweaks [
      (lib.filterAttrs (_: v: v == true))
      (lib.mapAttrsToList (name: _: tweakDefs.${name}))
      (lib.fold lib.recursiveUpdate { })
    ];

  renderedCfg =
    let
      rendered = {
        autoexec = renderConfig
          (lib.recursiveUpdate cfg.autoexec enabledTweakConfigs)
          opts.autoexec;
      }
      // (lib.mapAttrs (name: cfg:
        renderConfig cfg opts.class.${name}
      ) cfg.class)
      // (lib.mapAttrs (name: cfg:
        renderConfig cfg opts.autoexec
      ) cfg.cfgFiles);
    in
      lib.filterAttrs (_: val: val != null && val != "\n") rendered;

in
# Final derivation to return
pkgs.runCommand "tf2nix-custom" { } ''
  mkdir -p $out/tf2nix/cfg
  mkdir -p $out/tf2nix/sound/ui

  ${lib.optionalString (hudDrv != null) "cp -R ${hudDrv}/* $out/tf2nix"}

  ${lib.optionalString (cfg.sound.hitsound != null) ''
    cp ${cfg.sound.hitsound} $out/tf2nix/sound/ui/hitsound.wav
  ''}

  ${lib.optionalString (cfg.sound.killsound != null) ''
    cp ${cfg.sound.killsound} $out/tf2nix/sound/ui/killsound.wav
  ''}

  ${lib.concatStringsSep "\n" (
    lib.mapAttrsToList (name: content:
      "echo ${lib.escapeShellArg content} > $out/tf2nix/cfg/${name}.cfg"
    ) renderedCfg
  )}
''
