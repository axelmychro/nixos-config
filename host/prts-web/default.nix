{ users, ... }: {
  networking.hostName = "prts-web";

  imports = [
    ../common.nix
  ];

  nix.settings = {
    cores = 2;
    max-jobs = 2;
  };

  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [ users.axelmychro.username ];
      MaxAuthTries = 3;
    };
  };
}
