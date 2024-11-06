Add-Type -AssemblyName System.Windows.Forms

$session = bw unlock | Select-String '[A-Za-z0-9+/]+==' | Select -Expand matches | Select -First 1 -Expand value

if ($session -eq $null) {
  Sleep 1
  Exit
}

$items = bw list items --session $session | ConvertFrom-Json
$name = $items | Select -expand name | .\wlines.exe
$item = $items.where({ $_.name -eq $name })[0]

$field = @('Username', 'Password', 'Both') | .\wlines.exe

[System.Windows.Forms.SendKeys]::SendWait('%{TAB}')

if ($field -in @('Username', 'Both')) {
    Sleep 1
    $item.login.username.ToCharArray() | foreach {
        if ($_ -eq ' ') {
            [System.Windows.Forms.SendKeys]::SendWait(" ")
        } else {
            [System.Windows.Forms.SendKeys]::SendWait("{$($_)}")
        }
    }
}

if ($field -eq 'Both') {
    Sleep 1
    [System.Windows.Forms.SendKeys]::SendWait('{TAB}')
}

if ($field -in @('Password', 'Both')) {
    Sleep 1
    $item.login.password.ToCharArray() | foreach { [System.Windows.Forms.SendKeys]::SendWait("{$($_)}") }
}
