choco install vim --y
choco install microsoft-windows-terminal --y
Install-PackageProvider -Name NuGet -Force
Install-Module -Name Terminal-Icons -Repository PSGallery -Force 
Add-Content -Path $profile -value "Import-Module -Name Terminal-Icons"
Install-Module -Name PSReadLine -Scope CurrentUser -Force -SkipPublisherCheck
choco install poshgit --y
choco install oh-my-posh --y
Add-Content -Path $profile -value "Set-PoshPrompt -Theme marcduiker"
choco install font-nerd-dejavusansmono
Write-Host "Now open Windows terminal settings and add "fontface": "DejaVuSansMono NF" under "profiles"
