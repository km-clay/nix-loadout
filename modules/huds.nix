{ lib }:

{
	ahud-cc = lib.mkOption {
		type = lib.types.submodule {
			options = {
				enable = lib.mkEnableOption "Install ahud-cc";
			};
		};
		default = {};
		description = "Install and configure ahud-cc.";
	};
}
