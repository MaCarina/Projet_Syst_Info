----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.04.2022 10:52:03
-- Design Name: 
-- Module Name: ALU - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_Alu : in STD_LOGIC_VECTOR (1 downto 0); --dit l'operation a effectuer
           S : out STD_LOGIC_VECTOR (7 downto 0);
           N : out STD_LOGIC;
           O : out STD_LOGIC;
           Z : out STD_LOGIC;
           C : out STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

--signaux locaux pour calculer le carry et l'overflow
signal A_16 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal B_16 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal S_16 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

begin
    A_16 <= (X"00"&A);
    B_16 <= (X"00"&B);
    S_16 <= (A_16 + B_16) when Ctrl_Alu="00" else
            (A_16 - B_16) when Ctrl_Alu="01" else
            (A * B) when Ctrl_Alu="11"
            ;
    process
    begin
        if (S_16 > 255) and Ctrl_Alu="00" then
            C <= '1';
        elsif (S_16 > 255) and Ctrl_Alu="11" then
            O <= '1';
        elsif (S_16 = X"00") then
            Z <= '1';
        elsif (S_16(15) = '1') and Ctrl_Alu="01" then
            N <= '1';
        end if;
    end process;
    S <= S_16(7 downto 0);
end Behavioral;
