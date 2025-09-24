@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.1\\bin
call %xv_path%/xelab  -wto 1d178b7d8c1e42b09e74d3f8b4891719 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_semaforo_btn_behav xil_defaultlib.tb_semaforo_btn -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
