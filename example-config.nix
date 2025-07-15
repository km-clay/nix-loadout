{ config, ... }:

{
	config = {
		sound.hitsound = builtins.path { path = ./hitsound.wav; };
		sound.killsound = builtins.path { path = ./killsound.wav; };
		hud.ahud-cc = {
			enable = true;
		};
		enableTweaks = {
			nullCancelMovement = true;
			tabGraph = true;
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
				extraPrefixConfig = "exec default"; # must be executed first - will wipe these binds/aliases otherwise
				alias = {
					"dispenser" = "build 0";
					"entrance" = "build 1";
					"sentry" = "build 2";
					"tele_exit" = "build 3";
					"+toggle_destroy" = "alias dispenser destroy 0; alias entrance destroy 1; alias sentry destroy 2; alias tele_exit destroy 3";
					"-toggle_destroy" = "alias dispenser build 0; alias entrance build 1; alias sentry build 2; alias tele_exit build 3";
				};
				bind = {
					"c".cmd = "dispenser";
					"x".cmd = "tele_exit";
					"f".cmd = "sentry";
					"z".cmd = "entrance";
					"shift".cmd = "+toggle_destroy";
				};
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
				fpsMax = 300;
				client = {
					showFps = true;
					ejectBrass = true;
					newImpactEffects = true;
					burningGibs = true;
					detailDist = 8096;
					detailFade = 0.0;
					maxRenderableDist = 8096;
					physPropsMax = 1024;
					ragdollCollide = true;
					forcePreload = true;
					loadOnDemandDefault = false;
				};
				render = {
					AvgLight = 3;
					decals = 4096;
					eyeGlintLodPixels = 4;
					lod = 0;
					maxModelDecal = 4096;
					radiosity = 3;
					rainRadius = 2250;
					rainSplashPercentage = 100;
					rootLod = 0;
					pixelFog = true;
					fastZReject = -1;
					queue = {
						decals = false;
						ropes = true;
						postProcessing = false;
					};
					threading = {
						clientShadowManager = true;
						particles = true;
						renderables = true;
					};
					shadows = {
						enable = true;
						maxRendered = 1024;
						renderToTexture = true;
					};
					water = {
						drawReflection = true;
						drawRefraction = true;
						forceExpensive = true;
						forceReflectEntities = true;
					};
				};
				material = {
					useCompressedHdrTextures = true;
					phong = false;
					aaQuality = 2;
					antiAlias = 8;
					bumpMap = true;
					compressedTextures = true;
					envMapSize = 512;
					envMapTgaSize = 512;
					forceAnIso = 16;
					hdrLevel = 2;
					monitorGamma = 2.2;
					specular = true;
					parallaxMap = true;
					picmip = -1;
					postProcessX = 8;
					postProcessY = 8;
					reduceFillRate = false;
					waterOverlaySize = 512;
					viewportScale = 1.0;
					viewportUpscale = 1.0;
					clipZ = true;
					forceHardwareSync = false;
					levelFlush = true;
					vSync = false;
					queueMode = -1;

					motionBlur = {
						enable = false;
						forwardEnabled = false;
						strength = 0.0;
					};

					softwareAntiAlias = {
						blurOnePixelLines = 0.5;
						edgeThreshold = 0.8;
						quality = 2;
						strength = 2;
						strengthVgui = 2;
					};
				};
				multiplayer = {
					decals = 4096;
					useHwmModels = true;
					useHwmVcds = true;
				};
				lod = {
					transitionDist = 6400.0;
				};
				server = {
					cheats = true;
				};
				extraPostfixConfig = ''
					echo "TF2Nix gfx config loaded."
				'';
			};
		};
	};
}
