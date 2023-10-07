#!/bin/bash

HDA=$1
CDROM=$2
BOOT=c
MACH="mac99,via=pmu"
MEM=2048

if [ "$CDROM" ]; then
       	CDFLAG="-drive file=$CDROM,format=raw,media=cdrom"
	BOOT=d
fi

echo $CDROM | grep -i "os9" && MEM=512 && MACH="mac99"
echo $HDA | grep -i "os9" && MEM=512 && MACH="mac99"

echo qemu-system-ppc \
	-boot $BOOT \
	-M $MACH \
	-m $MEM \
	-prom-env 'boot-args=-v' \
	-device VGA,edid=on \
	-prom-env "vga-ndrv?=true" \
	-g 1440x900x32 \
	-netdev user,id=network0 -device sungem,netdev=network0 \
	-drive file=$HDA,format=raw,media=disk $CDFLAG $BOOTARG

qemu-system-ppc \
	-boot $BOOT \
	-M $MACH \
	-m $MEM \
	-prom-env 'boot-args=-v' \
	-device VGA,edid=on \
	-prom-env "vga-ndrv?=true" \
	-g 1440x900x32 \
	-netdev user,id=network0 -device sungem,netdev=network0 \
	-drive file=$HDA,format=raw,media=disk $CDFLAG $BOOTARG
