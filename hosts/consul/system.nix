{
  networking = {
    hostName = "consul";
    computerName = "consul";
  };

  security.pam.services.sudo_local = {
    touchIdAuth = true;
    reattach = true;
  };
}
