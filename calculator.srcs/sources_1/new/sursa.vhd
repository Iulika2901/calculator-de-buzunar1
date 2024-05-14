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
           --s : in STD_LOGIC_VECTOR (7 downto 0);
           --start : in STD_LOGIC;
           operatie : in STD_LOGIC_VECTOR (1 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           cin : in STD_LOGIC;
           cout : out STD_LOGIC;
           bin : in STD_LOGIC;
            rez : out STD_LOGIC_VECTOR (7 downto 0);
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

COMPONENT bcd_7segment
PORT(
BCDin : IN std_logic_vector(3 downto 0);
Seven_Segment : OUT std_logic_vector(6 downto 0)
);
END COMPONENT;

component inmultitor is
       Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
        b : in STD_LOGIC_VECTOR(7 downto 0);
        s : in STD_LOGIC_VECTOR (7 downto 0);
        cin : in STD_LOGIC;
        cout : out STD_LOGIC);
 
end component;

component impartitor is
       Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
        b : in STD_LOGIC_VECTOR(7 downto 0);
        s : in STD_LOGIC_VECTOR (7 downto 0);
        bin : in STD_LOGIC;
        bout : out STD_LOGIC);
 
end component;

component sumat_compl is
    Port ( a : in STD_LOGIC_vector (7 downto 0);
           b : in STD_LOGIC_vector (7 downto 0);
           cout : out STD_LOGIC;
           cin : in STD_LOGIC;
           s : out STD_LOGIC_vector (7 downto 0));
end component;

component scazator_complet is

 Port ( a : in STD_LOGIC_vector (7 downto 0);
         b : in STD_LOGIC_vector (7 downto 0);
         bout : out STD_LOGIC;
         bin : in STD_LOGIC;
         s : out STD_LOGIC_vector (7 downto 0));
end component;


--signal carry :std_logic_vector (7 downto 0);
--signal borrow:std_logic_vector (7 downto 0);
signal cp_i: std_logic_vector(3 downto 0);
signal cp_o: std_logic_vector(6 downto 0);
signal rez1 :  STD_LOGIC_VECTOR (7 downto 0);
signal rez2 :  STD_LOGIC_VECTOR (7 downto 0);
signal rez3 :  STD_LOGIC_VECTOR (7 downto 0);
signal rez4 :  STD_LOGIC_VECTOR (7 downto 0);

 --cin<='0';
-- bin<='0';
signal i: integer:=0;


begin


  --   process(operatie)  
-- begin

eth1: sumat_compl port map (a,b, cout,cin, rez1);
--rez<=a;


eth3: scazator_complet port map(a,b,bout,bin,rez2);
--rez<=a;


eth4: inmultitor port map(a,b,rez3,cin,cout);
--rez<=a;


eth5: impartitor port map(a,b,rez4,cin,cout);
--rez<=a;



process
begin
case rst is                 
     when '0'=>
       case operatie is
        when "00" =>
       rez<=rez1;
       --rez<=a;
       
       when "01" =>
       rez<=rez2;
       --rez<=a;
       
       when "10" =>
       rez<=rez3;
       --rez<=a;
       
       when "11" =>
         rez<=rez4;
   
   end case;
  when '1'=> 
  rez<="0000000";
   end case;
end process;



out1:  bcd_7segment  port map (cp_o,rez);

  -- end process;
  
  
end Behavioral;
