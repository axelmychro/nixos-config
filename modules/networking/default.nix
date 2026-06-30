_: {
  networking = {
    networkmanager = {
      enable = true;
      dns = "none";
    };
    firewall.enable = true;

    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
      "8.8.8.8"
      "8.8.4.4"
      "9.9.9.9"
      "149.112.112.112"
    ];
  };
}
