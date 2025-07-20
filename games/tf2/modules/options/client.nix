{ lib, cvars }:

{
	updateRate = cvars.cvarInt "updaterate" "";
	cmdRate = cvars.cvarInt "cmdrate" "";
	interp = cvars.cvarFloat "interp" "";
	interpRatio = cvars.cvarFloat "interp_ratio" "";
	smooth = cvars.cvarBool "smooth" "";
	showFps = cvars.cvarBool "showfps" "";
	ejectBrass = cvars.cvarBool "ejectbrass" "";
	newImpactEffects = cvars.cvarBool "new_impact_effects" "";
	burningGibs = cvars.cvarBool "burninggibs" "";
	detailDist = cvars.cvarInt "detaildist" "";
	detailFade = cvars.cvarFloat "detailfade" "";
	maxRenderableDist = cvars.cvarInt "maxrenderable_dist" "";
	physPropsMax = cvars.cvarInt "phys_props_max" "";
	ragdollCollide = cvars.cvarBool "ragdoll_collide" "";
	threadedBoneSetup = cvars.cvarBool "threaded_bone_setup" "";
	threadedClientLeafSystem = cvars.cvarBool "threaded_client_leaf_system" "";
	forcePreload = cvars.cvarBool "forcepreload" "";
	loadOnDemandDefault = cvars.cvarBool "loadondemand_default" "";
	autoReload = cvars.cvarBool "autoreload" "";
	autoRezoom = cvars.cvarBool "autorezoom" "";
	useTournamentSpecGui = cvars.cvarBool "use_tournament_specgui" "";
	disableHtmlMotd = cvars.cvarBool "disablehtmlmotd" "";
	training = cvars.cvarPrefix "training_" {
		classUnlockAll = cvars.cvarBool "class_unlock_all" "";
		completedWithClasses = cvars.cvarInt "completed_with_classes" "";
	};
	hud = cvars.cvarPrefix "hud_" {
		playerClassUsePlayermodel = cvars.cvarBool "playerclass_use_playermodel" "";
		playerClassPlayermodelShowedConfirmDialog = cvars.cvarBool "playerclass_playermodel_showed_confirm_dialogue" "";
	};
	ask = cvars.cvarPrefix "ask_"  {
		blacklistOptOut = cvars.cvarBool "blacklist_opt_out" "";
		favoriteOptOut = cvars.cvarBool "favorite_opt_out" "";
	};
}
