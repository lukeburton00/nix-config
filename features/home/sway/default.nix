{
  pkgs,
  osConfig,
  ...
}: let
  monitors = osConfig.monitors;
in {
  imports = [
    ../kanshi
    ../mako
    ../fuzzel
  ];

  home.packages = with pkgs; [
    libnotify
    wl-clipboard
    grim
    playerctl
    pavucontrol
  ];

  wayland.windowManager.sway = {
    enable = true;
    checkConfig = false;

    config = {
      output = {
        "*" = {
          bg = "~/Pictures/wallpapers/wallpaper.jpg fill";
        };
      };

      workspaceOutputAssign = [
        {
          workspace = "1";
          output = monitors.primary;
        }
        {
          workspace = "2";
          output = monitors.primary;
        }
        {
          workspace = "3";
          output = monitors.primary;
        }
        {
          workspace = "4";
          output = monitors.primary;
        }
        {
          workspace = "5";
          output = monitors.primary;
        }
        {
          workspace = "6";
          output = monitors.secondary;
        }
        {
          workspace = "7";
          output = monitors.secondary;
        }
        {
          workspace = "8";
          output = monitors.secondary;
        }
        {
          workspace = "9";
          output = monitors.secondary;
        }
      ];

      gaps = {
        smartGaps = false;
      };

      window = {
        border = 0;
        titlebar = false;
      };

      floating = {
        border = 0;
        titlebar = false;
      };

      floating.modifier = "Mod1";

      keybindings = let
        mod = "Mod1";
        left = "h";
        down = "j";
        up = "k";
        right = "l";
      in {
        "${mod}+Return" = "exec ghostty";
        "${mod}+q" = "kill";
        "${mod}+d" = "exec fuzzel";
        "${mod}+w" = "exec librewolf";

        "${mod}+Shift+c" = "reload";
        "${mod}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";

        "${mod}+${left}" = "focus left";
        "${mod}+${down}" = "focus down";
        "${mod}+${up}" = "focus up";
        "${mod}+${right}" = "focus right";
        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";

        "${mod}+Shift+${left}" = "move left";
        "${mod}+Shift+${down}" = "move down";
        "${mod}+Shift+${up}" = "move up";
        "${mod}+Shift+${right}" = "move right";
        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move right";

        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";

        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
        "${mod}+Shift+0" = "move container to workspace number 10";

        "${mod}+b" = "splith";
        "${mod}+v" = "splitv";
        "${mod}+s" = "layout stacking";
        "${mod}+e" = "layout toggle split";
        "${mod}+f" = "fullscreen";
        "${mod}+Shift+space" = "floating toggle";
        "${mod}+space" = "focus mode_toggle";
        "${mod}+a" = "focus parent";

        "${mod}+Shift+minus" = "move scratchpad";
        "${mod}+minus" = "scratchpad show";

        "${mod}+g" = "mode \"gaming\"";

        "XF86AudioMute" = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "XF86AudioLowerVolume" = "pactl set-sink-volume @DEFAULT_SINK@ -5%";
        "XF86AudioRaiseVolume" = "pactl set-sink-volume @DEFAULT_SINK@ +5%";
        "XF86AudioMicMute" = "pactl set-source-mute @DEFAULT_SOURCE@ toggle";
        "XF86AudioPlay" = "playerctl play-pause";
        "XF86AudioNext" = "playerctl next";
        "XF86AudioPrev" = "playerctl previous";
        "XF86AudioStop" = "playerctl stop";
        "XF86MonBrightnessDown" = "brightnessctl set 5%-";
        "XF86MonBrightnessUp" = "brightnessctl set 5%+";
        "Print" = "grim";
      };

      modes = {
        gaming = {
          "Mod1+a" = "output * adaptive_sync on";
          "Mod1+o" = "output * adaptive_sync off";
          "Mod1+g" = "mode default";
        };
      };

      startup = [
        {
          command = "kanshi";
          always = true;
        }
        {
          command = "mako";
          always = true;
        }
      ];

      bars = [
        {
          position = "bottom";
          statusCommand = "while date +'%Y-%m-%d %X'; do sleep 1; done";
          colors = {
            statusline = "#ffffff";
            background = "#323232";
            inactiveWorkspace = {
              border = "#32323200";
              background = "#32323200";
              text = "#5c5c5c";
            };
          };
        }
      ];
    };

    extraConfig = ''
      include /etc/sway/config.d/*
    '';
  };
}
