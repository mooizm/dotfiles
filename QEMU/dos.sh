#!/bin/sh
qemu-system-i386 -m 64M -cpu pentium -boot d \
-hda ../images/dos.img \
-cdrom ../FD12CD.iso \
#-drive format=raw,file=../FLOPPY.img,if=floppy,format=raw   \
-soundhw sb16,adlib,pcspk \
-vga std \
-name "DOS" \
