library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multiplication is
	port( X: in std_logic_vector (7 downto 0);
		Y: in std_logic_vector (7 downto 0);
		CLK,RST: in std_logic;
		rez: out std_logic_vector(7 downto 0);
		carryM: out std_logic);
end entity;

architecture multiplication_a of multiplication is
begin									
	process(RST)
	variable A, B: std_logic_vector(15 downto 0):=(others => '0');
	variable Q: std_logic_vector(7 downto 0);
	variable N: std_logic_vector(3 downto 0);
	begin
if CLK'event and CLK='1' then
		if RST = '1' then
			Q:=Y;
			B(7 downto 0) := X;
			carryM <= '0';
			A:= x"0000";
		else
			for i in 0 to 7 loop
				if Q(0) = '1' then
					A := A + B;
				end if;
				B(15 downto 1) := B(14 downto 0);
				B(0) := '0';
				Q(6 downto 0) := Q(7 downto 1);
				Q(7) := '0';
				
				if A > x"FF" then
					carryM <= '1'; 	 	   
				end if;
			end loop;
		end if;
			rez <= A(7 downto 0);
end if;
	end process;
end architecture;
