library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
package utilitaries is

  function slv_to_str(slv     : std_logic_vector) return string;
  function addr_is_valid(addr : unsigned; max_addr : unsigned) return boolean;
  function xil_pos_edge_inv(signal clk : std_ulogic; signal clk_inv : std_ulogic) return boolean;
  function slv_to_int(slv     : std_logic_vector) return integer;
  function addr_is_valid(addr : std_logic_vector) return boolean;
  function xil_neg_edge_inv(signal clk : std_ulogic; signal clk_inv : std_ulogic) return boolean;
  -- function slv_to_hex(slv : std_logic_vector) return string;
  function slv_to_hex(slv : std_logic_vector;len : integer) return string ;
end package;
package body utilitaries is

  function slv_to_str(slv : std_logic_vector) return string is
    variable result         : string(1 to slv'length);
  begin
    for i in slv'range loop
      result(i - slv'low + 1) := std_logic'image(slv(i))(2);
    end loop;
    return result;
  end function;

  function addr_is_valid(
    addr     : unsigned;
    max_addr : unsigned
  ) return boolean is
  begin

    if addr <= max_addr then
      return true;
    else
      return false;
    end if;

  end function;
  function xil_pos_edge_inv(
    signal clk     : std_ulogic;
    signal clk_inv : std_ulogic
  ) return boolean is
  begin

    if clk_inv = '1' then
      return falling_edge(clk);
    else
      return rising_edge(clk);
    end if;

  end function;
  function slv_to_int(slv : std_logic_vector) return integer is
  begin
    return to_integer(signed(slv));
  end function;

  function addr_is_valid(addr : std_logic_vector) return boolean is
  begin
    return unsigned(addr) < 1024;
  end function;

  function xil_neg_edge_inv(
    signal clk     : std_ulogic;
    signal clk_inv : std_ulogic
  ) return boolean is
  begin
    if clk_inv = '1' then
      return rising_edge(clk);
    else
      return falling_edge(clk);
    end if;
  end function;
 function slv_to_hex(
    slv : std_logic_vector;
    len : integer
) return string is
    constant HEX : string := "0123456789ABCDEF";
    variable result : string(1 to len);
    variable v : unsigned(slv'range);
    variable value : integer;
begin

    v := unsigned(slv);

    for i in 0 to len - 1 loop
        value := to_integer(v((len-1-i)*4 + 3 downto (len-1-i)*4));

        result(i+1) := HEX(value + 1);
    end loop;

    return result;
end function;
end package body;