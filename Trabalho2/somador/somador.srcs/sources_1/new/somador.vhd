----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.09.2025 08:07:25
-- Design Name: 
-- Module Name: somador - Behavioral
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

entity somador is
  Port (
        a    : in  STD_LOGIC_VECTOR(1 downto 0);
        b    : in  STD_LOGIC_VECTOR(1 downto 0);
        soma : out STD_LOGIC_VECTOR(2 downto 0)
   );
end somador;

architecture Behavioral of somador is

begin
    soma <= std_logic_vector(resize(unsigned(a), 3) + resize(unsigned(b), 3));
end Behavioral;
