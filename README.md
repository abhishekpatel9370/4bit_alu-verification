# 4-Bit ALU Design and Verification in SystemVerilog

## 🧠 Project Overview

This project implements a **4-bit Arithmetic Logic Unit (ALU)** using SystemVerilog. The ALU performs basic arithmetic and logic operations based on a 2-bit operation select input. It includes a SystemVerilog testbench to verify the functionality using simulation.

## 📁 File Structure

| File Name             | Description                                         |
|-----------------------|-----------------------------------------------------|
| `alu_4bit.sv`         | RTL design of the 4-bit ALU                         |
| `Alu_verification.sv` | Testbench to verify ALU operations                  |

## 🔧 ALU Operations

The ALU supports the following 2-bit operations:

| `op_sel` | Operation         | Description                        |
|----------|-------------------|------------------------------------|
| `00`     | ADD               | Adds A and B                       |
| `01`     | SUB               | Subtracts B from A                |
| `10`     | Bitwise Inverter  | Bitwise NOT of A (`~A`)           |
| `11`     | Reduction OR      | OR-reduction of A, expanded to 4-bit |

## 🧪 Testbench Features

- Covers all ALU operations with sample test inputs
- Uses `$display` for simulation output
- Manual checking of expected vs actual output

## ▶️ How to Simulate

1. Open your preferred SystemVerilog simulator (e.g., ModelSim, Vivado).
2. Compile the files:

   ```bash
   Simulate the testbench:

bash
Copy
Edit
vsim work.tb_alu
run -all
✅ Sample Output
yaml
Copy
Edit
ADD: A = 0101, B = 0011 => OUT = 1000
SUB: A = 0101, B = 0011 => OUT = 0010
INV: A = 0101 => OUT = 1010
ROR: A = 0101 => OUT = 0001
   vlog alu_4bit.sv Alu_verification.s
