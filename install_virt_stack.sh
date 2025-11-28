#!/bin/bash

echo "[+] Updating repo metadata..."
sudo dnf makecache

echo "[+] Installing virtualization packages..."
sudo dnf install -y \
    qemu-kvm \
    qemu-img \
    libvirt \
    libvirt-daemon \
    libvirt-daemon-driver-qemu \
    libvirt-client \
    virt-install \
    virt-manager \
    virt-viewer \
    bridge-utils \
    spice-server \
    spice-gtk \
    edk2-ovmf

echo "[+] Enabling and starting libvirtd..."
sudo systemctl enable --now libvirtd

echo "[✔] Virtualization stack installed."
echo "[✔] KVM should now be ready."

