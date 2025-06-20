let
  excludeFiles = [
    "default.nix"
  ];

  # Import all configurations from the files in the current directory
  files = builtins.attrNames (builtins.readDir ./.);
  nixFiles = builtins.filter (file: builtins.match ".*\\.nix$" file != null) files;

  # Exclude specific files that are not configurations.
  nixFilesFiltered = builtins.filter (file: !builtins.elem file excludeFiles) nixFiles;
  nixFilesFilteredAbsolute = builtins.map (file: ./. + "/${file}") nixFilesFiltered;
in
{
  imports = nixFilesFilteredAbsolute;

  programs.nixvim.plugins = {
    actions-preview.enable = true;
    auto-save.enable = true;
    autoclose.enable = true;
    aw-watcher.enable = true;
    bufferline.enable = true;
    cursorline.enable = true;
    diffview.enable = true;
    direnv.enable = true;
    gitsigns.enable = true;
    hardtime.enable = true;
    lz-n.enable = true;
    lualine.enable = true;
    multicursors.enable = true;
    neoscroll.enable = true;
    nvim-autopairs.enable = true;
    nvim-ufo.enable = true;
    overseer.enable = true;
    sleuth.enable = true;
    smear-cursor.enable = true;
    telescope.enable = true;
    todo-comments.enable = true;
    vim-be-good.enable = true;
    web-devicons.enable = true;
  };
}
