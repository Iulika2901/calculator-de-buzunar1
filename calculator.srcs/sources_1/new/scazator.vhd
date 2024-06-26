-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2024 10:27:48 AM
-- Design Name: 
-- Module Name: sumator - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
	@@ -17,45 +17,86 @@
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

entity scazator is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           bout : out STD_LOGIC;
           bin : in STD_LOGIC;
           s : out STD_LOGIC);
end scazator;

architecture Behavioral of scazator is

COMPONENT bcd_7segment
PORT(
BCDin : IN std_logic_vector(3 downto 0);
Seven_Segment : OUT std_logic_vector(6 downto 0)
);
END COMPONENT;


begin

s<= a xor b xor bin;
bout<=(not(a) and b) or (not(a) and bin) or (b and bin);


end Behavioral;
