# NVC & GHDL_Xilinx_libraries

<u>**NOTE:**</u> These libraries are only necessaries to analyze once. Could be comment or remove it in the simulations.

## UNISIM

It is necessary to analyze the libraries previous to analyze the project.

_(Follow this order to analyze the UNISIM library)_
``` bash
ghdl -a --std=08 -fsynopsys --work=unisim unisim/vcomponents/*.vhd
ghdl -a --std=08 -fsynopsys --work=unisim unisim/primitives/*.vhd
ghdl -a --std=08 -fsynopsys --work=unisim unisim/retarget/*.vhd
```

It is important that if you analyze the library UNISIM as VHDL 2008, to analyze your
files as VHDL 2008.

### Example

``` bash
ghdl -a --std=08 -fsynopsys --work=unisim unisim/vcomponents/*.vhd
ghdl -a --std=08 -fsynopsys --work=unisim unisim/primitives/*.vhd
ghdl -a --std=08 -fsynopsys --work=unisim unisim/retarget/*.vhd

# Analyze the files
ghdl -a --std=08 rtl/top.vhd
ghdl -a --std=08 tb/tb_top.vhd
# Elaboration
ghdl -e --std=08 tb_top
# Simulation
ghdl -r --std=08 tb_top --stop-time=100ms --wave=test.ghw
```

Recomendation, to simulate with GHDL, use the GHW format because it is more faster.

## XPM

For the XPM library use this command.

``` bash
ghdl -a --std=08 -fsynopsys --work=xpm xpm/*.vhd
```

XPM repo: https://github.com/fransschreuder/xpm_vhdl


# NVC 
To use in NVC use these commands.

_(This simulator is more faster than GHDL)_

_Linux_
``` shell
nvc --work=unisim -M 32m -a unisim/vcomponents/*.vhd
nvc --work=unisim -M 32m -a unisim/primitives/*.vhd
nvc --work=unisim -M 32m -a unisim/retarget/*.vhd
```

_Windows PowerShell_
``` Powershell
nvc --work=unisim -M 32m -a (Get-ChildItem .\unisim\vcomponents\*.vhd).FullName
nvc --work=unisim -M 32m -a (Get-ChildItem .\unisim\primitives\*.vhd).FullName
nvc --work=unisim -M 32m -a (Get-ChildItem .\unisim\retarget\*.vhd).FullName
```

_Windows CMD_
``` cmd
for %%f in (unisim\vcomponents\*.vhd) do nvc --work=unisim -M 32m -a "%%f"
for %%f in (unisim\primitives\*.vhd) do nvc --work=unisim -M 32m -a "%%f"
for %%f in (unisim\retarget\*.vhd) do nvc --work=unisim -M 32m -a "%%f"
```


NOTE: Remember if you use NVC to add the flag ```-L . ``` in all the execution.

### Example
``` bash
# execute one per simulation (remove in the next simulations)
nvc --work=unisim -M 32m -a unisim/vcomponents/*.vhd
nvc --work=unisim -M 32m -a unisim/primitives/*.vhd
nvc --work=unisim -M 32m -a unisim/retarget/*.vhd

# Analyze the files
nvc -L . -a rtl/top.vhd
nvc -L . -a tb/tb_top.vhd
# Elaboration
nvc -L . -e tb_top
# Simulation
nvc -L . -r tb_top --wave=test.vcd
```
Recomendation, to simulate with NVC, use the VCD format because it is more faster.
