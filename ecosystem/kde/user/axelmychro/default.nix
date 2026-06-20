{
  pkgs,
  assets,
  users,
  them,
  ...
}:
let
  their = users.axelmychro;
in
{
  _module.args.them = their.username;

  imports = [
    "${their.configuration}"
    ./packages/index.nix
    ./home-manager/home.nix
  ];

  users.users.${them} = {
    shell = pkgs.fish;

    extraGroups = [
      "video"
      "render"
      "docker"
      "libvirtd"
    ];
  };
  programs.fish.enable = true;

  system.activationScripts.face.text = ''
    rm -f /var/lib/AccountsService/icons/${them}
    ln -sfn ${assets}/${them}/face.png /var/lib/AccountsService/icons/${them}
  '';
}
