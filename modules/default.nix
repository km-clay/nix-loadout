{ lib, config, ... }:

let
  tf2Opts = import ./options { inherit lib; };
  tf2Submodule = lib.types.submodule { options = tf2Opts; };
in
{
	options = {
		
		sound = lib.mkOption {
			type = lib.types.submodule {
				options = {
					hitsound = lib.mkOption {
						type = lib.types.nullOr lib.types.package;
						default = null;
						description = "Custom hitsound package. If set, it will override the default hitsound. 'hitsound.wav' must be in the root directory of the derivation.";
					};
					killsound = lib.mkOption {
						type = lib.types.nullOr lib.types.package;
						default = null;
						description = "Custom killsound package. If set, it will override the default killsound. 'killsound.wav' must be in the root directory of the derivation.";
					};
				};
			};
			default = {};
			description = "Sound configuration.";
		};
		
		hud = lib.mkOption {
			type = lib.types.submodule {
				options = import ./huds.nix { inherit lib; };
			};
			default = {};
			description = "Install and configure HUDs.";
		};

		enableTweaks = lib.mkOption {
			type = lib.types.attrsOf lib.types.bool;
			default = {};
			description = "Enable specific tweak configurations";
		};

		autoexec = tf2Opts;

		class = lib.genAttrs [
			"scout"
			"soldier"
			"pyro"
			"demoman"
			"heavyweapons"
			"engineer"
			"medic"
			"sniper"
			"spy"
		] (name: lib.mkOption {
			type = tf2Submodule;
			default = {};
			description = "Configuration options for the ${name} class.";
		});

		cfgFiles = lib.mkOption {
			type = lib.types.attrsOf tf2Submodule;
			default = {};
			description = "Additional config files, each with a set of TF2 options.";
		};
	};
}
