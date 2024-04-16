----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2024 10:22:46 AM
-- Design Name: 
-- Module Name: calculator - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity calculator is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR(7 downto 0);
           s : in STD_LOGIC_VECTOR (7 downto 0);
           start : in STD_LOGIC;
           operatie : in STD_LOGIC_VECTOR (1 downto 0);
           clk : in STD_LOGIC;
           rst : out STD_LOGIC;
           cin : in STD_LOGIC;
           cout : out STD_LOGIC;
           bin : in STD_LOGIC;
           bout : out STD_LOGIC);
end calculator;

architecture Behavioral of calculator is

component sumator is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cout : out STD_LOGIC;
           cin : in STD_LOGIC;
           s : out STD_LOGIC);
end component;

component scazator is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           bout : out STD_LOGIC;
           bin : in STD_LOGIC;
           s : out STD_LOGIC);
end component;


signal carry :std_logic_vector (7 downto 0);
signal borrow:std_logic_vector (7 downto 0);

begin
carry(0)<=cin;
cout<=carry(7);
eth: for i in 0 to 7 generate
eth: sumator port map (a(i),b(i),carry(i),s(i),carry(i+1));
end generate;

borrow(0)<=bin;
bout<=borrow(7);
eth2: for i in 0 to 7 generate
eth2: scazator port map(a(i),b(i),borrow(i),s(i),borrow(i+1));
end generate;

end Behavioral;
