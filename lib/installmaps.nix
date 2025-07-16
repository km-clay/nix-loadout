
{ lib, pkgs }:

mapCfg: 
	let
		mapPacks = import ./mappacks.nix { inherit lib pkgs; };

		enabledPacks = lib.filter (v: v != null) (
			lib.mapAttrsToList (name: cfg:
				if builtins.isList cfg then null
				else if cfg then name else null
			) mapCfg
		);

		packDerivs = map (name: mapPacks.${name}) enabledPacks;

		allMaps = packDerivs ++ (mapCfg.maps.extraMaps or []);
	in
		pkgs.runCommand "tf2nix-addons" { } ''
		mkdir -p $out/maps
		${lib.concatStringsSep "\n" (map (plugin: ''
				cp -R ${plugin}/* $out/maps
			'') allMaps
			)
		}
		''
