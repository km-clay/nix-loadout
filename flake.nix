{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
	let
		system = "x86_64-linux";
		pkgs = import nixpkgs { inherit system; };
		tf2Nix = import ./modules;

		tf2Config = pkgs.lib.evalModules {
			modules = [
				tf2Nix
				./example-config.nix
			];
		};

		renderedCfg = { autoexec = tf2Config.config.tf2Nix.renderedCfg; };
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
