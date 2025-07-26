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
				sha256 = "sha256-dtsg/krIQ0pN79fLn0lGDAdA0h27KGXEgoLv3ghg0xk=";
			};
		};

		drvBuilder = hudSources.${hudName} or (throw "No build rule for HUD '${hudName}'");
	in
		drvBuilder (hudCfg.${hudName})
