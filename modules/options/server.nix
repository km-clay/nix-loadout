{ lib }:

let
	cvars = import ../../lib/cvar.nix { inherit lib; };
in
{
	cheats = cvars.cvarBool "cheats" "Enable cheats on the server.";
}
