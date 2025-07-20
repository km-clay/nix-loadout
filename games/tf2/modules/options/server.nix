{ lib }:

let
	cvars = import ../../lib/cvar.nix { inherit lib; };
in
{
	cheats = cvars.cvarBool "cheats" "Enable cheats on the server.";
	gravity = cvars.cvarInt "gravity" "Gravity setting for the server.";
	pure = cvars.cvarPrefix "pure" {
		mode = cvars.cvarInt "" "Disable user mods.";
		kickClients = cvars.cvarBool "_kick_clients" "Kick clients using mods.";
		trace = cvars.cvarBool "_trace" "Trace pure mode violations.";
		consensus = cvars.cvarBool "_consensus" "Minimum file has checks for sv_pure.";
	};
	turboPhysics = cvars.cvarBool "turbophysics" "";
	pausable = cvars.cvarBool "pausable" "Allow pausing the server.";
	allTalk = cvars.cvarBool "alltalk" "Allow all players to hear each other.";
	allowWaitCommand = cvars.cvarBool "allow_wait_command" "Allow the wait command for clients.";
	restrictAspectRatioFov = cvars.cvarBool "restrict_aspect_ratio_fov" "Restrict aspect ratio and field of view for clients.";
	allowColorCorrection = cvars.cvarBool "allow_color_correction" "Allow color correction on the server.";
	forcePreload = cvars.cvarBool "forcepreload" "Force preloading of resources on the server.";

	minCmdRate = cvars.cvarInt "mincmdrate" "Minimum command rate for clients.";
	maxCmdRate = cvars.cvarInt "maxcmdrate" "Maximum command rate for clients.";
	minRate = cvars.cvarInt "minrate" "Minimum rate for clients.";
	maxRate = cvars.cvarInt "maxrate" "Maximum rate for clients.";
	minUpdateRate = cvars.cvarInt "minupdaterate" "Minimum update rate for clients.";
	maxUpdateRate = cvars.cvarInt "maxupdaterate" "Maximum update rate for clients.";
	client = cvars.cvarPrefix "client_" {
		minInterpRatio = cvars.cvarFloat "min_interp_ratio" "Minimum interpolation ratio for clients.";
		maxInterpRatio = cvars.cvarFloat "max_interp_ratio" "Maximum interpolation ratio for clients.";
		cmdRateDifference = cvars.cvarInt "cmdrate_difference" "Allowed difference in command rate between clients.";
		predict = cvars.cvarBool "predict" "Enable client-side prediction.";
	};
	maxUserCmdProcessTicksHoldAim = cvars.cvarInt "maxusrcmdprocessticks_holdaim" "Maximum ticks to hold aim in user command processing.";
}
