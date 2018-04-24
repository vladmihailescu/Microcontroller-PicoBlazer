library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity ADDCY is
	generic(
		NR_BITS: INTEGER := 8
	);
	port(
		FIRST_NUMBER: in STD_LOGIC_VECTOR(NR_BITS - 1 downto 0);
		SECOND_NUMBER: in STD_LOGIC_VECTOR(NR_BITS - 1 downto 0);
		CARRY_IN: in STD_LOGIC;
		CARRY_OUT: out STD_LOGIC;	
		ZERO_FLAG: out STD_LOGIC;
		RESULT: out STD_LOGIC_VECTOR(NR_BITS - 1 downto 0)
	);
end;

architecture ADDCY_ARCHITECTURE of ADDCY is	  

signal INTERMEDIAR_RESULT: STD_LOGIC_VECTOR(NR_BITS downto 0);	  

begin
	INTERMEDIAR_RESULT <= ('0' & FIRST_NUMBER) + ('0' & SECOND_NUMBER) + ("00000000" + CARRY_IN);
	RESULT <= INTERMEDIAR_RESULT(NR_BITS - 1 downto 0);
	CARRY_OUT <= INTERMEDIAR_RESULT(NR_BITS);	
	
	process(FIRST_NUMBER, SECOND_NUMBER, CARRY_IN)
	variable INTERMEDIAR_RESULT_ZERO: STD_LOGIC_VECTOR(NR_BITS downto 0);  
	begin
		INTERMEDIAR_RESULT_ZERO := ('0' & FIRST_NUMBER) + ('0' & SECOND_NUMBER) + ("00000000" + CARRY_IN);
		if(INTERMEDIAR_RESULT_ZERO(NR_BITS - 1 downto 0) = "00000000") then
			ZERO_FLAG <= '1';
		else
			ZERO_FLAG <= '0';
		end if;
	end process;
end;