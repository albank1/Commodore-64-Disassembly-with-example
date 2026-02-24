# Commodore-64-Disassembly-with-example
Disassembly of Pitfall concentrating on the process of disassembly Commodore 64 games.

# Summary of process
1) Use JC64dis to disassemble the .prg or .crt
2) Mark the areas that are data as HEX, where this will include the first 9 bytes of a .crt
3) I erase a lot of the automatic disassembly comments
4) Export this as a Dasm assembly format
5) use dasm (dasm input.asm -o output.bin -f3) to compile and if not resolve issues
6) use cartconv -t normal -i output.bin -o output.crt
7) if it reports errors use cartconv -i original.crt -o original.bin then use bin2byte.py to find the address where output.bin and original.bin differ.
8) test the .crt

# Disassembling process in detail
Previously I have used ChatGPT 5.2 but have found that although it is good for learning the principles it is not good enough to disassemble games.

This time I used JC64dis disassembler. The other tools I used were the stand alone program that comes with VICE the Commodore 64 emulator, CARTCONV, a program I created that takes a the binary file and converts this into a this to a text file with the format that can be assembled with dasm. This program came in very useful.

Firstly I created a project in JC64dis and loaded the game I wanted to disassemble, Pitfall.

The first thing to note in the assembly code in Pitfall is the information on what type of cartridge and where it starts in memmory.
<img width="512" height="392" alt="jc64img" src="https://github.com/user-attachments/assets/84f43563-5ab8-43f9-b314-2c046a1f06e5" />

It can be seen that the address for this code is $8000, which is the usual area of memory that cartridges are loaded into. At $8000 there are two addresses: coldstart and warmstart followed by the text CBM80. The C64 checks for the CBM80 and then runs the address at $8000. So the first part of the assembly code.
<img width="569" height="195" alt="disassm" src="https://github.com/user-attachments/assets/bfffddbe-2986-4ecc-ac57-765054176ce5" />
Then in this case the code starts at $8009. I have identified areas that look like data. Usually there is a JMP or branch just before this and the data usually has multiple jam / noop codes and 00s or FFs.

I next ran dasm to compile this with dasm pitfall.asm -o pitfall.bin -f3.

I ran cartconv -t normal -i pitfall.bin -o pitfall.crt. This came up with an error with the length of the file being less than 8192 bytes (ie less than 8K). Conclusiong: it is worth looking at the size of the file. 

I used bin2byte.py to convert the pitfall.bin file. And also converted the original pitfall.crt to a bin file cartconv -i pitfall.crt -o pitfallorig.bin. Used bin2byte.py again to convert this file.

I could then compare the starting values of each line to see where the difference occured. In conjunction I used the monitor on VICE (ALT+H) to disassemble this address to see what was occuring. It turns out that the issue is that some assembly commands have zero byte versions eg LDA $05 can either be compiled the same as LDA $0005 (ie 3 bytes) or 2 bytes. The orginal code used the 3 byte variant and dasm was more efficient and used the 2 byte variant. With dasm you can force it to use the 3 byte version with .w
eg
LDA.w $0006 
or
<img width="181" height="115" alt="disass2" src="https://github.com/user-attachments/assets/dcb619ce-000f-4c04-a228-aadaa9119736" />
There turned out to be two of these commands that I needed to force to be 3 bytes (no zero byte commands).

After running dasm and then cartconv again on the modified assembly code it compiled into a .crt pitfall.crt and worked correctly on VICE.





