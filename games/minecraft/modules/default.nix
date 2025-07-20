{ lib, config, ... }:

let
  cvars = import ../lib/cvar.nix { inherit lib; };
in
{
	options = {
    serverProperties = lib.mkOption {
      type = lib.types.submodule {
        options = {
          extraConfig = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = null;
            description = "Extra written config to include in the server.properties file";
          };
          acceptsTransfers = cvars.cvarBool "accepts-transfers" "Whether to accept incoming transfers via a transfer packet.";
          allowFlight = cvars.cvarBool "allow-flight" "Whether players can use flight on the server while in Survival mode by using mods.";
          allowNether = cvars.cvarBool "allow-nether" "Whether players can travel to the Nether.";
          broadcastConsoleToOps = cvars.cvarBool "broadcast-console-to-ops" "Whether to send console command outputs to all online operators";
          broadcastRconToOps = cvars.cvarBool "broadcast-rcon-to-ops" "";
          bugReportLink = cvars.cvarString "bug-report-link" "";
          difficulty = cvars.cvarString "difficulty" "";
          enableCommandBlock = cvars.cvarBool "enable-command-block" "";
          enableJmxMonitoring = cvars.cvarBool "enable-jmx-monitoring" "";
          enableQuery = cvars.cvarBool "enable-query" "";
          enableRcon = cvars.cvarBool "enable-rcon" "";
          enableStatus = cvars.cvarBool "enable-status" "";
          enforceSecureProfile = cvars.cvarBool "enforce-secure-profile" "";
          enforceWhitelist = cvars.cvarBool "enforce-whitelist" "";
          entityBroadcastRangePercentange = cvars.cvarInt "entity-broadcast-range-percentage" "";
          forceGamemode = cvars.cvarBool "force-gamemode" "";
          functionPermissionLevel = cvars.cvarInt "function-permission-level" "";
          gamemode = cvars.cvarString "gamemode" "";
          generateStructures = cvars.cvarBool "generate-structures" "";
          generatorSettings = cvars.cvarString "generator-settings" "";
          hardcore = cvars.cvarBool "hardcore" "";
          hideOnlinePlayers = cvars.cvarBool "hide-online-players" "";
          initialDisabledPacks = cvars.cvarString "initial-disabled-packs" "";
          initialEnabledPacks = cvars.cvarString "initial-enabled-packs" "";
          levelName = cvars.cvarString "level-name" "";
          levelSeed = cvars.cvarString "level-seed" "";
          levelType = cvars.cvarString "level-type" "";
          maxChainedNeighborUpdates = cvars.cvarInt "max-chained-neighbor-updates" "";
          maxPlayers = cvars.cvarInt "max-players" "";
          maxTickTime = cvars.cvarInt "max-tick-time" "";
          maxWorldSize = cvars.cvarInt "max-world-size" "";
          motd = cvars.cvarString "motd" "";
          networkCompressionThreshold = cvars.cvarInt "network-compression-threshold" "";
          onlineMode = cvars.cvarBool "online-mode" "";
          opPermissionLevel = cvars.cvarInt "op-permission-level" "";
          pauseWhenEmptySeconds = cvars.cvarInt "pause-when-empty-seconds" "";
          playerIdleTimeout = cvars.cvarInt "player-idle-timeout" "";
          preventProxyConnections = cvars.cvarBool "prevent-proxy-connections" "";
          pvp = cvars.cvarBool "pvp" "";
          queryPort = cvars.cvarInt "query.port" "";
          rateLimit = cvars.cvarInt "rate-limit" "";
          rconPassword = cvars.cvarString "rcon.password" "";
          rconPort = cvars.cvarInt "rcon.port" "";
          regionFileCompression = cvars.cvarString "region-file-compression" "";
          requireResourcePack = cvars.cvarBool "require-resource-pack" "";
          resourcePackUrl = cvars.cvarString "resource-pack" "";
          resourcePackId = cvars.cvarString "resource-pack-id" "";
          resourcePackPrompt = cvars.cvarString "resource-pack-prompt" "";
          resourcePackSha1 = cvars.cvarString "resource-pack-sha1" "";
          serverIp = cvars.cvarString "server-ip" "";
          serverPort = cvars.cvarInt "server-port" "";
          simulationDistance = cvars.cvarInt "simulation-distance" "";
          spawnMonsters = cvars.cvarBool "spawn-monsters" "";
          spawnProtection = cvars.cvarInt "spawn-protection" "";
          syncChunkWrites = cvars.cvarBool "sync-chunk-writes" "";
          useNativeTransport = cvars.cvarBool "use-native-transport" "";
          viewDistance = cvars.cvarInt "view-distance" "";
          whiteList = cvars.cvarBool "white-list" "";
        };
      };
      default = {};
      description = "The config for the server.properties file";
    };
	};
}
