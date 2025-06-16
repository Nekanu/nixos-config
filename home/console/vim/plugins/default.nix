let
  excludeFiles = [
    "default.nix"
  ];

  # Import all configurations from the files in the current directory
  files = builtins.attrNames (builtins.readDir ./.);
  nixFiles = builtins.filter (f: builtins.match ".*\\.nix$" f != null) files;

  # Exclude specific files that are not configurations.
  nixFilesFiltered = builtins.filter (f: !builtins.elem f excludeFiles) nixFiles;
in
builtins.foldl' (acc: f: acc // import (./. + "/${f}")) {
  actions-preview.enable = true;
  auto-save.enable = true;
  aw-watcher.enable = true;
  bufferline.enable = true;
  gitsigns.enable = true;
  lz-n.enable = true;
  lualine.enable = true;
  nvim-autopairs.enable = true;
  nvim-tree.enable = true;
  nvim-ufo.enable = true;
  overseer.enable = true;
  smear-cursor.enable = true;
  telescope.enable = true;
  treesitter.enable = true;
  web-devicons.enable = true;
} nixFilesFiltered
