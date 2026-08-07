{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.networking = {pkgs, ...}: {
    services.resolved.enable = true;
    networking.networkmanager.enable = true;
    boot = {
      kernel.sysctl = {
        "net.core.default_qdisc" = "fq";
        "net.ipv4.tcp_congestion_control" = "bbr";
      };
    };
  };
}
