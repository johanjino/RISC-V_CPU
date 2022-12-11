
# **Team 8 IAC RISC-V CPU Coursework**

**Team Members:**
```
Johan Jino
Clemen Kok 
Shermaine Ang
Sohailul Islam Alvi
``` 

**Joint Statement of Contributions**

The RISC-V CPU was initially divided into four components based on the structure the team had used in Lab 4. Each member was assigned a specific area of contribution based on the various stages of the project, as outlined below.

|Member|GH Username|Tasks|Elaboration|
|---|---|---|---|
|Shermaine Ang|   |   |   |
|Johan Jino|   |   |   |
|Clemen Kok|clemenkok|Project Management, ALU (Single-Cycle CPU), EXECUTE Phase (Pipelined CPU)|1. Created the Repo and coordinated meetings with the team.  2. Set up and maintained a Gantt Chart so that each team member would be clear on the team's objectives at the various phases of the project.  3. Single-Cycle CPU: Prepared HDL needed for ALU and tested it with testbench.  4. Came up with and worked with team to implement assembly code needed to test Single-Cycle CPU.  4. Pipeline Stage: performed an initial exploration into how the team should approach Pipelining. Implemented HDL across all components on Single-Cycle CPU.  5. Realised approach would lead to bugs that would be hard to find (mostly reusing old code). Prepared the HDL needed for the EXECUTE phase, and helped to integrate it with the rest of the components.  6. I also gave pointers on how others could improve their code.|
|Sohailul Islam Alvi|   |   |   |

Verification of each stage was done during group meetings where each member could give feedback and do live troubleshooting. In addition, improvements to other members' contributions was communicated in the team chat. 

**Repository Branches**
```
Repository
    │   
    └───> main
    │      │----> README.md {Joint and Personal Statements}
    │      | 
    │      │----> rtl {Single-Cycle RISC-V}
    │      |       └───> README.md
    │      |       └───> risc_v.sv
    │      |       └───> risc_v_tb.cpp
    |      |
    │      |----> test
    │              └───> README.md
    │              └───> F1_program.asm
    │              └───> reference_program.asm
    │       
    │       
    │   
    └───> pipeline
    |      │----> rtl {Single-Cycle RISC-V}
    │      |       └───> README.md
    │      |       └───> risc_v.sv
    │      |       └───> risc_v_tb.cpp
    |      |
    │      |----> test
    │              └───> README.md
    │              └───> 
    │       
    │       
    │   
    └───> cache
           │----> rtl {Pipelined RISC-V with Data Cache}
           |       └───> README.md
           |
           |----> test

```


## **Objective 1:** 
## F1 Starting Light Algorithm in RV32I Assembly Language

During our first meeting on the 1st of December from 0900 to 1100, we discussed about the implementation of the F1 Starting Light Algorithm in Assembly. We compared two methods of implementation: (1) adding 2^n to a0 (where n is the state number); and (2) using lw to load data into a0. We decided to go with (2) as it was a more straightforward implementation. 

Our algorithm is as follows (a first cut produced from the meeting, though we agreed that all should go and do their own implementation): 

```
main
0 lw a1 8(zero)
4 jal C # begin subroutine
8 beq a1 a1 3C # end the program

mloop
c lw a0 0(zero) # 8b'0 also li is psuedo instruction, we store it in data mem
10 lw a0 1(zero) # 8b'1
14 lw a0 2(zero) # 8b'11
18 lw a0 3(zero) # 8b'111
1C lw a0 4(zero) # 8b'1111
20 lw a0 5(zero) # 8b'11111
24 lw a0 6(zero) # 8b'111111
28 lw a0 7(zero) # 8b'1111111
2C lw a0 8(zero) # 8b'11111111
30 nop
34 nop
38 beq a0, a1, x0 # branch back to original pc+4 (saved in rd)

iloop
3C nop
40 beq a1 a1 3C
```

This method would enable the algorithm to start immediately upon trigger/reset. Trigger and Reset have the same functionality given that they both start the program. No interrupts are implemented.

We worked out a schedule for the project, given below.

|Date|Task|Members Involved|
|---|---|---|
|1/12/2022 - 5/12/2022|Prepare Assembly Code for F1, Verify Single-Cycle CPU (adding connections) and Prepare HDL for Pipelined CPU|Alvi, Clemen, Shermaine, Johan|
|5/12/2022 - 8/12/2022|Write Assembly Code to test Pipelined CPU and Verify|Johan and Alvi|  
|8/12/2022 - 12/12/2022|Data Cache|All|
|12/12/2022 - 16/12/2022|Project Buffer and Final Touches|All|

This schedule was mostly adhered to. Team Members decided to push back the Data Cache phase of the project to after 12/12/2022 to work on documentation and repo cleanup.

## **Objective 2:** 
## Single-Cycle RV32I Microarchitecture



## **Objective 3:** 
## Pipelined RV32I Microarchitecture
On the 5th of December 1600 to 1630, we discussed about how we should split up the tasks to get a pipelined CPU by the 8th of December for testing. We decided to split up the work as follows:

![Alt text](pipelined_cpu_blocks.jpg)

Distributed the work for this pipelined CPU as per the highlighted blocks above:

|Block|Member Responsible|
|---|---|
|Fetch|Shermaine Ang|
|Data|Johan Jino|
|Execute|Clemen Kok|
|Memory & Write|Sohailul Islam Alvi|

Pipelined CPU can be found in the `pipeline` branch. 

Each member made the necessary changes to the `risc_v.sv` top-level module file, to put togther their blocks into the design

## **Objective 4:** 
## Pipelined RV32I Microarchitecture with Data Cache
