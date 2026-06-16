_:
let
  gentooPartition = "e04ea3ec-7f23-4caa-bee1-1b0ebc3247b0";
in
{
  boot.loader.grub.extraEntries = ''
    menuentry 'Gentoo' --class gentoo --class gnu-linux --class gnu --class os {
      insmod part_gpt
      insmod ext2
      search --no-floppy --fs-uuid --set=root ${gentooPartition}
      linux /boot/vmlinuz root=UUID=${gentooPartition}
      initrd /boot/initramfs.img
    }
  '';
}
