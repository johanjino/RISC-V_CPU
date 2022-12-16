
# **Team 8 IAC RISC-V CPU Coursework**

**Team Members:**
```
Johan Jino
Clemen Kok 
Shermaine Ang
Sohailul Islam Alvi
``` 
**Repository Tree**
```
Repository
    │   
    └───> main
    │      │----> README.md {Overview, Joint and Personal Statements}
    │      | 
    │      │----> rtl {Single-Cycle RISC-V}
    │      |       └───> README.md
    │      |       └───> risc_v.sv
    │      |       └───> risc_v_tb.cpp
    |      |
    │      └───> test {Single-Cycle RISC-V}
    │              └───> README.md
    │              └───> F1_program.asm
    │              └───> reference_program.asm
    │       
    │       
    │   
    └───> pipeline
    |      │----> rtl {Pipelined RISC-V}
    │      |       └───> README.md
    │      |       └───> risc_v.sv
    │      |       └───> risc_v_tb.cpp
    |      |
    │      └───> test {Pipelined RISC-V}
    │              └───> README.md
    │              └───> F1_program.asm
    │              └───> reference_program.asm
    |
    │       
    │   
    └───> cache
           │----> rtl {Pipelined RISC-V with Data Cache}
           |       └───> README.md
           |       └───> risc_v.sv
           |
           └───> test

```

## **Contribution Tables**
---


**Repository Files**

|File|Johan|Clemen|Shermaine|Alvi|
|---|---|---|---|---|
|control_unit.sv|*|
|pc_mux.sv|||*|
|data_mem.sv||*||x|
|risc_v.sv|x|||*|
|pc_Reg.sv|||*|
|datacache.sv||*|*||
|cachebranch.sv||*|*||
|instr_mem.sv|*|||x|
|sign_extend.sv|*|
|main/README.md|x|x|x|*|
|alusrc.sv||*|
|**/README.md||||*|
|reg_file.sv||*|
|risc_v_top.cpp||||*|
|control_unit.sv|*|
|alu.sv||*|
|F1_program.asm|x|x|x|x|
|sign_extend.sv|*|
```
 * = Principal Contributor
 x = Also Helped/Worked
```

**Pipeline Process**

|CPU Block|Johan|Clemen|Shermaine|Alvi|
|---|---|---|---|---|
|Fetch|||*|
|Data|*|
|Execute||*||
|Memory & Write||||*|
|Debug & Test|*|x|x|*|


```
 * = Principal Contributor
 x = Also Helped/Worked
```

## **Joint Statement of Contributions**
---

The RISC-V CPU was initially divided into four components based on the structure the team had used in Lab 4. Each member was assigned a specific area of contribution based on the various stages of the project, as stated below. The table below summarizes the tasks carried out by each member of the team throughout the coursework tenure; all points stated here are acknowledged and agreed by all the team members.

