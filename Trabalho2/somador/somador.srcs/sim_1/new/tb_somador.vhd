----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.09.2025 09:29:06
-- Design Name: 
-- Module Name: tb_somador - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_somador is
--  Port ( );
end tb_somador;

architecture Behavioral of tb_somador is
    signal a, b : STD_LOGIC_VECTOR(1 downto 0);
    signal soma : STD_LOGIC_VECTOR(2 downto 0);
begin
    uut: entity work.somador
        port map (
            a => a,
            b => b,
            soma => soma
        );

    stim_proc: process
    begin
        for i in 0 to 3 loop
            for j in 0 to 3 loop
                a <= std_logic_vector(to_unsigned(i, 2));
                b <= std_logic_vector(to_unsigned(j, 2));
                wait for 10 ns;
            end loop;
        end loop;
        wait;
    end process;
end Behavioral;
