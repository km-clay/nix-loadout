{ lib }:

let
	cvars = import ../../lib/cvar.nix { inherit lib; };
in
{
	decals = cvars.cvarInt "decals" "";
	useHwmModels = cvars.cvarBool "usehwmmodels" "";
	useHwmVcds = cvars.cvarBool "usehwmvcds" "";
}
