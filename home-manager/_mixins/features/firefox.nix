{ inputs, desktopEnvironments, lib, pkgs, ... }: 
let
  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };
in {
  programs.firefox = {
    enable = true;
    
    nativeMessagingHosts = with pkgs; [
      kdePackages.plasma-browser-integration
    ];

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableProfileImport = true;
      EnableTrackingProtection = {
        Value= true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisableFirefoxScreenshots = true;
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "always "; # alternatives: "never" or "newtab"
      DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
      SearchBar = "unified"; # alternative: "separate"
      ShowHomeButton = false;

      PasswordManagerEnabled = false;
      OfferToSaveLogins = false;

      SearchSuggestEnabled = false;

      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";

      ExtensionSettings = {
        "*".installation_mode = "allowed";

        # Multi-Account Containers
        "@testpilot-containers" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/multi-account-containers/latest.xpi";
          installation_mode = "force_installed";
        };

        # NoScript
        "{73a6fe31-595d-460b-a920-fcc0f8843232}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/noscript/latest.xpi";
          installation_mode = "force_installed";
        };

        # uMatrix
        "uMatrix@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/umatrix/latest.xpi";
          installation_mode = "force_installed";
        };

        # uBlock Origin
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };

        # Privacy Badger
        "jid1-MnnxcxisBPnSXQ@jetpack" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
          installation_mode = "force_installed";
        };

        # Plasma Integration
        "plasma-browser-integration@kde.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/plasma-integration/latest.xpi";
          installation_mode = "normal_installed";
        };

        # Bitwarden
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "normal_installed";
        };

        # KeePassXC-Browser
        "keepassxc-browser@keepassxc.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/keepassxc-browser/latest.xpi";
          installation_mode = "normal_installed";
        };

        # Dark Reader
        "addon@darkreader.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/dark-reader/latest.xpi";
          installation_mode = "normal_installed";
        };

        # Enhancer for YouTube
        "enhancerforyoutube@maximerf.addons.mozilla.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/enhancer-for-youtube/latest.xpi";
          installation_mode = "normal_installed";
        };

        # SponsorBlock
        "sponsorBlocker@ajay.app" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
          installation_mode = "normal_installed";
        };

        # NordVPN
        "nordvpnproxy@nordvpn.com" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/nordvpn-proxy-extension/latest.xpi";
          installation_mode = "normal_installed";
        };
      };

      Preferences = {
        "browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
        "browser.topsites.contile.enabled" = lock-false;
        "browser.formfill.enable" = lock-false;
        "browser.search.suggest.enabled" = lock-false;
        "browser.search.suggest.enabled.private" = lock-false;
        "browser.urlbar.suggest.searches" = lock-false;
        "browser.urlbar.showSearchSuggestionsFirst" = lock-false;

        "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
        "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
        "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock-false;
        "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock-false;
        "browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock-false;
        "browser.newtabpage.activity-stream.showSponsored" = lock-false;
        "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;

        "extensions.pocket.enabled" = lock-false;
        "extensions.screenshots.disabled" = lock-true;

        "geo.enabled" = lock-false;

        "media.peerconnection.enabled" = lock-false;

        "privacy.resistFingerprinting" = lock-true;
        "privacy.firstparty.isolate" = lock-true;
        "privacy.trackingprotection.enabled" = lock-true;

        "webgl.disabled" = lock-true;

        "widget.use-xdg-desktop-portal.file-picker" = { Value = 1; Status = "locked"; };
      };
    };   
  };
}