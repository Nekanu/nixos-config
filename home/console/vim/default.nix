{
  programs.nixvim = {
    enable = true;

    colorschemes.gruvbox.enable = true;

    lsp = import ./lsp.nix;
    plugins = import ./plugins;
  };
}
