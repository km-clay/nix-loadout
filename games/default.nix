{ pkgs, lib, ... }:

{
  tf2 = import ./tf2 { inherit pkgs lib; };
  minecraft = import ./minecraft { inherit pkgs lib; };
}
