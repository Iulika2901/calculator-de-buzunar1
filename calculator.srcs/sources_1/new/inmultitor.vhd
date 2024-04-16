----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2024 10:57:58 AM
-- Design Name: 
-- Module Name: inmultitor - Behavioral
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

entity inmultitor is
       Port ( a : inout STD_LOGIC_VECTOR (7 downto 0);
        b : in STD_LOGIC_VECTOR(7 downto 0);
        s : in STD_LOGIC_VECTOR (7 downto 0);
        cin : in STD_LOGIC;
        cout : out STD_LOGIC);

end inmultitor;

architecture Behavioral of inmultitor is

component sumator is
    Port ( a : inout STD_LOGIC;
           b : in STD_LOGIC;
           cout : out STD_LOGIC;
           cin : in STD_LOGIC;
           s : out STD_LOGIC);
end component;


signal carry :std_logic_vector (7 downto 0);
signal inm: std_logic;

begin
carry(0)<=cin;
cout<=carry(7);
inm<=a;
eth1: for j in 0 to inm generate
eth: for i in 0 to 7 generate
eth: sumator port map (b(i),b(i),carry(i),s(i),carry(i+1));
end generate;
end generate;


end Behavioral;
