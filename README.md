## Welcome to libasm!
This is an exercise that consists of writing a small library in x86-64 assembly language, using Intel's syntax.
It's divided into the mandatory, and bonus parts:
  - The mandatory part introduced me to x86-64 (and assembly at large), and deals with basic concepts such as:
      the logic of x86, calling convention, function and system calls, PIC/PIE, and more.
  - The bonus part is comprised of more complicated functions. This means learning to manipulate data structures (notably, a linked list) at the assembly level. Whew.

To compile the project, simply 'make' it to get the libasm.a library file.
Then, go into main.c and uncomment the main function for the function that you want to use.
For example, if you want to try ft_write, uncomment everything under /*ft_write*/ in main.c, save the file, and compile + link it like so:
  gcc main.c libasm.a -Wall -Wextra -Werror
The flags are optional, but you get the idea.

### why i did it bla bla bla
Lately I've been interested in the "bare bones" of how computers work.
It seems to me that learning assembly language is a nice (and very satisfying) milestone in grasping the world of low-level computing.
[This article](https://cpu.land/) is a big part of what kindled my interest. Go read it, it's very cool.

Anyway, there it is, hope you enjoy :)
