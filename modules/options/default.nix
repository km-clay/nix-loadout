{ lib }:

let
	bool = lib.types.bool;
	int = lib.types.int;
	str = lib.types.str;
	float = lib.types.float;
	submodule = lib.types.submodule;
	cvars = import ../../lib/cvar.nix { inherit lib; };
in
{
	render       = cvars.cvarPrefix "r_"     (import ./render.nix {inherit lib;});
	server       = cvars.cvarPrefix "sv_"    (import ./server.nix {inherit lib;});
	client       = cvars.cvarPrefix "cl_"    (import ./client.nix {inherit lib;});
	hud          = cvars.cvarPrefix "hud_"   (import ./hud.nix {inherit lib;});
	material     = cvars.cvarPrefix "mat_"   (import ./material.nix {inherit lib;});
	multiplayer  = cvars.cvarPrefix "mp_"    (import ./multiplayer.nix {inherit lib;});
	teamFortress = cvars.cvarPrefix "tf_"    (import ./teamfortress.nix {inherit lib;});
	network      = cvars.cvarPrefix "net_"   (import ./network.nix {inherit lib;});
	sound        = cvars.cvarPrefix "snd_"   (import ./sound.nix {inherit lib;});
	voice        = cvars.cvarPrefix "voice_" (import ./voice.nix {inherit lib;});
	mouse        = cvars.cvarPrefix "m_"     (import ./mouse.nix {inherit lib;});
	demoSupport  = cvars.cvarPrefix "ds_"    (import ./demos.nix {inherit lib;});

	fovDesired = cvars.cvarInt "fov_desired" "Desired field of view for the game.";
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

	rate = cvars.cvarInt "rate" "";
	sensitivity = cvars.cvarFloat "sensitivity" "Mouse sensitivity.";
}
