Overview-
- This is just an attempt to understand coding in Assembly. I have linked the tutorials that I followed for that.
- Currently following programs are present -
  - `hello.asm` - Prints hello world.
  - `triangle.asm` - Prints triangle.
  - `fizzbuzz.asm` - Prints classic fizz-buzz.
- A blog post will follow this soon with detailed info about the process and my learnings from this.

Steps-
- Make sure `nasm` and `ld` command are available in the path. Keep note that the binaries for these two are highly specific to the architecture of the OS you are building on, so download them accordingly.
- `make` - To build binaries for your assembly files. Current files have been coded for MacOS 64-bit only.
- `make clean` - To remove all existing binaries of your files.

References-
- Tutorial source - https://www.tutorialspoint.com/assembly_programming
- Registers and Memory - https://www.youtube.com/watch?v=fpnE6UAfbtU
- Assembly (using NASM) in 64 bit - https://cs.lmu.edu/~ray/notes/nasmtutorial/
- Ld (Linker) issue in MacOS - https://articles.jaredcamins.com/building-a-kernel-for-a-toy-os-on-os-x-6002ea8a69b4
- FizzBuzz problem solution source - https://gist.github.com/mholmerp/6c52a675f65947235090d65f70826f88
