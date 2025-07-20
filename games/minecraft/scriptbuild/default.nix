{ pkgs, lib, mcConfig }:

let
  cfg = mcConfig.config;
  opts = mcConfig.options;
  rendered = import ./render.nix { inherit lib cfg opts; };
in
pkgs.runCommand "nix-loadout-minecraft" { } ''
  mkdir -p $out
  echo '${rendered}' > $out/server.properties
''
