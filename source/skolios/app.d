import skolios.console;

import uefi;

@nogc:
nothrow:

Console console;

extern(C) EFI_STATUS efi_main(EFI_HANDLE handle, EFI_SYSTEM_TABLE* systemTable)
{
	console = Console(systemTable);

	console.clearScreen();
	console.log("Hello, World!");
	console.log("SkoliOS v1.0.0 meets you!");
	console.log("Firmware vendor is: ", false);
	console.logAtPtr(systemTable.FirmwareVendor);	

	while(true)	{}
	return EFI_SUCCESS;
}