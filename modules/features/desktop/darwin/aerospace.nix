{
  flake.modules.homeManager.aerospace = {
    pkgs,
    lib,
    ...
  }:
  # AeroSpace is macOS-only
    lib.mkIf pkgs.stdenv.isDarwin {
      programs.aerospace = {
        enable = true;

        launchd.enable = true;

        settings = {
          start-at-login = true;

          enable-normalization-flatten-containers = true;
          enable-normalization-opposite-orientation-for-nested-containers = true;

          on-focused-monitor-changed = ["move-mouse monitor-lazy-center"];

          mode.main.binding = {
            "cmd-enter" = "exec-and-forget open /Applications/Ghostty.app";

            "cmd-j" = "focus --boundaries-action wrap-around-the-workspace left";
            "cmd-k" = "focus --boundaries-action wrap-around-the-workspace down";
            "cmd-l" = "focus --boundaries-action wrap-around-the-workspace up";
            "cmd-semicolon" = "focus --boundaries-action wrap-around-the-workspace right";

            "cmd-shift-j" = "move left";
            "cmd-shift-k" = "move down";
            "cmd-shift-l" = "move up";
            "cmd-shift-semicolon" = "move right";

            "cmd-f" = "fullscreen";

            "cmd-s" = "layout v_accordion";
            "cmd-w" = "layout h_accordion";
            "cmd-e" = "layout tiles horizontal vertical";
            "cmd-shift-space" = "layout floating tiling";

            "cmd-1" = "workspace 1";
            "cmd-2" = "workspace 2";
            "cmd-3" = "workspace 3";
            "cmd-4" = "workspace 4";
            "cmd-5" = "workspace 5";
            "cmd-6" = "workspace 6";
            "cmd-7" = "workspace 7";
            "cmd-8" = "workspace 8";
            "cmd-9" = "workspace 9";
            "cmd-0" = "workspace 10";

            "cmd-shift-1" = "move-node-to-workspace 1";
            "cmd-shift-2" = "move-node-to-workspace 2";
            "cmd-shift-3" = "move-node-to-workspace 3";
            "cmd-shift-4" = "move-node-to-workspace 4";
            "cmd-shift-5" = "move-node-to-workspace 5";
            "cmd-shift-6" = "move-node-to-workspace 6";
            "cmd-shift-7" = "move-node-to-workspace 7";
            "cmd-shift-8" = "move-node-to-workspace 8";
            "cmd-shift-9" = "move-node-to-workspace 9";
            "cmd-shift-0" = "move-node-to-workspace 10";

            "cmd-shift-c" = "reload-config";

            "cmd-r" = "mode resize";
          };

          workspace-to-monitor-force-assignment = {
            "1" = 3;
            "2" = 3;
            "3" = 3;
            "4" = 3;
            "5" = 3;
            "6" = 2;
            "7" = 2;
            "8" = 2;
            "9" = 2;
          };

          on-window-detected = [
            {
              "if" = {
                "app-name-regex-substring" = "ghostty";
              };
              run = ["move-node-to-workspace 1"];
            }
            {
              "if" = {
                "app-name-regex-substring" = "firefox";
              };
              run = ["move-node-to-workspace 2"];
            }
          ];

          mode.resize.binding = {
            h = "resize width +50";
            j = "resize height +50";
            k = "resize height -50";
            l = "resize width -50";
            enter = "mode main";
            esc = "mode main";
          };
        };
      };
    };
}
