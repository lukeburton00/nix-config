{ self, inputs, ... }: {
  flake.modules.homeManager.development = { pkgs, ... }: {
    programs.pi-coding-agent = {
      enable = true;
      extraPackages = [ pkgs.nodejs pkgs.bun ];
      settings = {
        packages = [
          "npm:pi-web-access"
        ];
        hideThinkingBlock = true;
      };
    };
  };
}
