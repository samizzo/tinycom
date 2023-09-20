bits 16

; Define the default sections. These match the sections that Watcom uses.
section _STARTUP use16 progbits alloc class=CODE
section _TEXT use16 progbits alloc class=CODE
section _DATA use16 progbits alloc class=DATA
section _BSS use16 nobits alloc class=BSS

; For .com all sections are in the same dgroup.
group DGROUP _STARTUP _TEXT _DATA _BSS

extern main_
global _start_

section _STARTUP

; .com files are loaded into memory starting at offset 100h of a segment.
; We resb 100h bytes to force that in here in the startup code.
resb 100h

_start_:
    call main_

    mov ax, 4c00h
    int 21h
