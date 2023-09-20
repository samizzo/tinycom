# Tiny .com files with Watcom

It's possible to generate tiny .com files with Watcom that don't use any
of the default libraries. This can be convenient because it means you can
write your program in C across multiple source modules and then link them
together into a single .com.

This small repository is an example of how this can be accomplished.

The basics are:

* link with `nodefaultlibs`
* define a custom system that orders the sections appropriately (TEXT followed by DATA)
* write custom startup code that starts at offset 100h, and tell the linker to use it

