{ pkgs, lib, ... }:
let
  minecraftNix = import ./modules;
in
{
  buildConfig = modules:
    let
      mcConfig = lib.evalModules {
        modules = [ minecraftNix ] ++ modules;
      };
    in
      import ./scriptbuild {
        inherit pkgs lib mcConfig;
      };
}
