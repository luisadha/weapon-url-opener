#dynamic-condition-response #bashproject

# Decription 
Switch downloader scripts easily and quickly. Now you can use the termux-url-opener feature more often thanks to this manager script.

# Hints
How to download downloader script?
1. Find the downloader script on github or any source that includes this for termux use.
NOTE: download at least 2 different downloader scripts before using this manager (otherwise you may not need this).
2. Download and only place the downloader script in the ~/bin directory
3. That's it! Run the script if you want to switch to a different downloader script.

# Install
### Step (1) download with basher
```sh
basher install luisadha/weapon-url-opener
```
<!--
### Step (2) copy this code
```sh
curl -L https://raw.githubusercontent.com/luisadha/weapon-url-opener/refs/heads/master/ztme-toolbox.sh -o ~/bin/ztme-toolbox.sh
```
-->
### Step (2) Running the setup for first time.
```sh
termux-url-opener
```

# Uninstall

```sh
basher uninstall luisadha/weapon-url-opener
```

# 
# For Developer 
How to get your own script to run by the ztme-toolbox 

Rules :

* Make sure your shebang is set according to the script language used so as to avoid errors, Use the built-in termux tool "termux-fix-shebang"

* The name of the repository must be identical to the name of the script itself and must have a .sh extension.

Congratulations your script to be read by ZTME-Toolbox
  
# Compability
- ztmexluis v1.2 (This project moved into ztme-toolbox)
- Termux:Widget
- (Run the script) jalankan skripnya.

# Recomendation script downloader
* AK500.sh (termux-url-opener)
* ztme-toolbox
  
  or your options
  
# Author
@luisadha

