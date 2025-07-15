{ lib }:

let
	cvars = import ../../lib/cvar.nix { inherit lib; };
in
{
	mode = cvars.cvarInt "enable" "";
	dir = cvars.cvarString "dir" "";
	notifyMode = cvars.cvarInt "notify" "";
	sound = cvars.cvarBool "sound" "";
	minStreak = cvars.cvarInt "min_streak" "";
}
