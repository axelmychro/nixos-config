{
  assets,
  user,
  ...
}:
{
  _module.args.user = {
    name = "axelmychro";
    email = "axelmychro@gmail.com";
  };
  system.activationScripts.face.text = ''
    USER_ICON_DIR=/var/lib/AccountsService/icons
    rm -f "$USER_ICON_DIR/${user.name}"
    ln -sfn "${assets}/${user.name}-face.png" "$USER_ICON_DIR/${user.name}"
    unset USER_ICON_DIR
  '';
  users.users.${user.name} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG6PBGNhpPnKvAjl2k0oZeY732xawJPcRM/G4yjc+vgR axelmychro@prts"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA3t0YR5cFGKfTOpWZ9MJDf8Av+LstI6A+J+mLbm7lpK axelmychro@prts-web"
    ];
  };

  services = {
    postgresql = {
      ensureUsers = [
        {
          inherit (user) name;
          ensureClauses = {
            login = true;
            superuser = true;
          };
          ensureDBOwnership = true;
        }
      ];
      ensureDatabases = [ user.name ];
    };
    pgadmin = {
      initialEmail = user.email;
      initialPasswordFile = "/var/lib/secrets/pgadmin_password";
    };
  };
}
