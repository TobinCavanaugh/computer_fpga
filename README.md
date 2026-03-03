## Project Overview: FPGA Integration for CSC 457
### 8-Bit Computer Architecture (Ben Eater Design): 
This repository contains the Verilog source code for the FPGA portion of our 8-bit computer project for CSC 457: Hardware Programming. While the original Ben Eater design relies on discrete 74-series TTL logic, this implementation transitions the core computational units—specifically the Program Counter (PC), ALU, and Registers—into a modern hardware description language (HDL) environment.
The goal of this specific module is to demonstrate how low-level architectural concepts (like bus arbitration and synchronous resets) are handled within an FPGA while maintaining compatibility with the physical breadboard hardware.


### Deployment: 
1. Synthesize the project using your assigned FPGA toolchain (Quartus/Vivado).
2. Assign Pins to match the header connections on the breadboard computer.
3. Flash the code to the fpga.
