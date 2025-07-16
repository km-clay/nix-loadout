{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

	outputs = { self, nixpkgs }: let
		system = "x86_64-linux";
		pkgs = import nixpkgs { inherit system; };
		lib = pkgs.lib;

		tf2Nix = import ./modules;
		tweakDefs = import ./lib/tweaks.nix { inherit lib; };
		hudImporter = import ./lib/installhud.nix { inherit lib pkgs; };
		sourceModInstaller = import ./lib/installsrcmod.nix { inherit lib pkgs; };
		mapInstaller = import ./lib/installmaps.nix { inherit lib pkgs; };
		renderConfig = cfg: opts: (import ./lib/render.nix { inherit lib cfg opts; });

		buildTf2Config = modules:
			let
				tf2Config = lib.evalModules {
					modules = [ tf2Nix ] ++ modules;
				};
			in
				import ./lib/scriptbuild {
					inherit pkgs lib tf2Config tweakDefs renderConfig hudImporter mapInstaller sourceModInstaller;
				};

	in {
		lib.buildTf2Config = buildTf2Config;
		nixosModules.default = tf2Nix;
		packages.${system}.default = buildTf2Config [ ./example-config.nix ];
	};
}
