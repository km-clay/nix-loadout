{ lib }:

{
	tabGraph = {
		alias = {
			"+tabgraph" = "+showscores; net_graph 4";
			"-tabgraph" = "-showscores; net_graph 0; timeleft";
			"graphtoggle" = "incrementvar net_graph 0 4 4";
		};
		bind = {
			"tab".cmd = "+tabgraph";
			"-".cmd = "graphtoggle";
		};
	};
	nullCancelMovement = {
		alias = {
			"null" = "";

			"+nmov_forward" = "-back   ; +forward; alias nmov_reforward +forward";
			"+nmov_back" =    "-forward; +back   ; alias nmov_reback    +back";

			"-nmov_forward" = "-forward; nmov_reback   ; alias nmov_reforward null";
			"-nmov_back" =    "-back   ; nmov_reforward; alias nmov_reback    null";

			"+nmov_moveleft" =  "-moveright; +moveleft ; alias nmov_removeleft  +moveleft";
			"+nmov_moveright" = "-moveleft ; +moveright; alias nmov_removeright +moveright";

			"-nmov_moveleft" =  "-moveleft ; nmov_removeright; alias nmov_removeleft  null";
			"-nmov_moveright" = "-moveright; nmov_removeleft ; alias nmov_removeright null";

			"nmov_reforward" = "null";
			"nmov_reback" =    "null";

			"nmov_removeleft" =  "null";
			"nmov_removeright" = "null";
		};
		bind = {
			"w".cmd = "+nmov_forward";
			"s".cmd = "+nmov_back";
			"a".cmd = "+nmov_moveleft";
			"d".cmd = "+nmov_moveright";
		};
	};
}
