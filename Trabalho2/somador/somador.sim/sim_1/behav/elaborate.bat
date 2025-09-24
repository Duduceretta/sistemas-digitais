@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.1\\bin
call %xv_path%/xelab  -wto 04fadd941e104b99b93c6162f1b6f6d0 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_somador_behav xil_defaultlib.tb_somador -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
