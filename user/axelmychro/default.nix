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
      "video"
      "render"
      "wheel"
      "docker"
      "libvirtd"
    ];
  };
}
