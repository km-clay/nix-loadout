{ lib, config, ... }:

let
	tf2Opts = import ./options { inherit lib; };
  renderers = {
    fov = v: "fov_desired ${toString v}";
    drawViewmodel = v: "r_drawviewmodel ${if v then "1" else "0"}";
  };

  renderIfSet = cfg: key:
    if cfg ? ${key} && cfg.${key} != null && lib.hasAttr key renderers
    then renderers.${key} cfg.${key}
    else null;

  renderConfig = cfg: lib.concatStringsSep "\n" (
    builtins.filter (x: x != null) (
      [
        (renderIfSet cfg "fov")
        (renderIfSet cfg "drawViewmodel")
      ] ++ lib.optional (cfg.extraConfig != "") ''
        // Extra configuration
        ${cfg.extraConfig}
      ''
    )
  );
in
{
	options.tf2Nix = tf2Opts // {
		renderedCfg = lib.mkOption {
			type = lib.types.str;
			description = "Full autoexec.cfg output";
			default = (renderConfig config.tf2Nix);
		};
	};
}
