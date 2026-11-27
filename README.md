# Note! Readme is incomplete.
# libeasy
A lib to make aarch64 ASM easier.

This is a static library for assembly code.
As known, assembly code is long in writing. For example, to write "Hello, World!\n" into stdout, you have to code:

```asm (pseudocode)
<...>
mov x8, #64
mov x0, #1
ldr x1, =msg_to_write
mov x2, #14
svc #0
mov x0, #0
mov x7, #1
svc #0

.data
msg_to_write: .asciz "Hello, World!\n"
```

And, with my library, this program can be much shorter:

```asm (pseudocode)
<...>
ldr x0, =msg_to_write
bl print
bl exit

.data
msg_to_write: .asciz "Hello, World!"
```

# Functions

At the moment, this library provides these functions:

- **writeln**: writes a null-terminated text (.asciz) and automatically adds "\n" at the end.
  - INPUT:   x0 - address to the .asciz string to write.
  - RETURNS: nothing.
  - REGISTERS USED: x0, x1, x2, x3.
- **write**: writes a null-terminated text (.asciz).
  - INPUT:   r0 - address to the .asciz string to write.
  - RETURNS: nothing.
  - REGISTERS USED: r0, r1, r2, r3.
- **readfile**: .
  - INPUT:   nothing.
  - RETURNS: nothing.
  - REGISTERS USED: nothing.
- **countsym**: counts symbols of the string given.
  - INPUT:   r0 - address to the .asciz string to count symbols.
  - RETURNS: r0 - count of the symbols with \0
  - REGISTERS USED: r0.

# Compiling

For compiling a file with the lib, you have to specify -L<path/to/lib> and -leasy flags to the compiler, for example:

```bash
clang -nostdlib -static -Wl,--entry=_start -o test test.s -L. -leasy
```

# Integrating with C
This lib can be integrated with C. Usage then:
```c
extern void writeln(const char *msg);
//extern void exit(); NOTE: this coflicts with libc function
extern int countsym(const char *line);
int main()
{
    writeln("Hello, World!");
    return countsym("");
    // exit();
}
```
