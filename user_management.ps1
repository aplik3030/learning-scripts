function Users {
    Get-LocalUser | Select-Object Name, Enabled
}

function NewUser {
    $username = Read-Host "Enter the new username"
    $password = Read-Host "Enter the password for the new user" -AsSecureString
    $adminOption = Read-Host "Should the user be an administrator? (y/n)"
    
    New-LocalUser -Name $username -Password $password -FullName $username -Description "Created via script"
    
    if ($adminOption -eq 'y') {
        Add-LocalGroupMember -Group "Administrators" -Member $username
        Write-Host "User $username created with administrator privileges."
    } else {
        Write-Host "User $username created without administrator privileges."
    }
}

function Menu {
    Write-Host "1: List all users"
    Write-Host "2: Create a new user"
    Write-Host "3: Remove a user"
    Write-Host "4: Exit"
}

Menu

$choice = Read-Host "Select an option"

switch ($choice) {
    "1" { Users }
    "2" { NewUser }
    default { Write-Host "Invalid choice or functionality not yet implemented." }
}
