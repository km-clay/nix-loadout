{ config, ... }:

{
	config.tf2Nix = {
		fovDesired = 90;
		server = {
			cheats = true;
		};
		render = {
			motionBlur = {
				enable = true;
				enableForward = false;
				strength = 0.5;
			};
		};
		bind = {
			"z".cmd = "echo foo";
			"x" = {
				toggle = true;
				cmd = "sv_cheats";
			};
		};
		alias = {
			"foo" = "echo bar";
		};
		exec = [
			"some_file"
			"some_other_file"
		];
	};
}
