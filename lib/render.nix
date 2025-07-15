{ lib, pkgs, cfg, opts }:

let
	toCfgValue = val:
		if builtins.isBool val then
			if val then "1" else "0"
		else if builtins.isString val then
			"\"${val}\""
		else
			toString val;

bindBlock = binds:
	builtins.foldl' (acc: key:
		let
			bind = binds.${key};
			isToggle = bind.toggle or false;
			command = toCfgValue (bind.cmd or "");
			line = if isToggle then
				"bindToggle ${key} ${command}"
			else
				"bind ${key} ${command}";
		in
			acc + line + "\n"
	) "" (builtins.attrNames binds);

aliasBlock = aliases:
	builtins.foldl' (acc: key:
		let
			alias = aliases.${key};
			line = "alias ${key} ${toCfgValue alias}";
		in
			acc + line + "\n"
	) "" (builtins.attrNames aliases);

execBlock = execs:
	builtins.foldl' (acc: cfgFile:
		let
			line = "exec ${toCfgValue cfgFile}";
		in
			acc + line + "\n"
	) "" execs;

renderCvars = prefix: cfg: opts:
	lib.concatMapStringsSep "\n" (name:
		let
			val = cfg.${name};
			opt = opts.${name} or null;
			isPrefix = opt.extra.prefix or false;
			cvarName = opt._cvarName or "";
			type = opt.type or null;
			subOpts =
				if opt != null && type ? getSubOptions then
					opt.type.getSubOptions []
				else
					{};  # fallback if not a submodule
		in
			if val == null then
				""
			else if name == "exec" then
				execBlock val
			else if name == "alias" then
				aliasBlock val
			else if name == "bind" then
				bindBlock val
			else if name == "extraConfig" then
				val
			else if builtins.isAttrs val then
				renderCvars (prefix + cvarName) val subOpts
			else if cvarName != "" then
				"${prefix}${cvarName} ${toCfgValue val}"
			else
				""
	) (builtins.attrNames cfg);
in
	builtins.concatStringsSep "\n" (
		pkgs.lib.filter (line: line != "") (
			pkgs.lib.splitString "\n" (renderCvars "" cfg opts)
		)
	) + "\n"
