----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.04.2022 11:58:34
-- Design Name: 
-- Module Name: Test_ALU - Behavioral
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

entity Test_ALU is
--  Port ( );
end Test_ALU;

architecture Behavioral of Test_ALU is

COMPONENT ALU
PORT(
    A : in STD_LOGIC_VECTOR (7 downto 0);
    B : in STD_LOGIC_VECTOR (7 downto 0);
    Ctrl_Alu : in STD_LOGIC_VECTOR (1 downto 0); --dit l'operation a effectuer
    S : out STD_LOGIC_VECTOR (7 downto 0);
    N : out STD_LOGIC;
    O : out STD_LOGIC;
    Z : out STD_LOGIC;
    C : out STD_LOGIC
);
END COMPONENT;

--Inputs
signal A_local : std_logic_vector(7 downto 0) := (others => '0');
signal B_local : std_logic_vector(7 downto 0) := (others => '0');
signal Ctrl_Alu_local : std_logic_vector(1 downto 0) := (others => '0');
--Outputs
signal S_local : std_logic_vector(7 downto 0) := (others => '0');
signal N_local : std_logic := '0';
signal C_local : std_logic := '0';
signal O_local : STD_LOGIC := '0';
signal Z_local : STD_LOGIC := '0';

begin

-- Instantiate the Unit Under Test (UUT)
Label_alu: ALU PORT MAP (
    A => A_local,
    B => B_local,
    S => S_local,
    Ctrl_Alu => Ctrl_Alu_local,
    N => N_local,
    Z => Z_local,
    C => C_local,
    O => O_local
);

-- Stimulus process
-- T1 < T2 et T3 < T4
A_local <= "00001111";
B_local <= "00010101";
Ctrl_Alu_local <= "00";

end Behavioral;
