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

		# Import the config renderer
		renderConfig = cfg: opts: (import ./lib/render.nix { inherit lib pkgs cfg opts; });

		# Import the user config
		tf2Config = pkgs.lib.evalModules {
			modules = [
				tf2Nix
				./example-config.nix
			];
		};

  enabledTweakConfigs =
    lib.pipe tf2Config.config.tweaks [
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
			src = ./.;
			installPhase = ''
				mkdir -p $out/tf2nix/cfg
				${pkgs.lib.concatStringsSep "\n" (
					builtins.attrValues (
						builtins.mapAttrs (name: content:
							"echo ${pkgs.lib.escapeShellArg content} > $out/tf2nix/cfg/${name}.cfg"
						) renderedCfg
					)
				)}
			'';
		};
  };
}
