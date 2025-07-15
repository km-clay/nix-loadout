{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
	let
		system = "x86_64-linux";
		pkgs = import nixpkgs { inherit system; };
		lib = pkgs.lib;
		tf2Nix = import ./modules;
		tweakDefs = import ./lib/tweaks.nix { inherit lib; };
		hudImporter = import ./lib/installhud.nix { inherit lib pkgs; };

		# Import the config renderer
		renderConfig = cfg: opts: (import ./lib/render.nix { inherit lib cfg opts; });

		# Import the user config
		tf2Config = pkgs.lib.evalModules {
			modules = [
				tf2Nix
				./example-config.nix
			];
		};

		enabledHuds = builtins.filter (v: v != null) (
			lib.mapAttrsToList (name: cfg: 
				if cfg.enable then name else null
			) tf2Config.config.hud
		);

		hudName = if builtins.length enabledHuds == 1 then
			builtins.head enabledHuds
		else if builtins.length enabledHuds == 0 then
			null
		else
			throw "Only one HUD can be enabled under tf2Config.hud";

		hudDrv = if hudName != null then
			hudImporter tf2Config.config.hud
		else 
			null;

  enabledTweakConfigs =
    lib.pipe tf2Config.config.enableTweaks [
      (lib.filterAttrs (_: v: v == true))
      (lib.mapAttrsToList (name: _: tweakDefs.${name}))
      (lib.fold lib.recursiveUpdate { })
    ];
	renderedCfg =
		let
			rendered = {
				autoexec = renderConfig
					(lib.recursiveUpdate tf2Config.config.autoexec enabledTweakConfigs)
					tf2Config.options.autoexec;
			}
			// (builtins.mapAttrs (name: cfg:
				renderConfig cfg tf2Config.options.class.${name}
			) tf2Config.config.class)
			// (builtins.mapAttrs (name: cfg:
				renderConfig cfg tf2Config.options.autoexec
			) tf2Config.config.cfgFiles);

			# Filter out null or empty configs
			filtered = lib.filterAttrs (_: val: val != null && val != "\n") rendered;
		in
			filtered;
	in
	{
		packages.${system}.default = pkgs.stdenv.mkDerivation {
			name = "tf2nix-config";
			src = self;
			installPhase = ''
				mkdir -p $out/custom/tf2nix/cfg
				mkdir -p $out/custom/tf2nix/sound/ui
				${lib.optionalString (hudDrv != null) "cp -R ${hudDrv}/* $out/custom/tf2nix"}
				${lib.optionalString (tf2Config.config.sound.hitsound != null) ''
					cp ${tf2Config.config.sound.hitsound} $out/custom/tf2nix/sound/ui/hitsound.wav
				''}
				${lib.optionalString (tf2Config.config.sound.killsound != null) ''
					cp ${tf2Config.config.sound.killsound} $out/custom/tf2nix/sound/ui/killsound.wav
				''}
				${pkgs.lib.concatStringsSep "\n" (
					builtins.attrValues (
						builtins.mapAttrs (name: content:
							"echo ${pkgs.lib.escapeShellArg content} > $out/custom/tf2nix/cfg/${name}.cfg"
						) renderedCfg
					)
				)}
			'';
		};
  };
}
