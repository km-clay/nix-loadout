{ lib, config, ... }:

let
  tf2Opts = import ./options { inherit lib; };
  tf2Submodule = lib.types.submodule { options = tf2Opts; };
in
{
	options = {
		custom = {
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

		global = {
			autoexec = tf2Opts;

			installMaps = lib.mkOption {
				type = lib.types.submodule {
					options = {
						mge = lib.mkEnableOption "Install MGE maps.";
						proMaps = lib.mkEnableOption "Install common competitive 6v6 maps.";
						extraMaps = lib.mkOption {
							type = lib.types.listOf lib.types.package;
							default = [];
							description = "Additional maps to install. Each map should be a package containing the map file. The top-level contents of the package derivation will be copied directly to tf/maps.";
						};
					};
				};
				default = {};
				description = "Map installation configuration.";
			};

			sourcemod = lib.mkOption {
				type = lib.types.submodule {
					options = {
						enable = lib.mkEnableOption "Install sourcemod.";
						plugins = lib.mkOption {
							type = lib.types.submodule {
								options = {
									fixStvSlot = lib.mkOption {
										type = lib.types.submodule {
											options = {
												enable = lib.mkEnableOption "Install the FixSTVSlot plugin.";
												package = lib.mkOption {
													type = lib.types.nullOr lib.types.package;
													default = null;
													description = "Package containing the FixSTVSlot plugin. If set, it will override the default plugin.";
												};
											};
										};
										default = {};
										description = "Fix STV Slots plugin configuration.";
									};
									restoreScore = lib.mkOption {
										type = lib.types.submodule {
											options = {
												enable = lib.mkEnableOption "Install the Restore Score plugin.";
												package = lib.mkOption {
													type = lib.types.nullOr lib.types.package;
													default = null;
													description = "Package containing the Restore Score plugin. If set, it will override the default plugin.";
												};
											};
										};
										default = {};
										description = "Restore Score plugin configuration.";
									};
									afk = lib.mkOption {
										type = lib.types.submodule {
											options = {
												enable = lib.mkEnableOption "Install the AFK plugin.";
												package = lib.mkOption {
													type = lib.types.nullOr lib.types.package;
													default = null;
													description = "Package containing the AFK plugin. If set, it will override the default plugin.";
												};
											};
										};
										default = {};
										description = "AFK plugin configuration.";
									};
									waitForStv = lib.mkOption {
										type = lib.types.submodule {
											options = {
												enable = lib.mkEnableOption "Install the Wait for STV plugin.";
												package = lib.mkOption {
													type = lib.types.nullOr lib.types.package;
													default = null;
													description = "Package containing the Wait for STV plugin. If set, it will override the default plugin.";
												};
											};
										};
										default = {};
										description = "Wait for STV plugin configuration.";
									};
									recordStv = lib.mkOption {
										type = lib.types.submodule {
											options = {
												enable = lib.mkEnableOption "Install the Record STV plugin.";
												package = lib.mkOption {
													type = lib.types.nullOr lib.types.package;
													default = null;
													description = "Package containing the Record STV plugin. If set, it will override the default plugin.";
												};
											};
										};
										default = {};
										description = "Record STV plugin configuration.";
									};
									pause = lib.mkOption {
										type = lib.types.submodule {
											options = {
												enable = lib.mkEnableOption "Install the Pause plugin.";
												package = lib.mkOption {
													type = lib.types.nullOr lib.types.package;
													default = null;
													description = "Package containing the Pause plugin. If set, it will override the default plugin.";
												};
											};
										};
										default = {};
										description = "Pause plugin configuration.";
									};
									logsTf = lib.mkOption {
										type = lib.types.submodule {
											options = {
												enable = lib.mkEnableOption "Install the LogsTF plugin. Don't forget to set the logstf_apikey convar in your server.cfg!";
												package = lib.mkOption {
													type = lib.types.nullOr lib.types.package;
													default = null;
													description = "Package containing the LogsTF plugin. If set, it will override the default plugin.";
												};
											};
										};
										default = {};
										description = "LogsTF plugin configuration.";
									};
									supStats2 = lib.mkOption {
										type = lib.types.submodule {
											options = {
												enable = lib.mkEnableOption "Install the SupStats2 plugin.";
												package = lib.mkOption {
													type = lib.types.nullOr lib.types.package;
													default = null;
													description = "Package containing the SupStats2 plugin. If set, it will override the default plugin.";
												};
											};
										};
										default = {};
										description = "SupStats2 plugin configuration.";
									};
									medicStats = lib.mkOption {
										type = lib.types.submodule {
											options = {
												enable = lib.mkEnableOption "Install the Medic Stats plugin.";
												package = lib.mkOption {
													type = lib.types.nullOr lib.types.package;
													default = null;
													description = "Package containing the Medic Stats plugin. If set, it will override the default plugin.";
												};
											};
										};
										default = {};
										description = "Medic Stats plugin configuration.";
									};
									rglServerResourcesUpdater = lib.mkOption {
										type = lib.types.submodule {
											options = {
												enable = lib.mkEnableOption "Install the RGL Server Resources Updater plugin.";
												package = lib.mkOption {
													type = lib.types.nullOr lib.types.package;
													default = null;
													description = "Package containing the RGL Server Resources Updater plugin. If set, it will override the default plugin.";
												};
											};
										};
										default = {};
										description = "RGL Server Resources Updater plugin configuration.";
									};
									extraPlugins = lib.mkOption {
										type = lib.types.listOf lib.types.package;
										default = [];
										description = "Additional Sourcemod plugins to install. Each plugin should be a derivation containing the plugin files. The directory structure of the derivation should be set such that the sourcemod directory is the root directory.";
									};
								};
							};
							default = {};
							description = "Sourcemod plugins to install. Each plugin should be a package containing the plugin files.";
						};
					};
				};
				default = {};
				description = "Sourcemod configuration.";
			};

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
	};
}
