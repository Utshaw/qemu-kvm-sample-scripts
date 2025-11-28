#!/bin/bash

VM="utshaw_vm"

# Check VM status
STATUS=$(sudo virsh domstate $VM 2>/dev/null)

if [ "$STATUS" != "running" ]; then
    echo "[+] VM is not running. Starting $VM..."
    sudo virsh start $VM

    # Wait a moment for QEMU to initialize
    sleep 2
else
    echo "[+] VM is already running."
fi

echo "[+] Launching virt-viewer..."
virt-viewer $VM

