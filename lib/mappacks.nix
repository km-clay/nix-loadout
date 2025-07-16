{ lib, pkgs }:

let 
	packMaps = name: maps:
		pkgs.runCommand name { } ''
			mkdir -p $out
			${lib.concatStringsSep "\n" (lib.mapAttrsToList (mapName: mapUrl: ''
				cp ${mapUrl} $out/${mapName}.bsp
			'') maps)}
		'';
in
{
	mge = 
		let
			maps = {
				mge_training_v8_beta4b = pkgs.fetchurl {
					url = "http://fastdl.serveme.tf/maps/mge_training_v8_beta4b.bsp";
					sha256 = "sha256-PAD7xsY8lyg0+YJOjV1eOUpmuRX2KmMIiDsVLdjWTLI=";
				};
				mge_chillypunch_final4_fix2 = pkgs.fetchurl {
					url = "http://fastdl.serveme.tf/maps/mge_chillypunch_final4_fix2.bsp";
					sha256 = "sha256-6uUrwW1suHKTjme0/JuEXJ8ifl1ERhQlRGX+ZTBICg4=";
				};
			};
		in
			packMaps "tf2nix-maps-mge" maps;
	proMaps = 
		let
			maps = {
				koth_product_final = pkgs.fetchurl {
					url = "http://fastdl.serveme.tf/maps/koth_product_final.bsp";
					sha256 = "sha256-82zj1DN3zHhoIcQ+RMzIjulUm3yzDW55PTFhNMa1mwM=";
				};
				cp_granary_pro_rc8 = pkgs.fetchurl {
					url = "http://fastdl.serveme.tf/maps/cp_granary_pro_rc8.bsp";
					sha256 = "sha256-C9aOrbrBMarhNVGHov8UMo82dfYWms+wr+wA9M2k4Qc=";
				};
				cp_snakewater_final1 = pkgs.fetchurl {
					url = "http://fastdl.serveme.tf/maps/cp_snakewater_final1.bsp";
					sha256 = "sha256-8J1AbSu+OXyPnfnKF/EbNrU9QPz1fj8VMuya+BGyoes=";
				};
				cp_gullywash_f9 = pkgs.fetchurl {
					url = "http://fastdl.serveme.tf/maps/cp_gullywash_f9.bsp";
					sha256 = "sha256-BgaQbICXVuP0ChFrZtIi7ZKQc/Y2+cOxssXbv5y8mls=";
				};
				cp_metalworks_f4 = pkgs.fetchurl {
					url = "http://fastdl.serveme.tf/maps/cp_metalworks_f4.bsp";
					sha256 = "sha256-Ny0QfDUnbhVyLVyiVdW2y0Yv0OMiMWUDKo4ocdUd6HI=";
				};
				cp_sunshine = pkgs.fetchurl {
					url = "http://fastdl.serveme.tf/maps/cp_sunshine.bsp";
					sha256 = "sha256-yprX0B9GESq7xbAvPRRPrYM+ag/zvYKh//OPqNPDJHQ=";
				};
				cp_process_f11 = pkgs.fetchurl {
					url = "http://fastdl.serveme.tf/maps/cp_process_f11.bsp";
					sha256 = "sha256-vafHG1dTDTGouu5BlxiStLgD0v+BFHGzfz52YkN+hM4=";
				};
				koth_clearcut_b15d = pkgs.fetchurl {
					url = "http://fastdl.serveme.tf/maps/koth_clearcut_b15d.bsp";
					sha256 = "sha256-Ie5DzPb2iqnzmxSC5K6OyK4ceoWk3Ur35yHY4KJ4hSM=";
				};
				cp_sultry_b6a = pkgs.fetchurl {
					url = "http://fastdl.serveme.tf/maps/cp_sultry_b8.bsp";
					sha256 = "sha256-0+EGDnnuYwfbusnOBz8Svpll+XZbKZhAuL0ok3kwy9w=";
				};
			};
		in
			packMaps "tf2nix-maps-promaps" maps;
}
