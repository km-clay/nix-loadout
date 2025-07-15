{ lib }:

let
	cvars = import ../../lib/cvar.nix { inherit lib; };
in
{
	explanations = cvars.cvarPrefix "explanations_" {
		backpackPanel = cvars.cvarBool "backpackpanel" "";
		charInfoArmoryPanel = cvars.cvarBool "charinfo_armory_panel" "";
		charInfoPanel = cvars.cvarBool "charinfopanel" "";
		craftingPanel = cvars.cvarBool "craftingpanel" "";
		discardPanel = cvars.cvarBool "discardpanel" "";
		store = cvars.cvarBool "store" "";
	};
	training = cvars.cvarPrefix "training_" {
		hasPromptedFor = cvars.cvarPrefix "has_prompted_for_" {
			forums = cvars.cvarBool "forums" "";
			loadout = cvars.cvarBool "loadout" "";
			offlinePractice = cvars.cvarBool "offline_practice" "";
			options = cvars.cvarBool "options" "";
			training = cvars.cvarBool "training" "";
		};
	};
	mvm = cvars.cvarPrefix "mvm_" {
		tabsDiscovered = cvars.cvarInt "tabs_discovered" "";
	};
	coach = cvars.cvarPrefix "coach_" {
		requestNeverShowAgain = cvars.cvarBool "request_nevershowagain" "";
	};
	casualWelcomeHideForever = cvars.cvarBool "casual_welcome_hide_forever" "";
	compWelcomeHideForever = cvars.cvarBool "comp_welcome_hide_forever" "";
	matchmakingTicketHelp = cvars.cvarBool "matchmaking_ticket_help" "";
	showMapsDetailsExplanationCount = cvars.cvarInt "show_maps_details_explanation_count" "";
	showPresetExplanationInClassLoadout = cvars.cvarBool "show_preset_explanation_in_class_loadout" "";
	showTauntExplanationInClassLoadout = cvars.cvarBool "show_taunt_explanation_in_class_loadout" "";
	colorblindAssist = cvars.cvarBool "colorblind_assist" "";
	medigunAutoHeal = cvars.cvarBool "medigun_autoheal" "";
	simpleDisguiseMenu = cvars.cvarBool "simple_disguise_menu" "";
	sniperFullChargeBell = cvars.cvarBool "sniper_fullcharge_bell" "";
	scoreboardPingAsText = cvars.cvarBool "scoreboard_ping_as_text" "";
	hud = cvars.cvarPrefix "hud_" {
		noCrosshairOnScopeZoom = cvars.cvarBool "no_crosshair_on_scope_zoom" "";
	};
	hitsound = cvars.cvarPrefix "dingaling" {
		enable = cvars.cvarBool "aling" ""; # full command is "tf_dingalingaling"
		repeatDelay = cvars.cvarFloat "aling_repeat_delay" ""; # "tf_dingalingaling_repeat_delay"
		volume = cvars.cvarFloat "_volume" "";
		pitchMinDamage = cvars.cvarInt "_pitchmindamage" "";
		pitchMaxDamage = cvars.cvarInt "_pitchmaxdamage" "";
		enableKillsound = cvars.cvarBool "aling_lasthit" ""; # "tf_dingalingaling_lasthit"
		killsound = {
			volume = cvars.cvarFloat "_lasthit_volume" ""; # "tf_dingaling_lasthit_volume"
			pitchMinDamage = cvars.cvarInt "_lasthit_pitchmindamage" ""; # "tf_dingaling_lasthit_pitchmindamage"
			pitchMaxDamage = cvars.cvarInt "_lasthit_pitchmaxdamage" ""; # "tf_dingaling_lasthit_pitchmaxdamage"
		};
	};
	remember = cvars.cvarPrefix "remember_" {
		activeWeapon = cvars.cvarBool "activeweapon" "";
		lastSwitched = cvars.cvarBool "lastswitched" "";
	};
}
