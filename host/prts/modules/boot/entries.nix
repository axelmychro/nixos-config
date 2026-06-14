_:
let
  gentooPartition = "e04ea3ec-7f23-4caa-bee1-1b0ebc3247b0";
  gentooKernelDir = "/boot/kernels-gentoo";
  zenKernelDir = "/boot/kernels-zen";
in
{
  boot.loader.grub.extraEntries = ''
    submenu 'Gentoo' --class gentoo {
      menuentry 'Gentoo Kernel' --class gentoo --class gnu-linux --class gnu --class os {
        insmod part_gpt
        insmod ext2
        search --no-floppy --fs-uuid --set=root ${gentooPartition}
        linux ${gentooKernelDir}/vmlinuz root=UUID=${gentooPartition}
        initrd ${gentooKernelDir}/initramfs.img
      }
      menuentry 'Zen Kernel' --class gentoo --class gnu-linux --class gnu --class os {
        insmod part_gpt
        insmod ext2
        search --no-floppy --fs-uuid --set=root ${gentooPartition}
        linux ${zenKernelDir}/vmlinuz root=UUID=${gentooPartition}
        initrd ${zenKernelDir}/initramfs.img
      }
    }
  '';
}
