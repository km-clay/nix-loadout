{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

	outputs = { self, nixpkgs }: let
		system = "x86_64-linux";
		pkgs = import nixpkgs { inherit system; };
		lib = pkgs.lib;
    gameModules = import ./games { inherit pkgs lib; };


	in {
    inherit gameModules;
		packages.${system}.default = gameModules.tf2.buildConfig [ ./example-config.nix ];
	};
}
