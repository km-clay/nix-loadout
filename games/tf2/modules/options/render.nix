{ lib, cvars }:

{
	AvgLight = cvars.cvarInt "avglight" "";
	decals = cvars.cvarInt "decals" "";
	eyeGlintLodPixels = cvars.cvarInt "eyeglintlodpixels" "";
	lod = cvars.cvarInt "lod" "";
	maxModelDecal = cvars.cvarInt "maxmodeldecal" "";
	radiosity = cvars.cvarInt "radiosity" "";
	rainRadius = cvars.cvarInt "rainradius" "";
	rainSplashPercentage = cvars.cvarInt "rainsplashpercentage" "";
	rootLod = cvars.cvarInt "rootlod" "";
	fastZReject = cvars.cvarInt "fastzreject" "";
	shadows = cvars.cvarPrefix "shadow" {
		enable = cvars.cvarBool "s" ""; # the command is "r_shadows", so the suffix is literally just the letter s
		renderToTexture = cvars.cvarBool "rendertotexture" "";
		maxRendered = cvars.cvarInt "maxrendered" "";
	};
	water = {
		drawReflection = cvars.cvarBool "drawreflection" "";
		drawRefraction = cvars.cvarBool "drawrefraction" "";
		forceExpensive = cvars.cvarBool "forceexpensive" "";
		forceReflectEntities = cvars.cvarBool "forcereflectentities" "";
	};
	pixelFog = cvars.cvarBool "pixelfog" "";
	queue = cvars.cvarPrefix "queued_" {
		decals = cvars.cvarBool "decals" "";
		ropes = cvars.cvarBool "ropes" "";
		postProcessing = cvars.cvarBool "post_processing" "";
	};
	threading = cvars.cvarPrefix "threaded_" {
		clientShadowManager = cvars.cvarBool "client_shadow_manager" "";
		particles = cvars.cvarBool "particles" "";
		renderables = cvars.cvarBool "renderables" "";
	};
}
