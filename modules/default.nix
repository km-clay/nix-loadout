{ lib, config, ... }:

let
  tf2Opts = import ./options { inherit lib; };
  tf2Submodule = lib.types.submodule { options = tf2Opts; };
in
{
  options.autoexec = tf2Opts;

  options.class = lib.genAttrs [
    "scout"
    "soldier"
    "pyro"
    "demoman"
    "heavyweapons"
    "engineer"
    "medic"
    "sniper"
    "spy"
  ] (name: lib.mkOption {
    type = tf2Submodule;
    default = {};
    description = "Configuration options for the ${name} class.";
  });

  options.cfgFiles = lib.mkOption {
    type = lib.types.attrsOf tf2Submodule;
    default = {};
    description = "Additional config files, each with a set of TF2 options.";
  };
}
