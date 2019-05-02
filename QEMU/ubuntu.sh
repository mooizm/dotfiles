#!/bin/sh
qemu-system-x86_64 -enable-kvm -m 4G -cpu host -smp 2 \
-drive file=../images/Ubuntu.img,if=virtio \
-device virtio-net,netdev=vmnic,mac=de:ad:be:ef:cf:aa -netdev tap,id=vmnic,script=qemu-ifup.sh,downscript=no \
-vga virtio \
-soundhw hda \
-rtc base=localtime \
-name "Ubuntu" \
$@

# CD: -boot d -cdrom ../ubuntu.iso 
# -drive format=raw,file=../drivers/virtio-win-0.1.141_amd64.vfd,if=floppy,format=raw \
# SMB: -net user,smb=~/Downloads \
# Video: -vga std -global VGA.vgamem_mb=512 \
# USB 2.0: -device usb-ehci,id=ehci -device usb-tablet,bus=ehci.0 \
# USB 3.0: -device qemu-xhci,id=xhci -device usb-tablet,bus=xhci.0 \
# Boot CD: -device virtio-net,netdev=vmnic,mac=ae:e8:3f:d3:fd:98 -netdev user,id=vmnic \
# Random mac addr command: openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'
