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
    _user_icon_dir=/var/lib/AccountsService/icons
    rm -fr -- "$_user_icon_dir/${them}"
    ln -sfn -- "${assets}/${them}/face.png" "$_user_icon_dir/${them}"
    unset _user_icon_dir
  '';
}
