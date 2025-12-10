# 4-bit Synchronous Binary Counter using VHDL

##  4-bit Synchronous Binary Counter VHDL Project Overview Note: AI was used to assist with adherence to syntax rules for VHDL

This project is an exercise in utilizing foundational skills in synchronous digital logic design using VHDL. Specifically GHDL is used to code. 

The circuit implements a 4-bit register that counts sequentially from 0 (`0000`) to 15 (`1111`) and then returns to 0.

##  Key Design Features
* **Synchronous Logic:** The counting operation is controlled by the **rising edge** of the `CLK` (Clock) signal.
* **Asynchronous Reset:** A high value on the `RST` (Reset) signal immediatly sets the count to `0000`, independent of the clock.
* **VHDL Constructs:** Utilizes `ENTITY`, `ARCHITECTURE`, and the `PROCESS` structure with `rising_edge()` detection, showing command of sequential logic description.

##  Repository Structure
* **`README.md`**: This file.
* **`.gitignore`**: Ensures temp compiler files are **not** public.
* **`src/`**: Contains all VHDL source code files:
    * `counter.vhd`: The main circuit design (UUT unit under test)
    * `counter_tb.vhd`: The self-checking testbench to verify functionality.

##  Verification Simulation Proof
The circuit was compiled with **GHDL** and simulated for 200 ns.

**Observed Behavior:** The output signal `Q` changes values only on the positive transion of the `CLK` signal, and is immediately forced to return to `0000` when `RST` is asserted high. Waveform given by GTKWave.

**Example of GTKWave Waveform for T-FF based register for counter that is transformed as D-FF register for the counter by GHDL

![4-bit Synchronous Counter Waveform Example](https://github.com/YugioCard59/VHDL_viaGHDL_4BitSynch_Counter/blob/main/images/T_FF_implementedasD_FFbyVHDL.png?raw=true)

## Tools Used
* **VHDL-2002/2008 Standard**
* **GHDL:** Compiler and Simulator
* **GTKWave:** Waveform Viewer