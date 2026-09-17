library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Bin_to_BCD is
    Port (
        bin_in   : in  STD_LOGIC_VECTOR(9 downto 0);   -- Entrada binaria de 10 bits
        unidades : out STD_LOGIC_VECTOR(3 downto 0);   -- Dígito unidades
        decenas  : out STD_LOGIC_VECTOR(3 downto 0);   -- Dígito decenas
        centenas : out STD_LOGIC_VECTOR(3 downto 0);   -- Dígito centenas
        millares : out STD_LOGIC_VECTOR(3 downto 0)    -- Dígito millares
    );
end Bin_to_BCD;

architecture Bin_to_BCD of Bin_to_BCD is
begin
    process(bin_in)
        -- Variables para BCD
        variable bcd        : unsigned(15 downto 0); -- 4 dígitos BCD (4x4 = 16 bits)
        variable bin_value  : unsigned(9 downto 0);
        variable i          : integer;
    begin
        -- Inicialización
        bcd       := (others => '0');
        bin_value := unsigned(bin_in);

        -- Algoritmo Double Dabble
        for i in 9 downto 0 loop
            -- Si un dígito BCD >= 5, sumamos 3
            if bcd(3 downto 0) >= 5 then
                bcd(3 downto 0) := bcd(3 downto 0) + 3;
            end if;
            if bcd(7 downto 4) >= 5 then
                bcd(7 downto 4) := bcd(7 downto 4) + 3;
            end if;
            if bcd(11 downto 8) >= 5 then
                bcd(11 downto 8) := bcd(11 downto 8) + 3;
            end if;
            if bcd(15 downto 12) >= 5 then
                bcd(15 downto 12) := bcd(15 downto 12) + 3;
            end if;

            -- Corrimiento a la izquierda: desplazar BCD y entrar siguiente bit del binario
            bcd := bcd(14 downto 0) & bin_value(i);
        end loop;

        -- Asignación de salidas
        unidades <= std_logic_vector(bcd(3 downto 0));
        decenas  <= std_logic_vector(bcd(7 downto 4));
        centenas <= std_logic_vector(bcd(11 downto 8));
        millares <= std_logic_vector(bcd(15 downto 12));
    end process;
end Bin_to_BCD;
