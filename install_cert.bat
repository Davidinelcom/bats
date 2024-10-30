@echo off
cls

:MENU
echo MENU OPCIONES:
echo 1. Entrar Shadow
echo 2. Eixir Shadow
echo 3. instala Cert
echo 4. Salir
set /p OPTION=Selecciona una opcion:

if "%OPTION%"=="1" goto SHADOW_ON
if "%OPTION%"=="2" goto SHADOW_OFF
if "%OPTION%"=="3" goto CERT
if "%OPTION%"=="3" goto EXIT
if "%OPTION%"=="4" exit

:SHADOW_ON
cd /d "C:\Program Files\Shadow Defender"
   	CmdTool.exe /pwd:1nelcom.4dmin /enter:C /now
goto MENU

:SHADOW_OFF
cd /d "C:\Program Files\Shadow Defender"
   CmdTool.exe /pwd:1nelcom.4dmin /exit:C /reboot
goto MENU

:CERT
:: Obtiene la ruta donde está ubicado el script
set "scriptPath=\\172.20.11.1\aplicaciones-vb\david\certificados\"

echo Instalando certificados...
:: Instalar CA TESA.cer en el almacén "Personal"
certutil -addstore "My" "%scriptPath%CA TESA.cer"

:: Instalar PKI Root TG Telefonica.cer en el almacén "Raíz de confianza"
certutil -addstore "Root" "%scriptPath%PKI Root TG Telefonica.cer"

:: Instalar PKI TGTTI TG Telefonica REFIRMADO.crt en el almacén "Entidades de Certificación Intermedias"
certutil -addstore "CA" "%scriptPath%PKI TGTTI TG Telefonica REFIRMADO.crt"

:: Instalar PKI SubCA TI TELEFONICA ESP.cer en el almacén "Entidades de Certificación Intermedias"
certutil -addstore "CA" "%scriptPath%PKI SubCA TI TELEFONICA ESP.cer"

echo Certificados instalados correctamente.
pause
