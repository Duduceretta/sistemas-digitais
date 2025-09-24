----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.09.2025 08:50:55
-- Design Name: 
-- Module Name: semaforo_btn - Behavioral
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

entity semaforo_btn is
  Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        btn : in STD_LOGIC;
        verde : out STD_LOGIC;
        amarelo : out STD_LOGIC;
        vermelho : out STD_LOGIC;
        vermelho_pedestre : out STD_LOGIC
   );
end semaforo_btn;

architecture Behavioral of semaforo_btn is
    type state_type is (SVERDE, SAMARELO, SVERMELHO, SVERMELHOPEDESTRE);
    signal estado, prox_estado : state_type;
begin
    
    process(clk, reset)
    begin
        if reset = '1' then
            estado <= SVERDE;
        elsif rising_edge(clk) then
            estado <= prox_estado;
        end if;
    end process;
    
    process(estado, btn)
    begin
        -- Saídas padrão
        verde <= '0';
        amarelo <= '0';
        vermelho <= '0';
        vermelho_pedestre <= '0';
        
        case estado is
            when SVERDE =>
            verde <= '1';
            prox_estado <= SAMARELO;
            
            when SAMARELO =>
            amarelo <= '1';
            prox_estado <= SVERMELHO;
            
            when SVERMELHO =>
            vermelho <= '1';
                if btn = '1' then            
                    prox_estado <= SVERMELHOPEDESTRE;
                else
                    prox_estado <= SVERDE;
                end if;
                    
            when SVERMELHOPEDESTRE =>
                vermelho <= '1';
                vermelho_pedestre <= '1';
                prox_estado <= SVERDE;
            
            when others =>
            prox_estado <= SVERDE;
        end case;
    end process;
end Behavioral;
