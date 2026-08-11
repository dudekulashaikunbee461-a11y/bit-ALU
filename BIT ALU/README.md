# 🧮 8-Bit ALU Using Verilog HDL

## 📌 Project Description

This project implements an **8-Bit Arithmetic Logic Unit (ALU)** using Verilog HDL.

An ALU is an important digital circuit used inside processors and digital systems to perform arithmetic and logical operations.

This ALU supports:

- Addition
- Subtraction
- AND
- OR
- XOR
- NOT
- Left Shift
- Right Shift

The design also provides:

- Carry flag
- Zero flag

---

## 🎯 Objectives

The objectives of this project are:

- Understand the working of an ALU.
- Perform arithmetic operations using Verilog.
- Perform logical operations using Verilog.
- Implement shift operations.
- Generate carry and zero flags.
- Create a Verilog testbench.
- Simulate the ALU.
- Analyze the waveform using GTKWave.
- Upload the complete project to GitHub.

---

## 🛠️ Tools Used

- Verilog HDL
- Icarus Verilog
- GTKWave
- GitHub

---

## 📂 Project Structure

```text
8-BIT-ALU-VERILOG/
│
├── README.md
├── alu_8bit.v
├── alu_8bit_tb.v
└── simulation/
    └── alu_waveform.png
```

---

# 📖 What is an ALU?

ALU stands for **Arithmetic Logic Unit**.

It is a digital circuit that performs arithmetic and logical operations.

ALUs are commonly used in:

- CPUs
- Microprocessors
- Microcontrollers
- Digital signal processors
- FPGA systems

---

# ⚙️ Operations Supported

| ALU_Sel | Operation | Description |
|---------|-----------|-------------|
| `000` | ADD | A + B |
| `001` | SUB | A - B |
| `010` | AND | A AND B |
| `011` | OR | A OR B |
| `100` | XOR | A XOR B |
| `101` | NOT | NOT A |
| `110` | SHL | A shifted left |
| `111` | SHR | A shifted right |

---

# 🔌 Inputs

| Signal | Width | Description |
|--------|-------|-------------|
| `A` | 8 bits | First input |
| `B` | 8 bits | Second input |
| `ALU_Sel` | 3 bits | Operation selection |

---

# 📤 Outputs

| Signal | Width | Description |
|--------|-------|-------------|
| `ALU_Out` | 8 bits | Operation result |
| `Carry` | 1 bit | Carry/borrow indicator |
| `Zero` | 1 bit | 1 when result is zero |

---

# 🧠 ALU Operation Table

## 1. Addition

```text
A = 10
B = 5

10 + 5 = 15
```

Selection:

```text
ALU_Sel = 000
```

---

## 2. Subtraction

```text
A = 10
B = 5

10 - 5 = 5
```

Selection:

```text
ALU_Sel = 001
```

---

## 3. AND

```text
A = 10 = 00001010
B = 5  = 00000101

AND    = 00000000
```

Selection:

```text
ALU_Sel = 010
```

---

## 4. OR

```text
A = 10 = 00001010
B = 5  = 00000101

OR     = 00001111
```

Result:

```text
15
```

Selection:

```text
ALU_Sel = 011
```

---

## 5. XOR

```text
A = 10 = 00001010
B = 5  = 00000101

XOR    = 00001111
```

Result:

```text
15
```

Selection:

```text
ALU_Sel = 100
```

---

## 6. NOT

The NOT operation inverts every bit of A.

```text
A = 00001010

NOT A = 11110101
```

Selection:

```text
ALU_Sel = 101
```

---

## 7. Shift Left

```text
A = 00001010

A << 1 = 00010100
```

Decimal:

```text
10 << 1 = 20
```

Selection:

```text
ALU_Sel = 110
```

---

## 8. Shift Right

```text
A = 00001010

A >> 1 = 00000101
```

Decimal:

```text
10 >> 1 = 5
```

Selection:

```text
ALU_Sel = 111
```

---

# 💻 Verilog Code

