library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity AND2B1L is
  generic (
    IS_SRI_INVERTED : bit := '0'
  );

  port (
    O : out std_ulogic;

    DI  : in std_ulogic;
    SRI : in std_ulogic
  );
end AND2B1L;

architecture AND2B1L_V of AND2B1L is

begin

  SRI_INVERTED : if IS_SRI_INVERTED = '1' generate
    O <= SRI and DI;
  elsif IS_SRI_INVERTED = '0' generate
    O <= not SRI and DI;
  end generate;

end AND2B1L_V;
