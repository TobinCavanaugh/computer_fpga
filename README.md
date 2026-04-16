## Project Overview: FPGA Integration for CSC 457
### 8-Bit Computer Architecture (Ben Eater Design): 
This repository contains the Verilog source code for the FPGA portion of our 8-bit computer project for CSC 457: Hardware Programming. While the original Ben Eater design relies on discrete 74-series TTL logic, this implementation transitions the core computational units, specifically the Program Counter (PC), ALU, and Registers, into a modern hardware description language (HDL) environment.
The goal of this specific module is to demonstrate how low-level architectural concepts (like bus arbitration and synchronous resets) are handled within an FPGA while maintaining compatibility with the physical breadboard hardware.


### Deployment: 
1. Synthesize the project using your assigned FPGA toolchain (Quartus/Vivado).
2. Assign Pins to match the header connections on the breadboard computer.
3. Flash the code to the fpga.

### Challenges and state of the project
We struggled a lot with clock issues, only resolving them finally on our last day of class.
Due to this we didn't have the momentum to implement the more complex parts of the system, however we wrote a preliminary ALU HDL file.

### Tobins responses:

How did you like the merging of the Ben Eater 8-bit computer with the FPGA board?: \
I thought the concept was very cool, I like the idea of expanding both our knowledge in FPGA/Embedded and actual computer implementation.
I found verilog to be a huge pain, however I don't believe there are good alternatives.


What did you think of the separation between the discrete components vs what was designed in the FPGA board?: \
I found combining the two to be the difficult part, the code itself was not that difficult, granted the electronics were very tricky.
I found the main points of struggle to be when the two had to "talk", maybe more time spent on doing things like this earlier in the semester would've helped.
Though its hard to tell if this is just a difficult problem in general.

What courses in your previous courses best helped you prepare for this course?: \
I think doing Design Lab helped me a lot, and allowed me to think in an embedded way.

What type of courses would have better helped you prepare for this course?: \
I think having more structure, along with more consistent targets for getting different parts of the computer done.
I found I didn't know how much work was expected for outside of class, and I think with more prior planning and course architecture we would've been more successful.

What was the hardest part in getting the discrete computer parts working?: \
It seemed like we fried a lot of electronics and the process was quite difficult.
I'm not versed in electronics, but I wonder if using higher quality breadboards or wires might've alleviated some of this?


What was the hardest part in getting the FPGA components working? :\
The pin planning was definitely the most tricky part.
I find the quartus pin planner to be very hard to read, and the seemingly random pin selections also made things difficult.
I think a great step would be to make a student resource that provides pin layouts, notes, etc, as the actual documentation was sometimes quite confusing.
