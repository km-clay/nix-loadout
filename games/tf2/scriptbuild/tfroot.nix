
{ pkgs, lib, cfg, opts, renderConfig, mapInstaller, sourceModInstaller }:

let
	
	srcModCfg = cfg.sourcemod;
	mapCfg = cfg.installMaps;
	sourcemod = if srcModCfg.enable then 
		sourceModInstaller srcModCfg
	else
		null;
	maps = mapInstaller mapCfg;
  renderedCfg =
    let
      rendered = {
        autoexec = renderConfig cfg.autoexec opts.autoexec;
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
pkgs.runCommand "tf2nix-tf-root" { } ''
  mkdir -p $out/cfg
  mkdir -p $out/sound/ui

	${lib.optionalString (sourcemod != null) ''
		cp -R ${sourcemod}/* $out
	''}

	${lib.optionalString (maps != null) ''
		cp -R ${maps}/* $out
	''}

  ${lib.concatStringsSep "\n" (
    lib.mapAttrsToList (name: content:
      "echo ${lib.escapeShellArg content} > $out/cfg/${name}.cfg"
    ) renderedCfg
  )}
''
