# Commodore-64-Disassembly-with-example
Disassembly if Pitfall concentrating on the process of disassembly Commodore 64 games

Previously I have used ChatGPT 5.2 but have found that although it is good for learning the principles it is not good enough to disassemble games.

This time I used JC64dis disassembler. The other tools I used were the stand alone program that comes with VICE the Commodore 64 emulator, CARTCONV, a program I created that takes a the binary file and converts this into a this to a text file with the format that can be assembled with dasm. This program came in very useful.

Firstly I created a project in JC64dis and loaded the game I wanted to disassemble, Pitfall.

The first thing to note in the assembly code in Pitfall is the information on what type of cartridge and where it starts in memmory.
