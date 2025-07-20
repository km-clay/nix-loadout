{ lib }:

let
	cvars = import ../../lib/cvar.nix { inherit lib; };
in
{
	rawInput = cvars.cvarBool "rawinput" "";
}
