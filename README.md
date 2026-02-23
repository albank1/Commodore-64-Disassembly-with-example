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

Previously I have used ChatGPT 5.2 but have found that although it is good for learning the principles it is not good enough to disassemble games.

This time I used JC64dis disassembler. The other tools I used were the stand alone program that comes with VICE the Commodore 64 emulator, CARTCONV, a program I created that takes a the binary file and converts this into a this to a text file with the format that can be assembled with dasm. This program came in very useful.

Firstly I created a project in JC64dis and loaded the game I wanted to disassemble, Pitfall.

The first thing to note in the assembly code in Pitfall is the information on what type of cartridge and where it starts in memmory.
<img width="512" height="392" alt="jc64img" src="https://github.com/user-attachments/assets/84f43563-5ab8-43f9-b314-2c046a1f06e5" />