```verilog
module alu_8bit (
    input wire [7:0] A,
    input wire [7:0] B,
    input wire [2:0] ALU_Sel,

    output reg [7:0] ALU_Out,
    output reg Carry,
    output wire Zero
);

    always @(*) begin

        ALU_Out = 8'b0;
        Carry   = 1'b0;

        case (ALU_Sel)

            3'b000:
                {Carry, ALU_Out} = A + B;

            3'b001: begin
                ALU_Out = A - B;
                Carry   = (A < B);
            end

            3'b010:
                ALU_Out = A & B;

            3'b011:
                ALU_Out = A | B;

            3'b100:
                ALU_Out = A ^ B;

            3'b101:
                ALU_Out = ~A;

            3'b110:
                ALU_Out = A << 1;

            3'b111:
                ALU_Out = A >> 1;

            default: begin
                ALU_Out = 8'b0;
                Carry   = 1'b0;
            end

        endcase

    end

    assign Zero = (ALU_Out == 8'b0);

endmodule
```

---

# 🧪 Testbench

The testbench checks all eight operations.

Test values:

```text
A = 10
B = 5
```

Operations tested:

```text
Addition
Subtraction
AND
OR
XOR
NOT
Shift Left
Shift Right
```

Additional tests are performed for:

```text
255 + 1
10 - 10
```

---

# ▶️ Simulation Using Icarus Verilog

## Step 1: Compile

```bash
iverilog -o alu_sim alu_8bit.v alu_8bit_tb.v
```

## Step 2: Run

```bash
vvp alu_sim
```

---

# 📊 Expected Output

The terminal should display output similar to:

```text
Time=0  | A=10  | B=5 | Sel=000 | Out=15 | Carry=0 | Zero=0
Time=10 | A=10  | B=5 | Sel=001 | Out=5  | Carry=0 | Zero=0
Time=20 | A=10  | B=5 | Sel=010 | Out=0  | Carry=0 | Zero=1
Time=30 | A=10  | B=5 | Sel=011 | Out=15 | Carry=0 | Zero=0
Time=40 | A=10  | B=5 | Sel=100 | Out=15 | Carry=0 | Zero=0
Time=50 | A=10  | B=5 | Sel=101 | Out=245| Carry=0 | Zero=0
Time=60 | A=10  | B=5 | Sel=110 | Out=20 | Carry=0 | Zero=0
Time=70 | A=10  | B=5 | Sel=111 | Out=5  | Carry=0 | Zero=0
Time=80 | A=255 | B=1 | Sel=000 | Out=0  | Carry=1 | Zero=1
Time=90 | A=10  | B=10| Sel=001 | Out=0  | Carry=0 | Zero=1
```

---

# 📈 Waveform Simulation

The testbench generates:

```text
alu_waveform.vcd
```

Open it using GTKWave:

```bash
gtkwave alu_waveform.vcd
```

Add these signals:

```text
A
B
ALU_Sel
ALU_Out
Carry
Zero
```

---

# 📊 Expected Waveform Results

| A | B | Operation | Result |
|---:|---:|-----------|---:|
| 10 | 5 | ADD | 15 |
| 10 | 5 | SUB | 5 |
| 10 | 5 | AND | 0 |
| 10 | 5 | OR | 15 |
| 10 | 5 | XOR | 15 |
| 10 | 5 | NOT | 245 |
| 10 | 5 | SHL | 20 |
| 10 | 5 | SHR | 5 |
| 255 | 1 | ADD | 0 + Carry |
| 10 | 10 | SUB | 0 |

---

# 📸 Simulation Result

Take a screenshot of your GTKWave simulation and save it as:

```text
simulation/alu_waveform.png
```

Add the screenshot to this README:

```markdown
![8-Bit ALU Simulation](simulation/alu_waveform.png)
```

---

# ✅ Result

The **8-Bit ALU** was successfully designed and simulated using Verilog HDL.

The ALU correctly performs:

```text
ADD
SUB
AND
OR
XOR
NOT
SHIFT LEFT
SHIFT RIGHT
```

It also generates:

```text
Carry Flag
Zero Flag
```

---

# 📚 Learning Outcomes

After completing this project, you will understand:

- Arithmetic Logic Units
- Arithmetic operations
- Logical operations
- Shift operations
- Multiplexing using `case`
- Verilog combinational logic
- Carry flag
- Zero flag
- Testbench development
- Icarus Verilog simulation
- GTKWave waveform analysis
- GitHub project organization

---

## 👩‍💻 Author

**Satya Nandini**

GitHub Repository:

`8-bit-alu-verilog`