|Member|GH Username|Tasks|Elaboration|
|---|---|---|---|
|Shermaine Ang|notmaineyy|Program Counter & Adders (Single-Cycle CPU) <br> FETCH Block (Pipelined CPU) <br> Data Cache <br> Documentations|1. Single-Cycle CPU (Lab 4): Prepared HDL for program counter and relevant adders. <br> 2. Single-Cycle CPU (Lab 4): Created testbench for program counter and adders, for testing of individual component. <br> 3. Assisted with deadline setting, to keep everyone in the team in the loop, and ensuring meetups are arranged. <br> 4. Pipeline Stage: Worked with Clemen on initial idea for Pipelining - Added DFF for PCPlus4D and PCD <br> 5. Worked on the HDL needed for the FETCH block in new approach, and assisted with integration with the rest of the components. <br> 6. Added HDL needed for JALR in FETCH block. <br> 7. Read up on Data Cache <br> 8. Data Cache: Worked on HDL for Data Cache <br> 9. Contributed to documentation.|
|Johan Jino|johanjino|GitHub Actions and CI/CD Pipeline <br> Control Unit (Single-Cycle CPU) <br> DATA Block (Pipelined CPU)|1. Created GitHub Actions to maintain automated tests and ensure stability of the repo by preventing errors to be merged <br> 2. Worked on overall assembly of the CPU and its verification <br> 3. Single-Cycle CPU: Prepared HDL for the control unit and integreted all units. <br> 4. Pipeline Stage: Defined HDL for the DATA block and integrated together all the blocks. <br> 5. Worked to the reference program execution and inference. <br> 6. Documentation for the above|
|Clemen Kok|clemenkok|Project Management <br> ALU (Single-Cycle CPU) <br> EXECUTE Phase (Pipelined CPU)|1. Created the Repo and coordinated meetings with the team.  <br> 2. Set up and maintained a Gantt Chart so that each team member would be clear on the team's objectives at the various phases of the project. <br> 3. Single-Cycle CPU: Prepared HDL needed for ALU and tested it with testbench. <br> 4. Came up with and worked with team to implement assembly code needed to test Single-Cycle CPU. <br> 5. Pipeline Stage: performed an initial exploration into how the team should approach Pipelining. Implemented HDL across all components on Single-Cycle CPU. <br> 6. Realised approach would lead to bugs that would be hard to find (mostly reusing old code). Prepared the HDL needed for the EXECUTE phase, and helped to integrate it with the rest of the components.  <br> 7. Came up with approach for Data Cache implementation and worked on HDL as well as data retrieval. <br> 8. Gave pointers on how others could improve their code; contributed to documentation. <br> 9. Debugged reference program and got it to work by adding HDL for `add` and `lui` instructions.|
|Sohailul Islam Alvi|alvi-codes|Top-Level SV Module, <br> C++ Testbench, <br> Debug and Test, <br> Memory Block, <br> Execute Block, <br> Documentations|1. Assembled the overall CPU, by writing the top-level `risc_v.sv`, combining the components built by my team mates. <br> 2. Wrote the C++ testbench required to trace outputs and verify the design. <br> 3. Debugged and tested the overall design to ensure the outputs produced are correct in waveforms. <br> 4. Modified the testbenches to run the test programs on VBuddy, and recorded the outputs. <br> 5. Wrote the HDL for the MEMORY and EXECUTE blocks of the pipelined design. <br> 6. Worked with the team to integrate all blocks in the pipelined design. <br> 7. Updated memory allocations in the CPU designs to adhere to the given memory map. <br> 8. Debugged the reference program and worked to implement the HDL for `add` and `lui` instructions. <br> 9. Created the documentations in the `test` and `rtl` folders of the main and pipeline branhces, along with structuring the root `README.md` in the main branch that overviews the complete coursework.  

Component verification at each stage was done during group meetings where each member could give feedback and do live troubleshooting. In addition, improvements to other members' contributions was communicated in the team chat. The Project Gantt Chart can be seen below:  

![Alt text](test/images/gantt.png)


## **Brief Overview of Objectives**
---


### **Objective 1:** 
**F1 Starting Light Algorithm in RV32I Assembly Language**

The team met to discuss methods of implenting the F1 Starting Light Algorithm in RISC-V Asslembly Language, and decied to follow a method where `lb` will be used to load data into a0. This is a straightforward implementation that would enable the algorithm to start immediately upon trigger/reset. Trigger and Reset have the same functionality given that they both start the program. Also, no interrupts are implemented at this stage. The final assembly language program generated by the team can be found at [test/F1_program.asm](test/F1_program.asm) in the `main` branch.

<!-- 
During the first team meeting, we discussed about the implementation of the F1 Starting Light Algorithm in RISC-V Assembly Language. We compared two methods of implementation: (1) adding 2^n to a0 (where n is the state number); and (2) using lw to load data into a0. We decided to go with (2) as it was a more straightforward implementation. 

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

This schedule was mostly adhered to. Team Members decided to push back the Data Cache phase of the project to after 12/12/2022 to work on documentation and repo cleanup. -->

### **Objective 2:** 
**Single-Cycle RV32I Microarchitecture**

Using the works done to complete the Lab 4, the team members developed and verified the Single-Cycle CPU design, based on the designs found in the lecture slides. The work distribution and design details for the Single-Cycle RISC-V can be found at [rtl/README.md](rtl/README.md) in the `main` branch. The assembly program developed previously has been used to test and verify our design's functionality. Test results of the F1 assembly program, in terms of waveforms and video of the output implemented on VBuddy, can be found at [test/README.md](test/README.md) in the `main` branch.

### **Objective 3:** 
**Pipelined RV32I Microarchitecture**

