# Disable UAC
Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableLUA -Value 0

# choco install googlechrome -y
choco install ccleaner -y
choco install googlechrome -y
choco install 7zip.install -y
choco install skype -y
choco install teamviewer -y

# Enable UAC
Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableLUA -Value 1
