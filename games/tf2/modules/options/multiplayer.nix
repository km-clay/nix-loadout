{ lib, cvars }:

{
	decals = cvars.cvarInt "decals" "";
	useHwmModels = cvars.cvarBool "usehwmmodels" "";
	useHwmVcds = cvars.cvarBool "usehwmvcds" "";
	winLimit = cvars.cvarInt "winlimit" "";
	timeLimit = cvars.cvarInt "timelimit" "";
	winDifference = cvars.cvarInt "windifference" "";
	maxRounds = cvars.cvarInt "maxrounds" "";
	roundTime = cvars.cvarInt "roundtime" "";
	tournament = cvars.cvarPrefix "tournament" {
		enable = cvars.cvarBool "" "";
		whitelist = cvars.cvarString "_whitelist" "";
	};
}
