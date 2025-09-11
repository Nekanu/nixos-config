{ ... }:
{
  services.flatpak = {
    packages = [
      "dev.vencord.Vesktop" # Discord
      "io.github.milkshiift.GoofCord" # Alternative Discord Client
      "im.riot.Riot" # Element Client (Matrix)
      "org.signal.Signal"
      "com.ktechpit.whatsie" # WhatsApp
    ];

    overrides = {
      "org.signal.Signal" = {
        Environment = {
          SIGNAL_PASSWORD_STORE = "kwallet6"; # Use KDE Wallet for password storage
        };

        Context = {
          filesystems = [
            "!host"
            "xdg-download:rw"
          ];
        };
      };

      "dev.vencord.Vesktop" = {
        Context = {
          filesystems = [
            "!host"
            "xdg-download:rw"
            "xdg-pictures:ro"
          ];
        };
      };
    };
  };
}
