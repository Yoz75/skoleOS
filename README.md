<img width="1287" height="863" alt="изображение" src="https://github.com/user-attachments/assets/b36be0e7-78a5-4464-9ed1-7e35604581de" />

# What is it
SkoliOS is a small UEFI application. I'm not a pro in osdev, this project is made to prove that it is possible to make an UEFI application **using dub and Windows**.

# Dependencies
* Windows (actually it is possible to modify the dub.json file and run it on Linux)
* dub
* uefi-d
* Qemu
* OVMF (already included!!!)

# Building
* runqemu.bat -- run in debug mode
* runqemur.bat -- run in release mode
<br>
<br>

The github release is just a zip archive that contains the EFI/BOOT/BOOTX64.efi file. You can use it to manually run QEMU
