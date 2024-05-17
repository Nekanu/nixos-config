{ lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    # Terminal
    kitty
    # File Manager
    xfce.thunar
  ];

  programs.kitty = {
    enable = true;

    shellIntegration = {
      enableFishIntegration = true;
      enableBashIntegration = true;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;

    xwayland.enable = true;
    systemd.enable = true;

    plugins = with pkgs; [
      hyprpaper # wallpaper
      hyprdim # dim inactive windows
      hyprshot # screenshot
      hyprlock # lockscreen
      hyprkeys # keybinds
      hypridle # idle daemon
      hyprpicker # color picker
      hyprcursor # cursor theme
      hyprland-workspaces # workspaces

      grimblast # screenshot
      cliphist # clipboard
    ];

    settings = {
      "$mod" = "SUPER";

      decoration = {
        shadow_offset = "0 5";
        active_opacity = 0.90;
        inactive_opacity = 0.82;
        rounding = 8;
        dim_inactive = false;
        dim_strength = 0.3;
        drop_shadow = false;

        blur = {
          size = 10;
          passes = 3;
        };
      };

      animations = {
        windowsIn = "1 7 default slide";
        windowsOut = "1 7 default slide";
        border = "1 10 default";
        fade = "1 7 default";
        workspaces = "1 5 default";
      };

      xwayland.force_zero_scaling = true;

      binds.allow_workspace_cycles = true;

      misc = {
        mouse_move_enables_dpms = true;
        disable_hyprland_logo = true;
      };

      general = {
        gaps_in = 2;
        gaps_out = 5;
        border_size = 0;
        cursor_inactive_timeout = 30;
        resize_on_border = true;
        layout = "dwindle";
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
        smart_split = true;
      };

      input = {
        kb_layout = "de";
        sensitivity = 0;
      };

      bindm = [
        "$mod, w, killactive"
        "$mod ALT, Left, workspace, r-100"
        "$mod SHIFT, Left, movetoworkspace, r-1"
        "$mod , Right, workspace, r+1"
        "$mod SHIFT, Right, movetoworkspace, r+1"
        "$mod, Tab, cyclenext,"
        "$mod SHIFT, Tab, cyclenext, prev"
        "$mod SHIFT, f, togglefloating"
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
        ", Print, exec, grimblast --notify copysave area"
        "$mod, SUPER_L, exec, pkill rofi || rofi -show combi"
        ", exec, kitty"
        "$mod, e, exec, thunar"
      ];

      exec-once = [
        "${pkgs.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1"
        "wl-paste --watch cliphist store"
        "hyprpaper"
      ];

      env = [
        "QT_QPA_PLATFORM,wayland;xcb" # enables automatic scaling, based on the monitors pixel density
        "QT_AUTO_SCREEN_SCALE_FACTOR,1" # Tell QT applications to use the Wayland backend, and fall back to x11 if Wayland is unavailable
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1" # Disables window decorations on QT applications
      ];
    };

    extraConfig = let
      workspaceCount = 8;
    in ''
      # workspace
      ${builtins.concatStringsSep "\n" (builtins.map (n: ''
        workspace = ${n},monitor:${if ((lib.strings.charToInt n) >= 5) then "DP-2" else "DP-1"}
        bind = $mainMod, ${n}, workspace, ${n}
        bind = $mainMod SHIFT, ${n}, movetoworkspace, ${n}
      '') ["1" "2" "3" "4" "5" "6" "7" "8"])}
    '';
  };
}
