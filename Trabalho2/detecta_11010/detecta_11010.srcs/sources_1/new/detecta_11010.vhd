----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.09.2025 08:16:19
-- Design Name: 
-- Module Name: detecta_11010 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity detecta_11010 is
  Port (
        clk : in STD_LOGIC; -- Clock
        reset : in STD_LOGIC; -- Reset síncrono-ativo-alto
        entrada : in STD_LOGIC; -- Entrada serial de bits
        saida : out STD_LOGIC
   );
end detecta_11010;

architecture Behavioral of detecta_11010 is
        type state_type is (S0, S1, S2, S3, S4, S5);
        signal estado, prox_estado : state_type;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            estado <= S0; -- Estado inicial
        elsif rising_edge(clk) then
            estado <= prox_estado; -- Atualiza estado
        end if;
    end process;

     process(estado, entrada)
    begin
        -- Valor padrão da saída
        saida <= '0';
        
        case estado is
            when S0 =>
                if entrada = '1' then
                    prox_estado <= S1;
                else
                    prox_estado <= S0;
                end if;
                
            when S1 =>
                if entrada = '1' then
                    prox_estado <= S2;
                else
                    prox_estado <= S0;
                end if;
    
            when S2 =>
                if entrada = '0' then
                    prox_estado <= S3;
                else
                    prox_estado <= S1;
                end if;
    
            when S3 =>
                if entrada = '1' then
                    prox_estado <= S4;
                else
                    prox_estado <= S0;
                end if;
                
            when S4 =>
                if entrada = '0' then
                    prox_estado <= S5;
                else
                    prox_estado <= S1;
                end if;

            when S5 =>
                saida <= '1'; 
                if entrada = '1' then
                    prox_estado <= S1;
                else
                    prox_estado <= S0;
                end if;
                
            when others =>
                prox_estado <= S0;
        end case;
    end process;
end Behavioral;
