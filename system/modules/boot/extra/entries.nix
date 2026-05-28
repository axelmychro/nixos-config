_:
let
  bootPartition = "800C-0267";
  gentooPartition = "e04ea3ec-7f23-4caa-bee1-1b0ebc3247b0";
  fedoraPartition = "05aa19b1-9cfe-4736-9ef4-ad1046b62ff0";
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
        linux ${gentooKernelDir}/vmlinuz root=UUID=${gentooPartition} rw quiet loglevel=3 nowatchdog fsck.mode=force fsck.repair=yes
        initrd ${gentooKernelDir}/initramfs.img
      }
      menuentry 'Zen Kernel' --class gentoo --class gnu-linux --class gnu --class os {
        insmod part_gpt
        insmod ext2
        search --no-floppy --fs-uuid --set=root ${gentooPartition}
        linux ${zenKernelDir}/vmlinuz root=UUID=${gentooPartition} rw quiet
        initrd ${zenKernelDir}/initramfs.img
      }
    }
    menuentry 'Fedora' --class fedora --class gnu-linux --class gnu --class os {
      insmod part_gpt
      insmod ext2
      search --no-floppy --fs-uuid --set=root ${fedoraPartition}
      linux /boot/vmlinuz root=UUID=${fedoraPartition} rw quiet loglevel=3 nowatchdog fsck.mode=force fsck.repair=yes
      initrd /boot/initramfs.img
    }
  '';
}
