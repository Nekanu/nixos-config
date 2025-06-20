{
  imports = [
    ./lsp.nix
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    colorschemes.one.enable = true;

    opts = {
      number = true; # Line Numbers
      relativenumber = true;

      mouse = "a";
      showmode = false;
      breakindent = true;

      undofile = true;

      clipboard = {
        providers.wl-copy.enable = true;

        register = "unnamedplus";
      };
    };
  };
}
