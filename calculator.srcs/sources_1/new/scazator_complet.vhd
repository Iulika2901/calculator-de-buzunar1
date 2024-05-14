----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2024 06:34:31 PM
-- Design Name: 
-- Module Name: scazator_complet - Behavioral
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

entity scazator_complet is

 Port ( a : in STD_LOGIC_vector (6 downto 0);
         b : in STD_LOGIC_vector (6 downto 0);
         bout : out STD_LOGIC;
         bin : in STD_LOGIC;
         s : out STD_LOGIC_vector (11 downto 0));
end scazator_complet;

architecture Behavioral of scazator_complet is

component scazator is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           bout : out STD_LOGIC;
           bin : in STD_LOGIC;
           s : out STD_LOGIC);
end component;

component bcd_7segment is
Port ( BCDin : in STD_LOGIC_VECTOR (3 downto 0);
      Seven_Segment : out STD_LOGIC_VECTOR (6 downto 0));
end component;

  signal cp_i: std_logic_vector(3 downto 0);
  signal cp_o: std_logic_vector(6 downto 0);
signal borrow: STD_LOGIC_vector (8 downto 0);

begin

borrow(0)<=bin;
bout<= borrow(7);
eth: for i in 0 to 6 generate
scazator_inst: scazator port map (a => a(i), 
                                b => b(i), 
                                bout => borrow(i+1), 
                                bin => borrow(i), 
                                s => s(i));
end generate;


 cp_i(0)<=a(0);
 cp_i(1)<=a(1);
 cp_i(2)<=a(2);
 cp_i(3)<=a(3);
out1:  bcd_7segment  port map (cp_i,cp_o);

 cp_i(0)<=a(4);
cp_i(1)<=a(5);
cp_i(2)<=a(6);
cp_i(3)<='0';
out2:  bcd_7segment  port map (cp_i,cp_o);


end Behavioral;
