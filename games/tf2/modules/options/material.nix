{ lib }:

let
	cvars = import ../../lib/cvar.nix { inherit lib; };
in
{
	useCompressedHdrTextures = cvars.cvarBool "use_compressed_hdr_textures" "";
	phong = cvars.cvarBool "phong" "";
	aaQuality = cvars.cvarInt "aaquality" "";
	antiAlias = cvars.cvarInt "antialias" "";
	bumpMap = cvars.cvarBool "bumpmap" "";
	compressedTextures = cvars.cvarBool "compressed_textures" "";
	envMapSize = cvars.cvarInt "envmap_size" "";
	envMapTgaSize = cvars.cvarInt "envmap_tga_size" "";
	forceAnIso = cvars.cvarInt "forceaniso" "";
	hdrLevel = cvars.cvarInt "hdr_level" "";
	monitorGamma = cvars.cvarFloat "monitor_gamma" "";
	parallaxMap = cvars.cvarBool "parallaxmap" "";
	picmip = cvars.cvarInt "picmip" "";
	postProcessX = cvars.cvarInt "postprocess_x" "";
	postProcessY = cvars.cvarInt "postprocess_y" "";
	reduceFillRate = cvars.cvarBool "reducefillrate" "";
	specular = cvars.cvarBool "specular" "";
	waterOverlaySize = cvars.cvarInt "water_overlay_size" "";
	viewportScale = cvars.cvarFloat "viewportscale" "";
	viewportUpscale = cvars.cvarFloat "viewportupscale" "";
	clipZ = cvars.cvarBool "clipz" "";
	forceHardwareSync = cvars.cvarBool "force_hardware_sync" "";
	levelFlush = cvars.cvarBool "level_flush" "";
	vSync = cvars.cvarBool "vsync" "";
	queueMode = cvars.cvarInt "queue_mode" "";
	motionBlur = cvars.cvarPrefix "motion_blur_" {
		enable = cvars.cvarBool "enabled" "";
		forwardEnabled = cvars.cvarBool "forward_enabled" "";
		strength = cvars.cvarFloat "strength" "";
	};
	softwareAntiAlias = cvars.cvarPrefix "software_aa_" {
		blurOnePixelLines = cvars.cvarFloat "blur_one_pixel_lines" "";
		edgeThreshold = cvars.cvarFloat "edge_threshold" "";
		quality = cvars.cvarInt "quality" "";
		strength = cvars.cvarInt "strength" "";
		strengthVgui = cvars.cvarInt "strength_vgui" "";
	};
}
