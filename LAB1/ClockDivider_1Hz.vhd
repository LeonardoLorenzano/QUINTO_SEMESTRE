 library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ClockDivider_1Hz is
    Port (
        clk_in   : in  STD_LOGIC;   -- Reloj de entrada (100 MHz)
        reset    : in  STD_LOGIC;   -- Reset síncrono
        clk_out  : out STD_LOGIC    -- Reloj dividido (1 Hz)
    );
end ClockDivider_1Hz;

architecture ClockDivider_1Hz of ClockDivider_1Hz is
    -- Contador suficiente para llegar a 50,000,000
    signal count   : unsigned(25 downto 0) := (others => '0'); -- 26 bits
    signal clk_reg : STD_LOGIC := '0';
begin

    process(clk_in, reset)
    begin
        if reset = '1' then
            count   <= (others => '0');
            clk_reg <= '0';

        elsif rising_edge(clk_in) then
            if count = 49999999 then  -- 50 millones - 1
                count   <= (others => '0');
                clk_reg <= not clk_reg; -- alterna salida
            else
                count <= count + 1;
            end if;
        end if;
    end process;

    clk_out <= clk_reg;

end ClockDivider_1Hz;
