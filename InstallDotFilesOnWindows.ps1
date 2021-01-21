$vimrc_location = ""

# First backup all dot files
$backupDir = "backup"
if((Test-Path $backupDir) -eq $False)
{
    Write-Host "Creating backup dir $backupDir ..."
    mkdir $backupDir | Out-Null
}
else
{
    $question = Read-Host -Prompt "Existing backups already made, are you sure you want to overwrite these? (y/n)"
    if($question -ne 'y')
    {
        exit
    }
}

Write-Host "Backing up Windows Terminal Settings file ..."
$termsettings = (Get-Item "$Env:LocalAppData\Packages\Microsoft.WindowsTerminal_*\LocalState\settings.json")
Copy-Item "$($termSettings.DirectoryName)\settings.json" -Destination "$backupDir\settings.json.bak"

Write-Host "Replacing Windows Terminal Settings file ..."
Copy-Item "settings.json" -Destination "$($termSettings.DirectoryName)\settings.json"

Write-Host "Backing up VIMRC file ..."
Copy-Item "$Env:UserProfile\_vimrc" -Destination "$backupDir\_vimrc.bak"

Write-Host "Replacing VIMRC file ..."
Copy-Item "vimrc" -Destination "$Env:UserProfile\_vimrc" 

Write-Host "Instaling VIM Plugins ..."
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force |`
    Out-Null

Write-Host -ForegroundColor Yellow "Make sure to run :PlugStatus and :PlugInstall in VIM to install all plugins."

