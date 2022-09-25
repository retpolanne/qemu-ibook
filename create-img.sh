#!/bin/bash
OUTPUT=$1
qemu-img create -f raw -o size=60G $OUTPUT
