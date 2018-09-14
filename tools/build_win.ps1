$DIR = $PSScriptRoot|Split-Path

Set-Location -Path ${DIR}

Remove-Item ${DIR}/tmp/* -Recurse -Force

if(Test-Path ${DIR}/tmp) {
}else{
	New-Item -ItemType directory -Path ${DIR}/tmp
}
if(Test-Path ${DIR}/out) {
}else{
	New-Item -ItemType directory -Path ${DIR}/out
}

# $V = Select-String briefingName ${DIR}/glowing-octo-shame.Altis/mission.sqm | Select-Object -ExpandProperty line
# sed
$V=0

# Altis
# New-Item -ItemType SymbolicLink -Name ${DIR}/tmp/glowing-octo-shame.Altis -Target ${DIR}/glowing-octo-shame.Altis
Copy-Item ${DIR}/glowing-octo-shame.Altis -Destination ${DIR}/tmp/ -Recurse -Force

$addonbuilder = Get-ItemPropertyValue -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\bohemia interactive\addonbuilder\' -Name path
$addonbuilderexe = Get-ItemPropertyValue -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\bohemia interactive\addonbuilder\' -Name exe

& ${addonbuilder}/${addonbuilderexe} ${DIR}/tmp/glowing-octo-shame.Altis ${DIR}/out/glowing-octo-shame-${V}.Altis.pbo
