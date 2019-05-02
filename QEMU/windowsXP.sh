#!/bin/sh
qemu-system-x86_64 -enable-kvm -m 3G -cpu host -smp 1 \
  -drive file=../images/WindowsXP.img,if=virtio \
  -drive file=../drivers/virtio-win-0.1.141_x86.vfd,if=floppy,format=raw \
  -device virtio-net,netdev=vmnic,mac=DE:AD:BE:EF:CF:DD -netdev user,id=vmnic \
  -vga cirrus \
  -soundhw ac97 \
  -name "Windows XP" \
  $@
