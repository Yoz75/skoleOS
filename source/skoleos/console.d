module skoleos.console;
import core.stdc.stdlib;
import uefi;

@nogc:
nothrow:

struct KeyInput
{
    ushort scanKode;
    wchar character;
}

/// The interface to write text to the terminal and get input from it
struct Console
{
    @nogc:
    nothrow:

    public enum newLine = "\r\n"w;
    private EFI_SYSTEM_TABLE* systemTable;
    
    public this(EFI_SYSTEM_TABLE* systemTable)
    {
        this.systemTable = systemTable;
    }

    void clearScreen()
    {
        systemTable.ConOut.ClearScreen(systemTable.ConOut);
    }

    /// Log a wchar array.
    /// Params:
    ///   message = the message, may be string or may not. MUST BE NULL TERMINATED
    ///   insertNewLine = should console insert new line?
    void log(inout(wchar)[] message, bool insertNewLine = true)
    {
        inout(wchar)[] msg = void;
        if(insertNewLine)
        {
            enum newLineSize = newLine.length;

            // + 1 because of \0
            immutable size = message.length + newLineSize + 1;

            auto ptr = cast(wchar*) alloca(size * wchar.sizeof);
            wchar[] msgSlice = ptr[0..size];

            foreach(i, ch; message)
            {
                msgSlice[i] = ch;
            }

            foreach(i, ch; newLine)
            {
                msgSlice[message.length + i] = ch;
            }
            
            msgSlice[$ - 1] = '\0';
            // we do not modify the msgSlice after this point so we can cast safely
            msg = cast(inout(wchar)[]) msgSlice;
        }
        else
        {
            msg = message;	
        }

        systemTable.ConOut.OutputString(systemTable.ConOut, cast(CHAR16*) msg.ptr);
    }

    /// Log a null terminated string at some pointer
    /// Params:
    ///   message = the string
    void logAtPtr(inout(wchar)* message)
    {
        systemTable.ConOut.OutputString(systemTable.ConOut, cast(CHAR16*) message);
    }
}