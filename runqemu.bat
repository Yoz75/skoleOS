dub build --compiler=ldc2
cd bin/efi/boot
del BOOTX64.efi
ren BOOTX64.exe BOOTX64.efi
cd ../../..
qemu-system-x86_64 -bios ./OVMF/OVMF_X64.fd -drive file=fat:rw:./bin/,format=raw