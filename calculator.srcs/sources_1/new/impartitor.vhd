library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity division is
	port( X: in std_logic_vector (6 downto 0);
		Y: in std_logic_vector (6 downto 0);
		CLK, RST: in std_logic;
		rez: out std_logic_vector(11 downto 0));
end entity;

architecture division_a of division is
	signal M: std_logic_vector(7 downto 0);	
	signal N: std_logic_vector(3 downto 0);
begin									
	
	process(RST)
		variable deimpartit, impartitor: std_logic_vector (7 downto 0);
		variable cat: std_logic_vector (7 downto 0);
		variable registru: std_logic_vector (15 downto 0); 
		variable AUX: std_logic;
	begin 		
	if CLK'event and CLK='1' then	
		if RST = '1' then
			N <= "1000";
			registru(15 downto 8) := x"00";
			registru(7 downto 0) := X;
			cat := x"00";
			deimpartit := X;
			impartitor := Y;
		else
			for i in 0 to 7 loop
				if N /= "0000" then
					
					registru(15 downto 1) := registru(14 downto 0);
					registru(0) := '0';
					
					if registru(15 downto 8) >= impartitor then 
						AUX := '1';
						registru(15 downto 8) := registru(15 downto 8) - impartitor;
					else
						AUX := '0';
					end if;
					
					cat(7 downto 1) := cat(6 downto 0);
					cat(0) := AUX;
					
					N<=N-'1';
				end if;
				rez<= cat;
			end loop;
		end if;
	end if;
	end process;
	
	
end architecture;
