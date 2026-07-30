{
  self,
  inputs,
  ...
}: {
  flake.homeModules.ghostty = {
    programs.ghostty = {
      enable = true;
      package = null;
      systemd.enable = false;
      settings = {
        "font-family" = "Maple Mono NF";
        "font-size" = 15;
        "quit-after-last-window-closed" = true;
        "term" = "xterm-256color";
      };
    };
  };

  flake.modules.nixos.ghostty = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      ghostty
    ];
  };

  flake.modules.darwin.ghostty = {
    homebrew.casks = [
      "ghostty"
    ];
  };
}
