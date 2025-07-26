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
					sha256 = "sha256-1kqjwIjvakE5OzoKHeEs9TbZfgS1Y/DrwD34NE249U4=";
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
				sha256 = "sha256-STQGRD5O1y6cXBjS1A57Vj6o0kxMlg69ANN9zl2KMd4=";
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
				sha256 = "sha256-H8H0pGZQKC4jnWxCdPYmzxVW4O/Pod5sXEZ0bwdk/3o=";
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
				sha256 = "sha256-cUMHtN7DTSgd/FTmJxGxD7OI2Az6vMrBFKWu257Ntqw=";
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
				sha256 = "sha256-VvVjX90w5UKFtMgB3xha/nC1V/xJuW5cQWHHdgD76+Q=";
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
				sha256 = "sha256-VqhEX2mPDgnq1t8OrOEPRAYX1upqODxPlyx8CrkIXD4=";
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
				sha256 = "sha256-Mntah9OlonL73lP2gxeCMW9NSpZYHzQhcgPLqj/xxxE=";
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
				sha256 = "sha256-ihKKTFo07LLGmASRRpvFJqP4QVL822z+eFy8uLpCxqs=";
			};
		in
			pkgs.runCommand "srcmod-fix-stv-slots" {
				nativeBuildInputs = [ pkgs.unzip ];
			} ''
				mkdir -p $out/addons/sourcemod/plugins
				unzip ${src} -d $out/addons/sourcemod/plugins
			'';
}
