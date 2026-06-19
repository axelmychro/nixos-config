{
  users,
  ...
}:
let
  them = users.axelmychro.username;
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
