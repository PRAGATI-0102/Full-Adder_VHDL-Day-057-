-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
-- full_adder.

library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(2 downto 0);
       	output_vector: out std_logic_vector(1 downto 0));
end entity;

architecture DutWrap of DUT is
   component full_adder is
     port(A: in std_logic;
		    B: in std_logic;
			 Cin: in std_logic;
		    S: out std_logic;
			 C: out std_logic);
   end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: full_adder 
			port map (
					
					A   => input_vector(2),
					B   => input_vector(1),
					Cin   => input_vector(0),

					S => output_vector(1),
					C => output_vector(0));

end DutWrap;

