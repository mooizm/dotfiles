#!/bin/sh
qemu-system-x86_64 -enable-kvm -m 8G -cpu host -smp 2 \
	-drive file=../images/Windows10.img,if=virtio -snapshot \
	-device virtio-net,netdev=vmnic,mac=de:ad:be:ef:cf:dd -netdev tap,id=vmnic,script=qemu-ifup.sh,downscript=no \
	-vga virtio \
	-device qemu-xhci,id=xhci -device usb-tablet,bus=xhci.0 \
	-vga qxl \
	-soundhw hda \
	-rtc base=localtime \
	-name "Windows 10" \
	$@

# Install: -boot d -cdrom ../win10.iso -drive file=../drivers/virtio-win-0.1.141_amd64.vfd,if=floppy,format=raw \
# Default Networking: -device virtio-net,netdev=vmnic,mac=de:ad:be:ef:cf:dd -netdev user,id=vmnic \
