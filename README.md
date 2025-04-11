# bwmenu
A keyboard-driven script for Windows that displays logins from your BitWarden vault in a dmenu-like interface and inputs them into any application.

## Setup
* Download the [bitwarden cli](https://bitwarden.com/help/cli/#download-and-install) and put the executable in the root directory.
* Download or build [wlines](https://github.com/JerwuQu/wlines), and put the executable in the root directory.
* Create a desktop shortcut using the target (modifying paths as necessary): 
  ```
  C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -file "C:\Path\To\bwmenu\bwmenu.ps1"
  ```
* Add a shortcut key to the shortcut, e.g. `CTRL + ALT + B`.
* Run `./bw.exe login` to login using email and master password.

## Usage
1. Place the text cursor where you want to input the username or password.
2. Press your shortcut key combination.
3. Input your master password.
4. Choose your login by using arrow keys or text search and hit enter.
6. Choose username, password or both. Choosing both will seperate them by the tab key.

## TODO / Known limitations
* You need to login using email and master password on every boot, before using the script for the first time. This flow could be incorporated into the script some day.
* Changes to any login in your vault is not reflected until you logout and login again. This is a bug/limitation of the BitWarden cli.
* No support for international keyboard layouts - english characters in username and passwords only. The terminal has even more issues with receiving certain special characters from this script. Something other than `System.Windows.Forms.SendKeys` would have to be used to solve this. 
