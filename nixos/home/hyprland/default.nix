{
  pkgs,
  hyprpanel,
  ...
}: {
  imports = [
    # ./anyrun.nix
  ];

  home.packages = with pkgs; [
    hyprpanel
    anyrun
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;

    settings = {
      input = {
        kb_layout = "es";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";

        follow_mouse = 1;

        touchpad = {
          natural_scroll = "no";
        };

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      };

      general = {
        gaps_in = 2;
        gaps_out = 5;
        border_size = 2;
      };

      decoration = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        rounding = 10;
        blur = {
          enabled = "yes";
          size = 3;
          passes = 1;
        };
      };

      animations = {
        enabled = "yes";
        # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier, slide"
          "windowsOut, 1, 7, default, slide"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      exec-once = [
        "ags"
      ];
      monitor = [
        ",preferred,auto,1"
      ];
      "$mod" = "SUPER";
      bind =
        [
          "$mod, Q, exec, kitty"
          "$mod, C, killactive"
          "$mod, F, fullscreen"
          "$mod, R, exec, anyrun"
          "$mod, E, exec, nautilus -w"
          "$mod, W, exec, firefox"

          # Brightness and volume

          ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ",XF86AudioPlay, exec, playerctl play-pause"
          ",XF86AudioPause, exec, playerctl play-pause"
          ",XF86AudioNext, exec, playerctl next"
          ",XF86AudioNext, exec, playerctl previous"

          "$mod SHIFT, P, exec, hyprpicker -a -n"
          ", code:107, exec, grim - | swappy -f -"
          "$mod, S, exec, grim -g \"$(slurp)\" - | swappy -f -"
          "$mod ALT, N, exec, swaync-client -t"
          # Switch between windows in a floating workspace
          "$mod, Tab, cyclenext"
          "$mod, Tab, bringactivetotop"
          # Move focus with arrow keys
          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
          builtins.concatLists (builtins.genList (
              i: let
                ws = i + 1;
              in [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            )
            9)
        );
      binde = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 4%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 4%-"
        ",XF86MonBrightnessDown, exec, brightnessctl set 4%-"
        ",XF86MonBrightnessUp, exec, brightnessctl set +4%"
      ];
      bindm = [
        # Move/resize windows with mod + LMB/RMB and dragging
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };
}
