sudo virt-install \
  --name utshaw_vm \
  --memory 4096 \
  --vcpus 4 \
  --cpu host-passthrough \
  --disk path=/var/lib/libvirt/images/utshaw_vm.qcow2,format=qcow2 \
  --cdrom /var/lib/libvirt/images/CentOS-Stream-8-20240603.0-x86_64-dvd1.iso \
  --os-variant centos8 \
  --graphics spice \
  --network network=default \
  --boot uefi

