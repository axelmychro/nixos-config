{
  users,
  ...
}:
let
  them = users.priestess.username;
in
{
  users.users.${them} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "render"
      "docker"
      "libvirtd"
    ];
  };
}
