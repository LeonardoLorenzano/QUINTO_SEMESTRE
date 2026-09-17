library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Counter10 is
    Port (
        clk     : in  STD_LOGIC;
        reset   : in  STD_LOGIC;
        enable  : in  STD_LOGIC;
        up_down : in  STD_LOGIC;  -- '1' = UP, '0' = DOWN
        q       : out STD_LOGIC_VECTOR(9 downto 0)  -- salida del contador
    );
end Counter10;

architecture Counter10 of Counter10 is
    signal count : unsigned(9 downto 0) := (others => '0');
begin

    process(clk, reset)
    begin
        if reset = '1' then
            count <= (others => '0');

        elsif rising_edge(clk) then
            if enable = '1' then
                if up_down = '1' then
                    count <= count + 1;
                else
                    count <= count - 1;
                end if;
            end if;
        end if;
    end process;

    q <= std_logic_vector(count);

end Counter10;
