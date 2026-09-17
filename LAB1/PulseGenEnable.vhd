library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PulseGenEnable is
    Port (
        clk    : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        Enable  : out STD_LOGIC
    );
end PulseGenEnable;

architecture PulseGenEnable of PulseGenEnable is
    -- Contador suficiente para llegar a 99_9999_999
    signal count : unsigned(26 downto 0) := (others => '0');
begin

    process(clk, reset)
    begin
        if reset = '1' then
            count <= (others => '0');
            Enable <= '0';

        elsif rising_edge(clk) then
            if count = 99_999_999 then
                count <= (others => '0');
                Enable <= '1';  -- Pulso de 1 ciclo
            else
                count <= count + 1;
                Enable <= '0';
            end if;
        end if;
    end process;

end PulseGenEnable;
