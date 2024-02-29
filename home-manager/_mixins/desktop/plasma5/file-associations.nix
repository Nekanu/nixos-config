{config, ...}:
let 
associations = {
  "text/html" = "firefox.desktop";
  "x-scheme-handler/http" = "firefox.desktop";
  "x-scheme-handler/https" = "firefox.desktop";

  "inode/directory" = "dolphin.desktop";

  "application/pdf" = "okular.desktop";

  "x-scheme-handler/mailto" = "thunderbird.desktop";

  "text/plain" = "code.desktop";
  "text/markdown" = "code.desktop";
};
in {
  programs.plasma = {
    configFile."mimeapps.list" = {
      "Default Applications" = associations;
      "Added Associations" = associations;
    };
  };
}