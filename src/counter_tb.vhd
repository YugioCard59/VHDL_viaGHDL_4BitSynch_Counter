-- Test bench , generates clock and reset signals needed for counter
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- The Testbench Entity usually empty
entity counter_tb is
end entity counter_tb;

architecture test of counter_tb is
    -- Signal declarations (wires connecting the counter)
    signal CLK_tb   : std_logic := '0';
    signal RST_tb   : std_logic := '1'; -- Start with Reset on
    signal Q_tb     : std_logic_vector(3 downto 0);

    -- Clock period constant (clk speed)
    constant CLK_PERIOD : time := 10 ns;

begin
    -- 1. Instantiate (connect) the counter component
    -- Unit Under Test
    UUT: entity work.counter(behavioral)
        port map (
            CLK => CLK_tb,
            RST => RST_tb,
            Q => Q_tb
        );

    -- 2. Generate Clock signal
    CLK_PROCESS : process
    begin
        loop
            CLK_tb <= '0';
            wait for CLK_PERIOD / 2;    -- Half the period (5 ns)  
            CLK_tb <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process CLK_PROCESS;

    -- 3. Generate Test Simuation of sequence of inputs
    STIMULUS_PROCESS : process
    begin
        -- Start: Keep Reset ON for 20 ns to initialize the circuit
        RST_tb <= '1';
        wait for 20 ns;

        -- Step 1: Turn Reset OFF and let the counter start counting
        RST_tb <= '0';
        wait for 160 ns;  

        -- Step 2: The test is complete
        report "Simulation Testbench finished successfully." severity NOTE;
        wait;   --Stop process permanently
    end process STIMULUS_PROCESS;
end architecture test;
    