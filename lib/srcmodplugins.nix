{ lib, pkgs }:

{
	rglServerResourcesUpdater =
		let
			src = pkgs.fetchurl {
				url = "https://github.com/RGLgg/server-resources-updater/releases/latest/download/server-resources-updater.zip";
				sha256 = "sha256-5NU9xSyEJyWqxJV5Wz7VXzdfc7Yqcutot2ZDUhjhLTQ=";
			};
		in
			pkgs.runCommand "srcmod-rgl-server-resources-updater" {
				nativeBuildInputs = [ pkgs.unzip ];
			} ''
				mkdir -p $out
				unzip ${src} -d $out
			'';
	medicStats =
		let
				src = pkgs.fetchurl {
					url = "http://sourcemod.krus.dk/medicstats.zip";
					# The guy hosting these files is weird about automated connections
					# So we will be telling some lies about where we are coming from c:
					curlOptsList = [
						# hello i am downloading this from firefox
						"-H" "User-Agent: Mozilla/5.0"
						# i definitely clicked this link on a teamfortress.tv forum post
						"-H" "Referer: https://www.teamfortress.tv/13598/?page=1#post-1"
					];
					sha256 = "sha256-oWtnBy5o3RcQlsH3Qm6NS/RpJ9v+wgabMvEBsq/Cwag=";
				};
		in
			pkgs.runCommand "srcmod-medic-stats" {
				nativeBuildInputs = [ pkgs.unzip ];
			} ''
				mkdir -p $out/addons/sourcemod/plugins
				unzip ${src} -d $out/addons/sourcemod/plugins
			'';
	supStats2 =
		let
			src = pkgs.fetchurl {
				url = "http://sourcemod.krus.dk/supstats2.zip";
				curlOptsList = [
					"-H" "User-Agent: Mozilla/5.0"
					"-H" "Referer: https://www.teamfortress.tv/13598/?page=1#post-1"
				];
				sha256 = "sha256-cDQDKQU0Ywb7zVDoscDB6b7s1rkAeJVBhg7lhFz69Ow=";
			};
		in
			pkgs.runCommand "srcmod-supstats2" {
				nativeBuildInputs = [ pkgs.unzip ];
			} ''
				mkdir -p $out/addons/sourcemod/plugins
				unzip ${src} -d $out/addons/sourcemod/plugins
			'';
	logsTf =
		let
			src = pkgs.fetchurl {
				url = "http://sourcemod.krus.dk/logstf.zip";
				curlOptsList = [
					"-H" "User-Agent: Mozilla/5.0"
					"-H" "Referer: https://www.teamfortress.tv/13598/?page=1#post-1"
				];
				sha256 = "sha256-h+zIHktly1CHld4eaJPJOjj+yL2qC5vo9UA6TH8OYvU=";
			};
		in
			pkgs.runCommand "srcmod-logs-tf" {
				nativeBuildInputs = [ pkgs.unzip ];
			} ''
				mkdir -p $out/addons/sourcemod/plugins
				unzip ${src} -d $out/addons/sourcemod/plugins
			'';
	pause =
		let
			src = pkgs.fetchurl {
				url = "http://sourcemod.krus.dk/pause.zip";
				curlOptsList = [
					"-H" "User-Agent: Mozilla/5.0"
					"-H" "Referer: https://www.teamfortress.tv/13598/?page=1#post-1"
				];
				sha256 = lib.fakeSha256;
			};
		in
			pkgs.runCommand "srcmod-pause" {
				nativeBuildInputs = [ pkgs.unzip ];
			} ''
				mkdir -p $out/addons/sourcemod/plugins
				unzip ${src} -d $out/addons/sourcemod/plugins
			'';
	recordStv =
		let
			src = pkgs.fetchurl {
				url = "http://sourcemod.krus.dk/recordstv.zip";
				curlOptsList = [
					"-H" "User-Agent: Mozilla/5.0"
					"-H" "Referer: https://www.teamfortress.tv/13598/?page=1#post-1"
				];
				sha256 = "sha256-BvQJLHOnMXcDhwlSdSo8qCg1KyuGNFhzWn2R1bKmy5I=";
			};
		in
			pkgs.runCommand "srcmod-record-stv" {
				nativeBuildInputs = [ pkgs.unzip ];
			} ''
				mkdir -p $out/addons/sourcemod/plugins
				unzip ${src} -d $out/addons/sourcemod/plugins
			'';
	waitForStv =
		let
			src = pkgs.fetchurl {
				url = "http://sourcemod.krus.dk/waitforstv.zip";
				curlOptsList = [
					"-H" "User-Agent: Mozilla/5.0"
					"-H" "Referer: https://www.teamfortress.tv/13598/?page=1#post-1"
				];
				sha256 = "sha256-y3x9z0k84xe6Q2/81nbbXoOd8pAFMg5QmYYodJNRaRk=";
			};
		in
			pkgs.runCommand "srcmod-wait-for-stv" {
				nativeBuildInputs = [ pkgs.unzip ];
			} ''
				mkdir -p $out/addons/sourcemod/plugins
				unzip ${src} -d $out/addons/sourcemod/plugins
			'';
	afk =
		let
			src = pkgs.fetchurl {
				url = "http://sourcemod.krus.dk/afk.zip";
				curlOptsList = [
					"-H" "User-Agent: Mozilla/5.0"
					"-H" "Referer: https://www.teamfortress.tv/13598/?page=1#post-1"
				];
				sha256 = "sha256-+BbHJ/aVrdigrPOL0LmjV17FTXwEV9vZhFfO+escgMI=";
			};
		in
			pkgs.runCommand "srcmod-afk" {
				nativeBuildInputs = [ pkgs.unzip ];
			} ''
				mkdir -p $out/addons/sourcemod/plugins
				unzip ${src} -d $out/addons/sourcemod/plugins
			'';
	restoreScore =
		let
			src = pkgs.fetchurl {
				url = "http://sourcemod.krus.dk/restorescore.zip";
				curlOptsList = [
					"-H" "User-Agent: Mozilla/5.0"
					"-H" "Referer: https://www.teamfortress.tv/13598/?page=1#post-1"
				];
				sha256 = "sha256-T72g5K+CK6pa8Wdg3iHTjTWzWZMESW5esql2VYlRcIQ=";
			};
		in
			pkgs.runCommand "srcmod-restore-score" {
				nativeBuildInputs = [ pkgs.unzip ];
			} ''
				mkdir -p $out/addons/sourcemod/plugins
				unzip ${src} -d $out/addons/sourcemod/plugins
			'';
	fixStvSlot =
		let
			src = pkgs.fetchurl {
				url = "http://sourcemod.krus.dk/fixstvslot.zip";
				curlOptsList = [
					"-H" "User-Agent: Mozilla/5.0"
					"-H" "Referer: https://www.teamfortress.tv/13598/?page=1#post-1"
				];
				sha256 = "sha256-v8KVPhvr0xybt079KjrkNkbXhnE5R9qYsCG3YD9hEw0=";
			};
		in
			pkgs.runCommand "srcmod-fix-stv-slots" {
				nativeBuildInputs = [ pkgs.unzip ];
			} ''
				mkdir -p $out/addons/sourcemod/plugins
				unzip ${src} -d $out/addons/sourcemod/plugins
			'';
}
