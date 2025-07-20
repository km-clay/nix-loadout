{ pkgs, lib, tf2Config, tweakDefs, renderConfig, hudImporter, mapInstaller, sourceModInstaller }:

let
  cfg = tf2Config.config;
  opts = tf2Config.options;

  customDir = import ./customdir.nix { 
		inherit pkgs lib tweakDefs renderConfig hudImporter;
		cfg = cfg.custom;
		opts = opts.custom;
	};

	tfRootDir = import ./tfroot.nix {
		inherit pkgs lib renderConfig mapInstaller sourceModInstaller;
		cfg = cfg.global;
		opts = opts.global;
	};
in
# Final derivation to return
pkgs.runCommand "tf2nix-config" { } ''
  mkdir -p $out/custom
	cp -R ${customDir}/* $out/custom
	cp -R ${tfRootDir}/* $out
''
