{ lib, config, ... }:

let
	tf2Opts = import ./options { inherit lib; };
in
{
	options.tf2Nix = tf2Opts;
}
