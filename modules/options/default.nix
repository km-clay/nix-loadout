{ lib }:

let
	bool = lib.types.bool;
	int = lib.types.int;
	str = lib.types.str;
	float = lib.types.float;
	submodule = lib.types.submodule;
	cvar = { name, type, desc ? "", extra ? {} }:
		let
			opt = lib.mkOption {
				type = lib.types.nullOr type;
				default = null;
				description = desc;
			};
		in opt // { _cvarName = name; } // extra;

	cvarBool = name: desc: cvar { inherit name desc; type = bool; extra = { prefix = false; }; };
	cvarInt = name: desc: cvar { inherit name desc; type = int; extra = { prefix = false; }; };
	cvarString = name: desc: cvar { inherit name desc; type = str; extra = { prefix = false; }; };
	cvarFloat = name: desc: cvar { inherit name desc; type = float; extra = { prefix = false; }; };
	cvarPrefix = name: cvars: cvar { inherit name; type = submodule { options = cvars; }; extra = { prefix = true; }; };
in
{
	fovDesired = cvarInt "fov_desired" "Desired field of view for the game.";
	extraConfig = lib.mkOption {
		type = lib.types.lines;
		default = "";
		description = "Additional configuration options for the game. Each line is a separate option.";
	};
		exec = lib.mkOption {
			type = lib.types.listOf lib.types.str;
			default = [];
			description = "List of config names to execute.";
		};

		alias = lib.mkOption {
			type = lib.types.attrsOf lib.types.str;
			default = {};
			description = "Command aliases.";
		};

		bind = lib.mkOption {
			type = lib.types.attrsOf (lib.types.submodule {
				options = {
					cmd = lib.mkOption {
						type = lib.types.str;
						description = "Command to bind to the key.";
					};
					toggle = lib.mkOption {
						type = lib.types.bool;
						default = false;
						description = "If true, the given convar will alternate between 1 and 0. Only really works with switch-like convars like sv_cheats.";
					};
				};
			});
			default = {};
			description = "Key bindings. Set the command using the 'cmd' option with a command string, and set as a bindToggle by using the 'toggle' option.";
	};
	server = cvarPrefix "sv_" {
		cheats = cvarBool "cheats" "Enable cheats on the server.";
	};
	render = cvarPrefix "r_" {
		motionBlur = cvarPrefix "motion_blur_" {
			enable = cvarBool "enable" "Enable motion blur effect.";
			enableForward = cvarBool "enable_forward" "Enable motion blur when moving forward.";
			strength = cvarFloat "strength" "Strength of the motion blur effect.";
		};
	};
}
