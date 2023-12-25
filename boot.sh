#!/bin/bash

HDA=$1
CDROM=$2
BOOT=c
MACH="mac99,via=pmu"
MEM=2048

if [ "$CDROM" ]; then
       	CDFLAG="-drive file=$CDROM,format=raw,media=cdrom"
fi

echo $CDROM | grep -i "os9" && MEM=512 && MACH="mac99" && BOOT=d
echo $HDA | grep -i "os9" && MEM=512 && MACH="mac99"

echo qemu-system-ppc \
	-boot $BOOT \
	-M $MACH \
	-m $MEM \
	-L /opt/homebrew/Cellar/qemu/8.1.1/share/qemu \
	-prom-env 'boot-args=-v' \
	-device VGA,edid=on \
	-prom-env "vga-ndrv?=true" \
	-g 1440x900x32 \
	-accel tcg,tb-size=2048 \
	-netdev user,id=network0 -device sungem,netdev=network0 \
	-usb -device usb-mouse -device usb-kbd \
	-drive file=$HDA,format=raw,media=disk $CDFLAG $BOOTARG

qemu-system-ppc \
	-boot $BOOT \
	-M $MACH \
	-m $MEM \
	-L /opt/homebrew/Cellar/qemu/8.1.1/share/qemu \
	-prom-env 'boot-args=-v' \
	-device VGA,edid=on,vgamem_mb=64,xres=1440,yres=900 \
	-prom-env "vga-ndrv?=true" \
	-g 1440x900x32 \
	-accel tcg,tb-size=2048 \
	-netdev user,id=network0 -device sungem,netdev=network0 \
	-usb -device usb-mouse -device usb-kbd \
	-drive file=$HDA,format=raw,media=disk $CDFLAG $BOOTARG
