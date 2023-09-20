nasm -f obj startup.asm -o startup.obj

REM Use -zls and -zl to stop the compiler from emitting any standard library symbols
REM Use -ms to specify small memory model
wcc -zls -zl -ms -s -d2 main.c -fo=main.obj

REM Use nodefaultlibs to stop the linker from linking the default libraries.
REM We also use a custom lnk script to set up our own custom system to have data sections follow the code.
wlink @tinycom.lnk option nodefaultlibs option start=_start_ option map=tinycom.map option showdead option statics option verbose system tinycom option caseexact file {main.obj startup.obj} name tinycom.com
