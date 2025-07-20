{ lib, cvars }:

{
	fastSwitch = cvars.cvarBool "fastswitch" "";
	classAutoKill = cvars.cvarBool "classautokill" "";
	medic = cvars.cvarPrefix "medic" {
		healthTargetMarker = cvars.cvarBool "healthtargetmarker" "";
		autoCallers = cvars.cvarPrefix "autocallers" {
			enable = cvars.cvarBool "" ""; # the command to enable it is literally "hud_medicautocallers" so no need to add a suffix here
			threshold = cvars.cvarInt "threshold" "";
		};
	};
	combatText = cvars.cvarPrefix "combattext_" {
		batching = cvars.cvarPrefix "batching" {
			enable = cvars.cvarBool "" ""; # same here, we've already constructed it
			window = cvars.cvarFloat "window" "";
		};
	};
}
