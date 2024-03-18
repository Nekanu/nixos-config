{ lib, pkgs, ... }:
{
  programs.kitty = {
    enable = true;

    shellIntegration = {
      enableFishIntegration = true;
      enableBashIntegration = true;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;

    extraConfig = let
      workspaceCount = 8;
    in ''
      ###########
      # Monitor #
      ###########
      
      #############
      # Autostart #
      #############
      exec-once= ${pkgs.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1
      exec-once = wl-paste --watch cliphist store
      exec-once = hyprpaper

      ################
      # Window Rules #
      ################
      windowrulev2=float,title:^(Firefox — Sharing Indicator)$

      ########
      # Envs #
      ########
      env = QT_QPA_PLATFORM,wayland;xcb # enables automatic scaling, based on the monitors pixel density
      env = QT_AUTO_SCREEN_SCALE_FACTOR,1 # Tell QT applications to use the Wayland backend, and fall back to x11 if Wayland is unavailable
      env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1 # Disables window decorations on QT applications

      ############
      # Keybinds #
      ############
      $mainMod = SUPER

      bind = $mainMod, w, killactive,

      bind = $mainMod ALT, Left, workspace, r-100
      bind = $mainMod, Left, workspace, r-1
      bind = $mainMod SHIFT, Left, movetoworkspace, r-1

      bind = $mainMod , Right, workspace, r+1
      bind = $mainMod SHIFT, Right, movetoworkspace, r+1

      bind = $mainMod, Tab, cyclenext,
      bind = $mainMod SHIFT, Tab, cyclenext, prev
      
      bind = $mainMod SHIFT, f, togglefloating

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow

      # workspace
      ${builtins.concatStringsSep "\n" (builtins.map (n: ''
        workspace = ${n},monitor:${if ((lib.strings.charToInt n) >= 5) then "DP-2" else "DP-1"}
        bind = $mainMod, ${n}, workspace, ${n}
        bind = $mainMod SHIFT, ${n}, movetoworkspace, ${n}
      '') ["1" "2" "3" "4" "5" "6" "7" "8"])}

      # Clipboard
      bind = $mainMod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy

      # Screenshot
      bind = , Print, exec, grimblast --notify copysave area

      # Launch Apps
      bindr= $mainMod, SUPER_L, exec, pkill rofi || rofi -show combi
      bind = , exec, kitty
      bind = $mainMod, e, exec, thunar

      #########
      # Decor #
      #########
      decoration {
        active_opacity = 0.90
        inactive_opacity = 0.82
        rounding = 8
        dim_inactive = false
        dim_strength = 0.3
        drop_shadow = false

        blur {
          size = 10
          passes = 3
        }
      }

      animations {
        animation = windowsIn, 1, 7, default, slide
        animation = windowsOut, 1, 7, default, slide
        animation = border, 1, 10, default
        animation = fade, 1, 7, default
        animation = workspaces, 1, 5, default
      }

      ###########
      # General #
      ###########
      input {
        kb_layout = de
        sensitivity = 0
      }

      general {
        gaps_in = 2
        gaps_out = 5
        border_size = 0
        cursor_inactive_timeout = 30
        resize_on_border = true
        layout = dwindle
      }

      dwindle {
        pseudotile = true
        preserve_split = true # you probably want this
        smart_split = true
      }

      misc {
        mouse_move_enables_dpms = true
        disable_hyprland_logo = true
      }

      binds {
        allow_workspace_cycles = true
      }

      xwayland {
        force_zero_scaling = true
      }
    '';
  };
}
