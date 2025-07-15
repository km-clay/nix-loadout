{ config, ... }:

{
	config = {
		tweaks = {
			nullCancelMovement = true;
		};
		autoexec = {
			exec = [
				"gfx"
				"settings"
				"network"
				"tweaks"
				"default"
			];
		};
		class = {
			scout = {
				exec = [ "default" ];
			};
			soldier = {
				exec = [ "default" ];
			};
			pyro = {
				exec = [ "default" ];
			};
			demoman = {
				exec = [ "default" ];
			};
			heavyweapons = {
				exec = [ "default" ];
			};
			engineer = {
				exec = [ "default" ];
			};
			medic = {
				exec = [ "default" ];
			};
			sniper = {
				exec = [ "default" ];
			};
			spy = {
				exec = [ "default" ];
			};
		};
		cfgFiles = {

			"default" = {
				bind = {
					"f".cmd = "+inspect";
					"z".cmd = "voice_menu_1";
					"x".cmd = "voice_menu_2";
					"c".cmd = "voice_menu_3";

					"f1".cmd = "load_itempreset 0";
					"f2".cmd = "load_itempreset 1";
					"f3".cmd = "load_itempreset 2";
					"f4".cmd = "load_itempreset 3";

					"r" = {
						toggle = true;
						cmd = "r_drawviewmodel";
					};

					"alt".cmd = "+joinclass";
					"ralt".cmd = "+joinclass";

				};
				sensitivity = 1.5;
			};

			"network" = {
				rate = 196608;
				client = {
					updateRate = 66;
					cmdRate = 66;
					interp = 0.0;
					interpRatio = 1.0;
					smooth = true;
				};
			};

			"settings" = {
				fovDesired = 90;
				hud = {
					fastSwitch = true;
					classAutoKill = false;
					medic = {
						autoCallers = {
							enable = true;
							threshold = 59;
						};
						healthTargetMarker = true;
					};

					combatText = {
						batching = {
							enable = true;
							window = 0.7;
						};
					};
				};
				teamFortress = {
					mvm.tabsDiscovered = 3;
					coach.requestNeverShowAgain = true;
					showMapsDetailsExplanationCount = 0;
					matchmakingTicketHelp = false;
					compWelcomeHideForever = true;
					casualWelcomeHideForever = true;
					medigunAutoHeal = true;
					simpleDisguiseMenu = true;
					sniperFullChargeBell = true;
					hud = {
						noCrosshairOnScopeZoom = true;
					};
					scoreboardPingAsText = true;
					training = {
						hasPromptedFor = {
							forums = true;
							loadout = true;
							offlinePractice = true;
							options = true;
							training = true;
						};
					};
					explanations = {
						backpackPanel = true;
						charInfoArmoryPanel = true;
						charInfoPanel = true;
						craftingPanel = true;
						discardPanel = true;
						store = true;
					};
					showPresetExplanationInClassLoadout = false;
					showTauntExplanationInClassLoadout = false;
					hitsound = {
						enable = true;
						repeatDelay = 0.0;
						volume = 1.0;
						pitchMinDamage = 144;
						pitchMaxDamage = 19;
						enableKillsound = true;
						killsound = {
							volume = 0.6;
							pitchMinDamage = 100;
							pitchMaxDamage = 100;
						};
					};
					remember = {
						activeWeapon = true;
						lastSwitched = true;
					};
				};
				mouse = {
					rawInput = true;
				};
				demoSupport = {
					mode = 3;
					dir = "demos";
					notifyMode = 1;
					sound = true;
					minStreak = 4;
				};
				client = {
					training = {
						completedWithClasses = 511;
					};
					ask = {
						blacklistOptOut = true;
						favoriteOptOut = true;
					};
					hud = {
						playerClassPlayermodelShowedConfirmDialog = true;
						playerClassUsePlayermodel = true;
					};
					autoReload = true;
					autoRezoom = true;
					disableHtmlMotd = false;
					useTournamentSpecGui = true;
				};
			};

			"gfx" = {
				# todo
			};
		};
	};
}
