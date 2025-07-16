{ lib, ... }:
let
  # Load all default.nix from all subdirectories
  subdirs = builtins.attrNames (
    lib.filterAttrs (_: type: type == "directory") (builtins.readDir ./.)
  );
  userModules = builtins.map (name: import ./${name}/default.nix) subdirs;
in
{
  imports = userModules;

  users = {
    mutableUsers = false;
  };
}
