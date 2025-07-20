{ lib }:

let
	bool = lib.types.bool;
	int = lib.types.int;
	str = lib.types.str;
	float = lib.types.float;
	submodule = lib.types.submodule;

	# cvar is just a wrapper of lib.mkOption
	cvar = { name, type, desc ? "", extra ? {} }:
		let
			# we make our option
			opt = lib.mkOption {
				type = lib.types.nullOr type;
				default = null;
				description = desc;
			};
			# and then we sneak in this _cvarName attribute for our renderer later
		in opt // { _cvarName = name; } // extra;

	# helpers to cut down on boilerplate
	cvarBool = name: desc:
		cvar {
			inherit name desc;
			type = bool;
			extra = {
				prefix = false;
			};
		};
	cvarInt = name: desc:
		cvar {
			inherit name desc;
			type = int;
			extra = {
				prefix = false;
			};
		};
	cvarString = name: desc:
		cvar {
			inherit name desc;
			type = str;
			extra = {
				prefix = false;
			};
		};
	cvarFloat = name: desc:
		cvar {
			inherit name desc;
			type = float;
			extra = {
				prefix = false;
			};
		};

	# this one is for cvar prefixes like sv_ or cl_, pivotal for our rendering logic
	cvarPrefix = name: cvars:
		cvar {
			inherit name;
			type = submodule { options = cvars; };
			extra = {
				# this is the signal that tells our renderer to continue recursing
				prefix = true;
			};
		};

in { inherit cvar cvarBool cvarInt cvarString cvarFloat cvarPrefix; }
