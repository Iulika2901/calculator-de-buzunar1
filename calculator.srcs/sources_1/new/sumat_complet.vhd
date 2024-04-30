----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2024 06:34:09 PM
-- Design Name: 
-- Module Name: sumat_compl - Behavioral
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

entity sumat_compl is
    Port ( a : in STD_LOGIC_vector (7 downto 0);
           b : in STD_LOGIC_vector (7 downto 0);
           cout : out STD_LOGIC;
           cin : in STD_LOGIC;
           s : out STD_LOGIC_vector (7 downto 0));
end sumat_compl;

architecture Behavioral of sumat_compl is

component sumator is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cout : out STD_LOGIC;
           cin : in STD_LOGIC;
           s : out STD_LOGIC);
end component;

 
component bcd_7segment is
Port ( BCDin : in STD_LOGIC_VECTOR (3 downto 0);
Seven_Segment : out STD_LOGIC_VECTOR (6 downto 0));
end component;

  signal cp_i: std_logic_vector(3 downto 0);
  signal cp_o: std_logic_vector(3 downto 0);

signal carry: STD_LOGIC_vector (8 downto 0);

begin
carry(0)<=cin;
cout<=carry(7);
eth: for i in 0 to 7 generate
eth1: sumator port map (a(i),b(i),carry(i),s(i),carry(i+1));
end generate;


 cp_i(0)<=a(0);
 cp_i(1)<=a(1);
 cp_i(2)<=a(2);
 cp_i(3)<=a(3);
out1:  bcd_7segment  port map (cp_i,cp_o);

 cp_i(0)<=a(4);
cp_i(1)<=a(5);
cp_i(2)<=a(6);
cp_i(3)<=a(7);
out2:  bcd_7segment  port map (cp_i,cp_o);



end Behavioral;
