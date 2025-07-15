{ lib }:

{
	fov = lib.mkOption {
		type = lib.types.nullOr lib.types.int;
		default = null;
		description = "Field of view for the game. Set to null for default value.";
	};
	extraConfig = lib.mkOption {
		type = lib.types.lines;
		default = "";
		description = "Additional configuration options for the game. Each line is a separate option.";
	};
}
