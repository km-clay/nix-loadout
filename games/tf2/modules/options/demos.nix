{ lib, cvars }:

{
	mode = cvars.cvarInt "enable" "";
	dir = cvars.cvarString "dir" "";
	notifyMode = cvars.cvarInt "notify" "";
	sound = cvars.cvarBool "sound" "";
	minStreak = cvars.cvarInt "min_streak" "";
}
