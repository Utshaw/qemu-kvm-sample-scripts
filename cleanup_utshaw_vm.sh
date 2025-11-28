#!/bin/bash
# Completely wipe the VM "utshaw_vm" from libvirt & storage

VM="utshaw_vm"
IMG_DIR="/var/lib/libvirt/images"

echo "[+] Stopping VM (if running)..."
sudo virsh destroy $VM &>/dev/null

echo "[+] Undefining VM from libvirt (remove nvram, snapshots, states)..."
sudo virsh undefine $VM --nvram --managed-save --snapshots-metadata &>/dev/null

echo "[+] Removing disk images..."
sudo rm -f $IMG_DIR/${VM}.qcow2
sudo rm -f $IMG_DIR/${VM}.img

echo "[+] Removing any leftover XML definitions..."
sudo rm -f /etc/libvirt/qemu/${VM}.xml
sudo rm -f /etc/libvirt/qemu/autostart/${VM}.xml

echo "[+] Removing VM logs..."
sudo rm -f /var/log/libvirt/qemu/${VM}.log
sudo rm -f /var/log/libvirt/qemu/${VM}.xml

echo "[+] Removing NVRAM (UEFI) files..."
sudo rm -f /var/lib/libvirt/qemu/nvram/${VM}_VARS.fd
sudo rm -f /var/lib/libvirt/qemu/nvram/${VM}_CODE.fd

echo "[+] Restarting libvirt service..."
sudo systemctl restart libvirtd

echo "[✔] utshaw_vm fully removed."

