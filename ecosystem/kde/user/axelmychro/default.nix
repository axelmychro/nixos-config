{
  users,
  pkgs,
  assets,
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

  users.users.${their.username} = {
    shell = pkgs.fish;
  };
  programs.fish.enable = true;

  system.activationScripts.face = {
    text = ''
      rm -f /var/lib/AccountsService/icons/${their.username}
      ln -sfn ${assets}/face.jpg /var/lib/AccountsService/icons/${their.username}
    '';
  };
}
