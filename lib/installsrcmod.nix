{ lib, pkgs }:

srcModCfg: 
	let
		srcModPlugins = import ./srcmodplugins.nix { inherit lib pkgs; };

		enabledPlugins = lib.filter (v: v != null) (
			lib.mapAttrsToList (name: cfg:
				let enabled = cfg.enable or false;
				in if enabled then name else null
			) srcModCfg.plugins
		);

		pluginDerivs = map (name:
			let
				cfg = srcModCfg.plugins.${name};
			in
				if cfg.package != null then cfg.package
				else srcModPlugins.${name}
		) enabledPlugins;

		allPluginPkgs = pluginDerivs ++ (srcModCfg.plugins.extraPlugins or []);

		soucemod_src = pkgs.fetchurl {
			url = "https://sm.alliedmods.net/smdrop/1.13/sourcemod-1.13.0-git7246-linux.tar.gz";
			sha256 = "sha256-EbpqgjFLqxnRAnAvHRSbbNj5hUSys5RiY9dlYq3IZBE=";
		};
		metamod_src = pkgs.fetchurl {
			url = "https://mms.alliedmods.net/mmsdrop/1.12/mmsource-1.12.0-git1219-linux.tar.gz";
			sha256 = "sha256-8W5n2N4wpG7bKu6JCaiF+fAlmTKEWWuwz8g7WzLq4F8=";
		};
		sourcemod = pkgs.runCommand "sourcemod" {
			nativeBuildInputs = [ pkgs.gnutar pkgs.gzip ];
		} ''
			mkdir -p $out
			tar -xzf ${soucemod_src} -C $out 
		'';
		metamod = pkgs.runCommand "metamod" {
			nativeBuildInputs = [ pkgs.gnutar pkgs.gzip ];
		} ''
			mkdir -p $out
			tar -xzf ${metamod_src} -C $out
		'';
	in
		pkgs.runCommand "tf2nix-addons" {
			nativeBuildInputs = [ pkgs.gnutar pkgs.gzip ];
		} ''
		mkdir -p $out/addons/sourcemod/{plugins/disabled,scripting/include,extensions,gamedata,translations}
		mkdir -p $out/addons/metamod
		mkdir -p $out/cfg
		cp -R ${metamod}/addons/* $out/addons
		cp -R ${sourcemod}/addons/* $out/addons
		cp -R ${sourcemod}/cfg/* $out/cfg

		${lib.concatStringsSep "\n" (map (plugin: ''
				cp -R ${plugin}/* $out
			'') allPluginPkgs
			)
		}
		''
