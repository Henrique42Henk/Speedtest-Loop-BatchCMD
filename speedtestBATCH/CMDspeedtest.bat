@echo off
set contador=0

REM  METODO PARA ESCOLHER SERVIDOR.
speedtest -L
echo.
set /p id=Enter ID: 


REM  ......
cls
echo Iniciando Teste...

:start


REM  VERIFICA A ESCOLHA DE SERVIDOR.
IF %id%==0 (
   speedtest > Resultado.txt
   
) ELSE IF %id%==[] (
   speedtest > Resultado.txt
   
) ELSE (
    speedtest -s %id% > Resultado.txt
	
)

REM  PRINTA HORA DO TESTE.
FOR /F "tokens=1,2,3 delims=:, " %%a in ("%TIME%") do (
set H=%%a
set M=%%b
set S=%%c
)
set hora=%H%:%M% %S%

cls
echo: Hora do Speedtest: %hora%
echo.

REM  PRINTA RESULTADOS ESPECIFICOS DO TESTE.
set "xprvar="
for /F "skip=3 delims=" %%i in (Resultado.txt) do if not defined xprvar set "xprvar=%%i"
set "xprvar1="
for /F "skip=4 delims=" %%i in (Resultado.txt) do if not defined xprvar1 set "xprvar1=%%i"
set "xprvar2="
for /F "skip=5 delims=" %%i in (Resultado.txt) do if not defined xprvar2 set "xprvar2=%%i"
set "xprvar3="
for /F "skip=6 delims=" %%i in (Resultado.txt) do if not defined xprvar3 set "xprvar3=%%i"
set "xprvar4="
for /F "skip=7 delims=" %%i in (Resultado.txt) do if not defined xprvar4 set "xprvar4=%%i"

echo  %xprvar%
echo  %xprvar1%
echo  %xprvar2%
echo  %xprvar3%
echo  %xprvar4%
echo.

REM  CONTADOR DE TESTES.
set /a contador=%contador%+1
echo:    Contador: %contador%

goto start