@ECHO OFF

ECHO Splunk Universal Forwarder installation script ...
ECHO This script MUST be run as administrator ...
ECHO:
ECHO:

REM Replace the below value with the FULL file path to the Splunk .msi installer
set splunk_installer=C:\Users\Admin\Documents\splunkforwarder-9.0.9-6315942c563f-x64-release.msi
REM Replace the below value with the directory name of the provided deploymentclient app
set deploymentclient_app=lab_all_deploymentclient


ECHO Installing Splunk Universal Forwarder ...
ECHO:
msiexec.exe /i %splunk_installer% AGREETOLICENSE=yes SPLUNKUSERNAME=admin SPLUNKPASSWORD=P@ssw0rd /quiet

ECHO mkdir in progress ...
ECHO:
mkdir "C:\Program Files\SplunkUniversalForwarder\etc\apps\%deploymentclient_app%"

ECHO Copying initial deploymentclient.conf configuration ...
ECHO:
xcopy /E "C:\Users\Admin\Documents\lab_all_deploymentclient" "C:\Program Files\SplunkUniversalForwarder\etc\apps\%deploymentclient_app%"

ECHO Restarting Splunk Universal Forwarder service ...
ECHO:
net stop "SplunkForwarder Service" && net start "SplunkForwarder Service"

ECHO Installation completed. Please validate connection on Deployment Server (DS) ...
timeout 10