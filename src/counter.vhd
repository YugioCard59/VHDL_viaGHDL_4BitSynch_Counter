-- This file describes the electronic circuit. Defines CLK, RST inputs and output. Provides the logic for the counter.
-- Compile:  ex. in PowerShell use commands ghdl -a <name of file>
-- The Library: Standard logic and numeric packages for math
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- The Entity: Defines the input and outputs (The "pins" of the chip, ports of the logic gates)
entity counter is 
    port (
        CLK :   in std_logic;   -- Clock input
        RST :   in std_logic;   --- Reset input: sets count back to 0
        Q   :   out std_logic_vector(3 downto 0)    -- Output: 4 bits for the count (0-15 decimal) (0000-1111 binary)
    );
end entity counter;

-- The Architecture: Defines the internal circuit logic. Behavior shows what the circuit does.
architecture behavioral of counter is
    -- Internal storage for the count (registers)
    signal current_count  :  unsigned(3 downto 0) := "0000";
begin
    -- This process block describes a Synchronous Circuit (controlled by the clock)
    process(CLK, RST)
    begin
        if RST = '1' then
        -- This is the asynchronous reset: it happens immediately
            current_count <= "0000";
        elsif rising_edge(CLK) then
            -- This happens only when the clock transitions from 0 to 1 rising edge
            current_count <= current_count + 1;
        end if;
    end process;

    -- Connect the internal register to external output pin
    Q <= std_logic_vector(current_count);

end architecture behavioral;

------------------------------------------------------------------------------------------------------------------------------
-- EXAMPLE STRUCTURAL D-FF ARCHITECTURE (commented out for example)
------------------------------------------------------------------------------------------------------------------------------

-- architecture structrual_dff of counter is
--  --1. Component Declaration for D-FF
--  component D_FF
--      port (
--          D   : in std_logic; -- Data input: next value for Q
--         CLK : in std_logic; -- Clock input (synchronous)
--          RST : in std_logic; -- Reset input (asynchronous)
--          Q   : out std_logic; -- 1-bit output (current value)
--      );
--  end component;

--  -- 2. Internal Signals: The "wires" connecting the combinational logic to the D-FF inputs
--  --These signals are the calculated "next state" values (D inputs)
--  signal Q_internal : std_logic_vector(3 downto 0);

--  --Internal wire for the current output Q, used for calculation
--  signal Q_internal : std_logic_vector(3 downto 0);

--  begin
--  -- Connect the interal Q to the external output port; signal assignment operator <= to assign value on the right to the signal on the left after short delay/next clock
--      Q <= Q_internal;

--  -- Combinational Logic Block: Calcuates the D input for each D-FF
--  -- This logic determines the "next count state" based on the "current count state" (Q_internal)

--  -- Bit 0 (LSB): Q(0) always toggles (Q_next = Q_current XOR 1)
--      D_in(0) <= not Q_internal(0);

--  -- Bit 1: Q(1) toggles only if Q(0) is '1' (Q_next = Q(1) XOR Q(0))
--      D_in(1) <= Q_internal(1) xor Q_interal(0);

--  -- Bit 3 (MSB): Q(3) toggles only if Q(0) AND Q(1) AND Q(2) are '1'
--      D_in(3) <= Q_internal(3) xor (Q_interal(0) and Q_interal(1) and Q_interal(2));

--  -- D-FF Instantiation Block (memory elements)
--  -- All 4 D-FFs are connected to the SAME clock (CLK) for synchronous

--  -- D-FF for Bit 0
--  FF_0: D_FF
--      port map (
--          D => D_in(0),   -- Connects to the calcuated D input
--          CLK => CLK,
--          RST => RST,
--          Q => Q_internal(0)  -- Output feeds back to the combinational logic
--  );

--  -- D-FF for Bit 1
--  FF_1: D_FF
--      port map (
--          D => D_in(1),
--          CLK => CLK,
--          RST => RST,
--          Q => Q_interal(1)
--  );

--  --  D-FF for Bit 2
--  FF_2: D_FF
--      port map (
--          D => D_in(2),
--          CLK => CLK,
--          RST => RST,
--          Q => Q_interal(2)
--  );

-- -- D-FF for Bit 3
--  FF_3: D_FF
--      port map (
--          D => D_in(3),
--          CLK => CLK,
--          RST => RST,
--          Q => internal(3)
--  );

-- end architecture structrual_dff;