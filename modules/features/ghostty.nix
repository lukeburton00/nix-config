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
        theme = "Vague";
        "font-size" = 16;
        "quit-after-last-window-closed" = true;
        "term" = "xterm-256color";
      };
    };
  };

  flake.nixosModules.ghostty = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      ghostty
    ];
  };

  flake.darwinModules.ghostty = {
    homebrew.casks = [
      "ghostty"
    ];
  };
}
