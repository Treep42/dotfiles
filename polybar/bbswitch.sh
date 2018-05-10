#!/bin/sh
# skript to check which gpu is in use right now

if grep -q ON /proc/acpi/bbswitch; then
      echo "NVIDIA"
else
    echo "Intel"
fi