The team decided to use the Pipelined CPU design found in the [lecture slides, (Lecture 8, slide 5)](http://www.ee.ic.ac.uk/pcheung/teaching/EIE2-IAC/Lecture%208%20-%20Pipelined%20Processor%20(notes).pdf) as a base to start with. The design was split into 4 RTL Design blocks and each member had to write the HDLs for their blocks and commit those into the `rtl` folder in the `pipeline` branch. The work distribution and design details for the Pipelined RISC-V can be found at [rtl/README.md](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-8/blob/pipeline/rtl/README.md) in the `pipeline` branch. The F1 assembly program had to be modified with 2 added `nop` instructions after each `jal`, `jalr` and `beq` instructions; which would compromise for the delays between each design block caused by the DFFs in between. Successful test results of the modified F1 assembly program, in terms of waveforms and video of the output implemented on VBuddy, can be found at [test/README.md](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-8/blob/pipeline/test/README.md) in the `pipeline` branch.

<!-- On the 5th of December 1600 to 1630, we discussed about how we should split up the tasks to get a pipelined CPU by the 8th of December for testing. We decided to split up the work as follows:

![Alt text](test/images/pipelined_cpu_blocks.jpg)

Distributed the work for this pipelined CPU as per the highlighted blocks above:

|Block|Member Responsible|
|---|---|
|Fetch|Shermaine Ang|
|Data|Johan Jino|
|Execute|Clemen Kok|
|Memory & Write|Sohailul Islam Alvi|

Each member made the necessary changes to the `risc_v.sv` top-level module file, to put togther their blocks into the design.

On the 8th of December 1000 to 1130, team members completed their individual phases of the Pipelining. We then added the components needed for Jump instructions and proceeded to test and debug the Pipelined CPU. A few bugs were detected: 
1. Write Enable in the Register File was not working as it should be. 
2. Missing lines of instructions. 

The Pipelined CPU worked as it should be after fixing the bugs. 

The working Pipelined CPU can be found in the `pipeline` branch.  -->

### **Objective 4:** 
**Pipelined RV32I Microarchitecture with Data Cache**

At this stage, the team split into clusters to focus on the major remaining aspects of the coursework. With regular discussions and meetings being held, Clemen and Shermaine started working on the Data Cache implementaion, whereas Johan and Alvi worked to memory-map the CPU design, and implement the new `byte` instructions to get the reference program working. Clemen and Shermaine met and decided to implement the Data Cache based on the Direct Mapped Cache Hardware found in the lecture slides. The approach was to add the direct mapped cache hardware in parallel to the current Data Memory block. There will then be a multiplexer that chooses the data, based on the value of `Hit`, to send into the DFF block between the Memory and Write processes. The design details for the Pipelined RISC-V with Data Cache can be found at [rtl/README.md](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-8/blob/cache/rtl/README.md) in the `cache` branch.

<!-- 

At this stage, the team split into clusters to focus on the major remaining aspects of the coursework. With regular discussions and meetings being held, Clemen and Shermaine started working on the Data Cache implementaion, whereas Johan and Alvi worked to memory-map the CPU design, and implement the new `byte` instructions to get the reference program working.

On the 13th of December, Clemen and Shermaine met and decided to implement the Data Cache based on the Direct Mapped Cache Hardware found in our lecture notes. The approach was to add the direct mapped cache hardware in parallel to the current Data Memory block. There will then be a multiplexer that chooses the data, based on the value of `Hit`, to send into the DFF block between the Memory -> Write process. 

More information on the approach, sketches and code can be found in the `cache` branch. -->
## **Personal Statements**
---

 **Johan Jino**

Single-Cycle CPU:
>I worked on the Control Unit to add working of all instructions. This also inculuded the sign extenstion unit. Futher went ahead to implement the `JAL`, `JALR` and `BYTE` instructions. Individual test benches where made to test every component in each block. Later, I worked on integrating all the components and fixing any bugs if present along with Alvi. Most of the commits for our single cycle are present in the [Lab 4 Repository](https://github.com/clemenkok/Lab4-Reduced-RISC-V).

Pipelined CPU:
>First we organised a plan to work on the pipeline. Since many signals of the control were a little different, we decided to start the cpu from scratch with a whole new layout for `JAL` and `JALR`. Then I split the work block wise for each team member. My work on the data block can be seen on this commit [DATA BLOCK](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-8/commit/375bf9c398e8ee84a7ed605937615efabfd8449b). After all blocks were implemented I and Alvi then focused on verifying its functionality with the test program as well as the program provided by Professor Cheung.

Data Cache:
> At the last stage of the coursework completion, Alvi and I focused onto getting the reference program working on our CPU and doing all the necessary modifications needed, along with [memory mapping](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-8/commit/964a1a5a4888a8691a8b502089bb49957f80caae) our CPU designs according to the given [memory diagram](https://github.com/EIE2-IAC-Labs/Project_Brief/blob/main/reference/images/memory_map.jpg). I also worked on adding the byte instructions to the all the other branches as per the reference program needed [Byte Instructions and completed pipeline commit](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-8/commit/a468b3c8156f8d576b40a4a2a17dd5b9583473a0). At this stage, regular team meetings were done to update each other regarding our works and do the necessary helps and exchange of ideas for the benefit of the coursework success; several joint contributions were done at this stage. Shermaine and Clemen focused on the Data Cache implementation, and updated us on the findings and new learnings along the way. Also, recorded vidoes of the working CPU run on Vubuddy and uploaded them to the respective test folder `README.md` files [Video reference](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-8/commit/449be2e27a47f0c234e848158383e623e03dd9ea).
---

 **Clemen Kok**

Single-Cycle CPU:

>I worked on the ALU component of the CPU. To acomplish this, I prepared the HDL needed for the ALU and tested it with my own C++ testbench. I used Professor Cheung's notes on the ALU to verify that the HDL that I had prepared was functional. Then, I pushed it to the repository (commits are located in our [Lab 4 Repository](https://github.com/clemenkok/Lab4-Reduced-RISC-V)). Alvi and Johan assisted with integrating it and testing that it worked with the assembly program that we came up with. I helped to debug the test for the reference program and realised that we had to add the `add` and `lui` instructions (which was why it was not working). Alvi and I [made the changes](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-8/commit/048d022319278fef41f3a8825e587f807aaac2d2).

Pipelined CPU:

>I looked ahead and figured out the team's approach for pipelining. This involved [modifying the team's code for a pipelined CPU](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-8/commit/7f8aa405674799c669c5a15893bd990eaccccc25). After I realised that this would be quite buggy, I raised it up to the team. Johan came up with the idea of splitting the CPU into 4 components - FETCH, DECODE, EXECUTE, MEMORY - which we then proceeded to do. I prepared the [EXECUTE component](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-8/commit/0fe90d5af1e598d6d22514eed22c4945b1c0d282) of the pipelined CPU. Johan and Alvi then focused on verifying its functionality with the test program as well as the program provided by Professor Cheung. Shermaine and I then focused on the implementation of Data Cache. However, as the team realised that we had to concentrate on implementing the SB and LBU instructions, we proceeded to stop working on data cache. I suggested that given the limited time, we focus on doing Byte instructions where we would Store / Load the LSB (Byte instructions would be implemented through the Control Unit). Johan then assisted with the implementation and testing.

Data Cache:

>I proposed an approach for Data Cache during my discussion with Shermaine. Shermaine prepared the HDL needed for this approach, while I helped to [improve it](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-8/commit/0e076c82d6d2fb5ad41f8091fa867dd327edddf2). While Johan worked on the Byte Instructions, I helped to [develop the HDL for Data Cache further](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-8/commit/28e070d4a593d94947dfcd7d7da96d929403fba2). The team could have completed the verification for the Data Cache should we have had more time. 

---


 **Shermaine Ang**

Single-Cycle CPU:

>I worked on the [Program Counter (PC) and the relevant adders](https://github.com/clemenkok/Lab4-Reduced-RISC-V/commit/f0cf8f77f30048da4c51ecedbf97cc969c42ad7c) of the CPU. I created the HDL needed for the PC to work and also created a top level SystemVerilog file to combine all the hardware components created for the PC. Before passing the work to Alvi for testing, I created a C++ testbench for the PC to verify if the PC was working as it should. It was working on its own, and then passed it on to Alvi to combine all the separate components together. <p> During the debugging phase, it was observed that the Single-Cycle CPU was not working as it should, and that there were some errors in the PC. The multiplexer that I had created had a clock, which was incorrect. My team members helped me fixed this error (as I was unwell). From this, I realised how important it was to work as a team, as there are times when I would miss out errors and other members would be able to help me find the errors that I have made, and work together to ensure that the entire thing works as it should be. <p> Moreover, Clemen had also told me an alternative to creating a whole block for a multiplexer. I could have used tenary statements in the top level file instead, which will simplify the creation and debugging processes. With this in mind, I later changed the code in the Pipelined CPU. <p> Just few hours before the deadline, the team was debugging the code as there were missing instructions. After Alvi and Clemen added HDL for `add` and `lui` instructions, we encountered another issue that `a0` remained at 0 throughout the 10000 cycles. While voicing out what the expected results is supposed to be, we realised that the number of cycles was insufficient. `t1` did not reach max and hence the program was not leaving loop2, we then increased the number of cycles, and the results were as expected. Reflection -- Rubber duck debugging eases our debugging process!

Pipelined CPU:

> I helped [implement the FETCH block](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-8/commit/e712bb6e51b34c8b9e4d5979fa818cce3d603052) for Clemen's initial approach but after realising that this was quite buggy, we met up again to think of a new approach. Our team split the pipelining equally amongst ourselves, and I was in charge of the [FETCH block](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-8/commit/3e3ce9a4d7780ed9e46455a940de8e50f9c15b67), as it had components from the PC, which was what I had created earlier on. Remembering what I had learnt from Lab 4, instead of creating a whole block for a multiplexer, I used tenary statements instead in the top level file, which turned out to be a lot simpler. <p> During one of our meetings, we were implementing the [Jump instructions](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-8/commit/578166f073b29fee47717a5e18aea412ab816dbf), and I really enjoyed working as a team, as we all worked on different parts together, and I could ask my team members any questions I had. I was in charge of implementing a multiplexer within the FETCH block, and worked with Alvi and Johan as they were implementing hardwares in their respective blocks. Communicating with my team members in person made the implementation go really smoothly, as we could check with one another as soon as we had any issues. <p> When debugging the Pipelined CPU, our team supported one another to look out for errors, as mentioned previously, some might miss certain bugs, and these could be detected by others in the team. We eventually managed to debug our Pipelined CPU quite quickly with the help of everyone in the team. <p> Other than the HDL required, I also contributed to the [documentation](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-8/commit/635007db177997fa3232ba36cca072e8096e9817), ensuring that members are aware of what we have to do, and the respective deadlines. Clemen started doing this, and I felt that it was an important part, especially in a group setting, and hence, added on to the documentation whenever we had any discussions or set any deadlines for ourselves. 

Data Cache:

> Using Clemen's proposal of the approach for Data Cache, I reread the lecture notes to have a better understanding of how data cache worked. I prepared the [HDL](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-8/commit/bfb8c701313054d3d2d0c770ebe9f7726cb095c4) required for the approach, which was later further improved by Clemen. We, however, did not continue implementing the data cache as we encountered other pressing problems, hence, testing has not been done for the data cache, but could have been completed if given more time. 
---

**Sohailul Islam Alvi**

Single-Cycle CPU:

 >I combined all my fellow group mates' works into a complete form, to assemble the fully functional Single-Cycle RISC-V CPU. I also created the top level SystemVerilog file, and the C++ testbench to verify the correctness of our [F1 program](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-8/commit/d50d3691ddc7ddb17af4717b7bca4289de5dd95d) running on our CPU; along with debugging and doing all the required modifications at each stage. Commits made upto this stage are all present in the [Lab 4 Repository](https://github.com/clemenkok/Lab4-Reduced-RISC-V). With that, I have traced the outputs via a0 from our CPU, onto the waveform viewer, implemented the program outputs into the VBuddy and have recorded the output behaviour, as seen in the [test/readme.md](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-8/commit/a97f22889fb07bf754793b064339284f1104e974). I have also helped in implementing the ADD and LUI instructions to get the reference program working on our CPU design which was [comitted by Clemen](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-8/commit/6a3542a158e4f62c45ebcae30dca22bfd5b52ea1).

Pipelined CPU:
> For the pipelining process, I have been resposible for the [MEMORY and WRITE](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-8/commit/2262105118f982af35651b4c691936f7cb7ffcc0) blocks of the CPU. Afterwards, I also implemented the [wirings for the JALR](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-8/commit/98ba634dd272976d92e2067ec29f802cb4e91ab2) instruction across the top-level module of the Pipelined CPU design. Then, I [debugged and verified](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-8/commit/ed68e2b6b3ea73e112f5ded4c47a36b14041e500) the design and its workability, along with Johan to ensure our Pipelined CPU is fully functional in terms of our [F1 Program](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-8/blob/pipeline/test/F1_program.asm) and the reference program provided; adding the necessary [NOP instructions](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-8/commit/b596c47be7361140f5fb0fa4320c1f2141f72aa9) where needed. The assembly programs used, along with the test output waveforms and behaviour recordings on VBuddy are all available in the [test/readme.md](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-8/commit/0066c8e5060e7f2a7947c21ed537d7c5a20f9f0a) file.

Data Cache:
> At the last stage of the coursework completion, Johan and I focused onto getting the reference program working on our CPU and doing all the necessary modifications needed, along with [memory mapping](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-8/commit/964a1a5a4888a8691a8b502089bb49957f80caae) our CPU designs according to the given [memory diagram](https://github.com/alvi-codes/Project_Brief/blob/main/reference/images/memory_map.jpg). I also structured and wrote the [main branch README.md](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-8/commit/e4792540421148ab59925dc1480b1b8bf8e9507d) as per the coursework guidelines, and set up the base for my team mates to write their parts as well. At this stage, regular team meetings were done to update each other regarding our works and do the necessary helps and exchange of ideas for the benefit of the coursework success; several joint contributions were done at this stage. Shermaine and Clemen focused on the Data Cache implementation, and updated us on the findings and new learnings along the way. 
---
# **--------------------------------APPENDIX--------------------------------**
---

## **Additional Details on Coursework Approach**

During the first team meeting, we discussed about the implementation of the F1 Starting Light Algorithm in RISC-V Assembly Language. We compared two methods of implementation: (1) adding 2^n to a0 (where n is the state number); and (2) using `lw` to load data into a0. We decided to go with (2) as it was a more straightforward implementation. 

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

Using the works done to complete the Lab 4, the team members developed and verified the Single-Cycle CPU design, based on the designs found in the lecture slides. The work distribution and design details for the Single-Cycle RISC-V can be found at [rtl/README.md](rtl/README.md) in the `main` branch. The assembly program developed previously has been used to test and verify our design's functionality. Test results of the F1 assembly program, in terms of waveforms and video of the output implemented on VBuddy, can be found at [test/README.md](test/README.md) in the `main` branch.

On the 5th of December 1600 to 1630, we discussed about how we should split up the tasks to get a pipelined CPU by the 8th of December for testing. We decided to split up the work as follows:

![Alt text](test/images/pipelined_cpu_blocks.jpg)

Distributed the work for this pipelined CPU as per the highlighted blocks above:

|Block|Member Responsible|
|---|---|
|Fetch|Shermaine Ang|
|Data|Johan Jino|
|Execute|Clemen Kok|
|Memory & Write|Sohailul Islam Alvi|

Each member made the necessary changes to the `risc_v.sv` top-level module file, to put togther their blocks into the design.

On the 8th of December 1000 to 1130, team members completed their individual phases of the Pipelining. We then added the components needed for Jump instructions and proceeded to test and debug the Pipelined CPU. A few bugs were detected: 
1. Write Enable in the Register File was not working as it should be. 
2. Missing lines of instructions. 

The Pipelined CPU worked as it should be after fixing the bugs. 

The working Pipelined CPU can be found in the `pipeline` branch.

At this stage, the team split into clusters to focus on the major remaining aspects of the coursework. With regular discussions and meetings being held, Clemen and Shermaine started working on the Data Cache implementaion, whereas Johan and Alvi worked to memory-map the CPU design, and implement the new `byte` instructions to get the reference program working.

On the 13th of December, Clemen and Shermaine met and decided to implement the Data Cache based on the Direct Mapped Cache Hardware found in our lecture notes. The approach was to add the direct mapped cache hardware in parallel to the current Data Memory block. There will then be a multiplexer that chooses the data, based on the value of `Hit`, to send into the DFF block between the Memory -> Write process. 

More information on the approach, sketches and code can be found in the `cache` branch
