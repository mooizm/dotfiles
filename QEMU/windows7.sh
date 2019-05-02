#!/bin/sh
qemu-system-x86_64 -enable-kvm -m 4G -cpu host -smp 2 \
	-drive file=./images/Windows7.img,if=virtio \
	-device virtio-net,netdev=vmnic,mac=DE:AD:BE:EF:CF:DD -netdev user,id=vmnic \
	-vga virtio \
	-soundhw hda \
	-name "Windows" \
	$@
