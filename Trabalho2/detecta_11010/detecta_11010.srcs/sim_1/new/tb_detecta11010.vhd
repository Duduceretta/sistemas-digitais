----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.09.2025 08:35:30
-- Design Name: 
-- Module Name: tb_detecta11010 - Behavioral
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

entity tb_detecta11010 is
--  Port ( );
end tb_detecta11010;

architecture Behavioral of tb_detecta11010 is
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '1';
    signal entrada : STD_LOGIC := '0';
    signal saida : STD_LOGIC;
    -- Período do clock
    constant clk_period : time := 10 ns;
begin
    uut: entity work.detecta_11010
        port map (
            clk => clk,
            reset => reset,
            entrada => entrada,
            saida => saida
        );

    clk_process : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;


    stim_proc: process
    begin
      
        -- Reset inicial
            reset <= '1';
            wait for 2*clk_period;
            reset <= '0';
            
            -- Sequência de bits para testar
            -- Espera-se detectar "101" ? saída = '1'
            entrada <= '1';
            wait for clk_period; -- aplica '1'
            
            entrada <= '0';
            wait for clk_period; -- aplica '0'
            
            entrada <= '1';
            wait for clk_period; -- aplica '1' ? saída deve ser '1'
            
            wait for 5 ns;
    end process;
end Behavioral;
