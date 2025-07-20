{ pkgs, lib, ... }:
let
  tf2Nix = import ./modules;
  tweakDefs = import ../../lib/tweaks.nix { inherit lib; };
  hudImporter = import ../../lib/installhud.nix { inherit lib pkgs; };
  sourceModInstaller = import ../../lib/installsrcmod.nix { inherit lib pkgs; };
  mapInstaller = import ../../lib/installmaps.nix { inherit lib pkgs; };
  renderConfig = cfg: opts: (import ./scriptbuild/render.nix { inherit lib cfg opts; });
in
{
  buildConfig = modules:
    let
      tf2Config = lib.evalModules {
        modules = [ tf2Nix ] ++ modules;
      };
    in
      import ./scriptbuild {
        inherit pkgs lib tf2Config tweakDefs renderConfig hudImporter mapInstaller sourceModInstaller;
      };
}
