{ lib, cfg, opts }:

let
  toCfgVal = val:
    if builtins.isBool val then
      if val then
        "true"
      else
        "false"
    else
      toString val;
  renderCvars = prefix: cfg: opts:
    lib.concatMapStringsSep "\n" (name:
      let
        val = cfg.${name};
        opt = opts.${name} or null;
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
        else if name == "extraConfig" then
          val
        else if builtins.isAttrs val then
          renderCvars (prefix + cvarName) val subOpts
        else if cvarName != "" then
          "${cvarName}=${toCfgVal val}"
        else
          ""
    ) (builtins.attrNames cfg);
in
	let
		prefix = cfg.extraPrefixConfig or "";
		postfix = cfg.extraPostfixConfig or "";
		body = builtins.concatStringsSep "\n" (
			lib.filter (line: line != "") (
				lib.splitString "\n" (renderCvars "" cfg opts)
			)
		) + "\n";
	in
		builtins.concatStringsSep "\n" (
			lib.filter (line: line != "") (
				lib.splitString "\n" (prefix + "\n" + body + "\n" + postfix)
			)
		) + "\n"
