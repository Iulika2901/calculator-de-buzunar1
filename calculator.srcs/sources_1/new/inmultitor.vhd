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
 
entity inmultitor is
       Port ( a : in STD_LOGIC_VECTOR (6 downto 0);
        b : in STD_LOGIC_VECTOR(6 downto 0);
        s : out STD_LOGIC_VECTOR (11 downto 0); -- de tipul 'out' nu 'in'
        cin : in STD_LOGIC;
        cout : out STD_LOGIC);
 
end inmultitor;
 
architecture Behavioral of inmultitor is
 
component bcd_7segment is
Port ( BCDin : in STD_LOGIC_VECTOR (3 downto 0);
Seven_Segment : out STD_LOGIC_VECTOR (6 downto 0));
end component;
 
  component sumator is
    Port (
      a    : in STD_LOGIC;
      b    : in STD_LOGIC;
      cout : out STD_LOGIC;
      cin  : in STD_LOGIC;
      s    : out STD_LOGIC
    );
  end component;
 
  signal carry : std_logic_vector(8 downto 0);
  signal cp_i: std_logic_vector(3 downto 0);
  signal cp_o: std_logic_vector(6 downto 0);
 
begin
  carry(0) <= cin; -- ca sa putem automatiza pe generate imi trebuie semnalul de carry pe 9 biti si carry(0) trebuie sa ia valoarea cin
  cout <= carry(8); -- la fel cout trebuie sa primeasca valoarea de carry (8) ultimul din generator
 
process (a)
  variable inm: integer := 0;  
  begin
  
--  for i in 7 downto 0 loop
--    inm:=to_integer(signed(a));
--  end loop;
end process;

sumator_inst:for j in 0 to 6 generate
sumator_inst: sumator port map (a => a(j), 
                                b => b(j), 
                                cout => carry(j+1), 
                                cin => carry(j), 
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
cp_i(3)<='0';
out2:  bcd_7segment  port map (cp_i,cp_o);


 
end Behavioral;
