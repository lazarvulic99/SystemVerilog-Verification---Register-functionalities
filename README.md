# SystemVerilog-Verification---Register-functionalities

Error checking implemented with Verilog, SystemVerilog and UVM.

Register has following functionalities:
LOAD, CLEAR, INC, DEC, ADD, SUB, INVERT, SERIAL_INPUT_LSB, SERIAL_INPUT_MSB, SHIFT_LOGICAL_LEFT, SHIFT_LOGICAL_RIGHT, SHIFT_ARITHMETIC_LEFT, SHIFT_ARITHMETIC_RIGHT, ROTATE_LEFT, ROTATE_RIGHT.

Register has 15b control signal control, 1b input data serial_input_lsb, serial_input_msb, 8b data parallel_input, 1b output data serial_output_lsb, serial_output_msb and 8b data out parallel_output.

Running project:
1. Open terminal in VS Code
2. Type bash
3. Type cd tooling/
4. Type make simul_run
5. Cleaning the project make simul_clean
