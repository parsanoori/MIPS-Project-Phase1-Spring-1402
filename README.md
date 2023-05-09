# Computer Architecture MIPS Project phase 1 Spring 1402

## What's needed?

There are two options which literally have the same difficulties to go through. The first one the Mars option which requires java and also evolves going through a Graphical way to generate binary files. And the second one which requires SPIM and qtSpim and python3. You can also go through using `gen-binary.py` for the opcode.bin generation and use `Mars.jar` as the simulator.

Option 1:
1. Java 8+
2. Mars.jar (provided in the repo)

Option 2:
1. SPIM
2. Python3
3. qtSpim

## What's here?

In this repository there are 5 kinds of files:

1. The verilog (.v) files which are described in the Dr Jahanian's class and his TA class. From these you have to complete the `mips_core.v`.
2. The `run.do` which is used to automate the procedures in Modelsim.
3. The assembly files (.asm) which shall have the instructions needed to test the MIPS module. You should also complete these as in `sample.asm`.
4. The `gen-binary.py` which converts the assembly language to machine code.
5. Other...

## What has to be done?

1. Complete the `mips_core.v`.
2. Test the impelementation.
3. Debug if needed and jump to step 2. Otherwise step forward.
4. Well done!

## What's the proccedure of testing?

Testing evolves completing each `.asm`, file running the `gen-binary.py` and running the `run.do` in the Modlesim. You can also use `Mars.jar` to convert the `.asm` file to a binary text file. You have to provide the screenshot of the registers (and dmem if needed) in your report. You should run each `.asm` using qtSpim or `Mars.jar` and provide the screenshot of the registers (and dmem if needed) in your report. Eventually you have to check if the state of the program in the the simulator is equal to your implementation or not.

### Do not hesitate to ask questions in the telegram group of the course.


