{
  config,
  assets,
  ...
}:
let
  user = config.nixosConfigUsers.axelmychro;
in
{
  #imports = [ ./packages/index.nix ];

  system.activationScripts.face.text = ''
    _user_icon_dir=/var/lib/AccountsService/icons
    rm -fr -- "$_user_icon_dir/${user.name}"
    ln -sfn -- "${assets}/${user.name}/face.png" "$_user_icon_dir/${user.name}"
    unset _user_icon_dir
  '';

  #home-manager.users.${user.name}.imports = [ ./home-manager ];
}
