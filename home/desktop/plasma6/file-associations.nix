{ ... }:
let
  associations = {
    "text/html".value = "firefox.desktop";
    "x-scheme-handler/http".value = "firefox.desktop";
    "x-scheme-handler/https".value = "firefox.desktop";

    "inode/directory".value = "dolphin.desktop";

    "application/pdf".value = "okular.desktop";

    "x-scheme-handler/mailto".value = "thunderbird.desktop";

    "text/plain".value = "code.desktop";
    "text/markdown".value = "code.desktop";
  };
in
{
  programs.plasma = {
    configFile."mimeapps.list" = {
      "Default Applications" = associations;
      "Added Associations" = associations;
    };
  };
}
