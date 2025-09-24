----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.09.2025 09:14:22
-- Design Name: 
-- Module Name: tb_semaforo_btn - Behavioral
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

entity tb_semaforo_btn is
--  Port ( );
end tb_semaforo_btn;

architecture Behavioral of tb_semaforo_btn is
    signal clk              : std_logic := '0';
    signal reset            : std_logic := '0';
    signal btn              : std_logic := '0';
    signal verde            : std_logic;
    signal amarelo          : std_logic;
    signal vermelho         : std_logic;
    signal vermelho_pedestre: std_logic;
    
    constant clk_period : time := 10 ns;  -- período do clock
begin
    uut: entity work.semaforo_btn
        port map (
            clk => clk,
            reset => reset,
            btn => btn,
            verde => verde,
            amarelo => amarelo,
            vermelho => vermelho,
            vermelho_pedestre => vermelho_pedestre
        );

    -- Geração do clock
    clk_process: process
    begin
        while true loop
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end loop;
    end process;

    -- Estímulos
    stim_proc: process
    begin
        -- Reset inicial
        reset <= '1';
        wait for 20 ns;
        reset <= '0';

        -- Ciclo normal sem apertar botão
        wait for 80 ns;

        -- Pressiona o botão (simula pedestre pedindo para atravessar)
        btn <= '1';
        wait for 20 ns;
        btn <= '0';

        -- Espera o semáforo completar transição
        wait for 100 ns;

        -- Outra vez pressiona botão
        btn <= '1';
        wait for 30 ns;
        btn <= '0';

        -- Roda mais um tempo
        wait for 200 ns;

        -- Finaliza simulação
        wait;
    end process;
end Behavioral;
