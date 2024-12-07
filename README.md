## Welcome to libasm!
This is an exercise that consists of writing a small library in x86-64 assembly language, using Intel's syntax.
It's divided into the mandatory, and bonus parts:
  - The mandatory part introduced me to x86-64 (and assembly at large), and deals with basic concepts such as the logic of x86, calling convention, function and system calls, PIC/PIE, and more.
  - The bonus part is comprised of more complicated functions. This means learning to manipulate data structures (in this case, a linked list) at the assembly level.

To compile the project, simply 'make' it to get the libasm.a library file.
There are some main functions included in main.c to test a particular assembly function.
For example, if you want to try ft_write, uncomment everything under /\*ft_write\*/ in main.c, save the file, and compile + link it like so:

gcc main.c libasm.a -Wall -Wextra -Werror

The flags are optional, but you get the idea.

### why i did it bla bla bla
Lately I've been interested in the "bare bones" of how computers work.
It seemed to me that learning assembly language is an important (and very satisfying) milestone in the low-level computing journey.
[This article](https://cpu.land/) is a big part of what kindled my interest. Go read it, it's very cool.

Anyway, there it is, hope you enjoy :)
