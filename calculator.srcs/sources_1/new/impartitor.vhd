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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
 
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
 
entity impartitor is
       Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
        b : in STD_LOGIC_VECTOR(7 downto 0);
        s : out STD_LOGIC_VECTOR (7 downto 0);
        bin : in STD_LOGIC;
        bout : out STD_LOGIC);
 
end impartitor;
 
architecture Behavioral of impartitor is
 
 component scazator_complet is

 Port ( a : in STD_LOGIC_vector (7 downto 0);
         b : in STD_LOGIC_vector (7 downto 0);
         bout : out STD_LOGIC;
         bin : in STD_LOGIC;
         s : out STD_LOGIC_vector (7 downto 0));
end component;

 
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
 
  signal borrow : std_logic_vector(7 downto 0);
  signal cp_i: std_logic_vector(3 downto 0);
  signal cp_o: std_logic_vector(6 downto 0);
 
begin
  borrow(0) <= bin;
  bout <=  borrow(8);
 
  process (a)
    variable inm: integer := 0;  
    begin
    
  --  for i in 7 downto 0 loop
  --    inm:=to_integer(signed(a));
  --  end loop;
  end process;
  
scazator_inst:for j in 0 to 7 generate
scazator_inst: scazator port map (a => a(j), 
                                  b => b(j), 
                                  bout => borrow(j+1), 
                                  bin =>borrow(j), 
                                  s => s(j));
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
