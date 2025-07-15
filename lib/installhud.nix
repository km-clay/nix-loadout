{ lib, pkgs }:

hudCfg: 
	let
		enabledHuds = lib.filterAttrs (_: v: v.enable or false) hudCfg;
		hudNames = builtins.attrNames enabledHuds;
		hudName = if builtins.length hudNames == 1 then
			builtins.head hudNames
		else if builtins.length hudNames == 0 then
			null
		else
			throw "Multiple HUDs enabled in tf2Config.hud: ${builtins.toString hudNames}";

		hudSources = {
			ahud-cc = cfg: pkgs.fetchFromGitHub {
				owner = "jakadak";
				repo = "ahud-cc";
				rev = "master";
				sha256 = "sha256-TRRT6YaFG/I6cJEZ91zDmJHdqhUPB2wA0ObXm8Al5mk=";
			};
		};

		drvBuilder = hudSources.${hudName} or (throw "No build rule for HUD '${hudName}'");
	in
		drvBuilder (hudCfg.${hudName})
