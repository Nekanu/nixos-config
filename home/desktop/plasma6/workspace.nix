{config, lib, pkgs, ...}:
{
  programs.plasma = {
    enable = true;

    workspace = {
      clickItemTo = "select";
    };

    # Disable File Indexing
    configFile."baloofilerc"."Basic Settings"."Indexing-Enabled".value = false;

    numlockSettings = "on";
  };
}