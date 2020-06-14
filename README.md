# Computer-Architecture

The lab projects of Computer Architecture lesson in 2020. The goal was to create a working mips like processor that could perform basic functions such as:

```shell
00: addi r5, r0, 8
04: ori r3, r0, 0xABCB
08: sw r3, 4(r0) 
0C: lw r10, -4(r5)
10: lb r16, 4(r0) 
14: nand r4, r10, r16
```

## Phase 1

Implemented a single cycle processor. 

## Phase 2

We expanded the single cycle to multicycle and pipeline processor.

## Run 

If you want to run the project just cd the directory you want and run the executable file. 
