{ pkgs, config, lib, ... } @ args:

with lib;

let
  cfg = config.stylix.cursor;
  fromOs = import ./fromos.nix { inherit lib args; };
in {
    options.stylix.cursor = {
        name = mkOption {
            description = "The cursor name within the package.";
            type = types.str;
            default = fromOs [ "cursor" "name" ] "Vanilla-DMZ";
        };
        package = mkOption {
            description = "Package providing the cursor theme.";
            type = types.package;
            default = fromOs [ "cursor" "package" ] pkgs.vanilla-dmz;
        };
        size = mkOption {
            description = "The cursor size.";
            type = types.int;
            default = fromOs [ "cursor" "size" ] 32;
        };
    };
}
