{ pkgs, lib, ... }:

{
  tf2 = import ./tf2.nix { inherit pkgs lib; };
}
