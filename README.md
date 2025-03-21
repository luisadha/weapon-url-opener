# weapon-url-opener
[![basher install](https://www.basher.it/assets/logo/basher_install.svg)](https://www.basher.it/package/)
<a href="#"><img title="repo size" src="https://img.shields.io/github/repo-size/luisadha/weapon-url-opener?style=flat-square"></a>

#dynamic-condition-response #bashproject

# Decription 
Switch downloader scripts easily and quickly. Now you can use the termux-url-opener feature more often.

# Features
* ztme-toolbox [activity] (Run scripts directly through cloned repos)
* ztme-toolbox [receiver] (As termux-url-opener script to clone repository via Android share)

# Hints (help: weapon-url-opener)
How to download downloader script?
1. Find the `termux-url-opener' script on github or any source.
NOTE: download at least 2 different downloader scripts before using this manager (otherwise you may not need this).
3. Rename each "termux-url-opener" file to its creator name
4. Place the downloader script in the ~/bin directory
5. That's it! Run the script if you want to switch to a different downloader script.

# Quick Instalations
```sh
wget luisadha.github.io/weapon-url-opener && bash weapon-url-opener
```
# Want to try without installing? You can
(1) : Copy this 
```sh
. <(curl -L luisadha.github.io/weapon-url-opener)
```
(2) : Type `wuo' to start program, when you exit the current shell session the function can no longer be called


# Manual Install

### Step (1) download with Basher or
```sh
basher install luisadha/weapon-url-opener
```
<!--
### Step (2) copy this code
```sh
curl -L https://raw.githubusercontent.com/luisadha/weapon-url-opener/refs/heads/master/ztme-toolbox.sh -o ~/bin/ztme-toolbox.sh
```
-->
### Step (2) Running the setup for first time. [bash]
```sh
weapon-url-opener
```
### Step (2) Running the setup for first time [zsh]
```
bash "$(which weapon-url-opener)" --wuo
```
### Step (3) Start a script.
```sh
wuo
```

# Uninstall

```sh
wuo-uninstall.sh
basher uninstall luisadha/weapon-url-opener
```


# For Developer (help: ztme-toolbox)
How to get your own script to run by the ztme-toolbox 

Rules :

* Make sure your shebang is set according to the script language used so as to avoid errors, Use the built-in termux tool "termux-fix-shebang"

* The name of the repository must be identical to the name of the script itself and must have a .sh extension.

Congratulations your script to be read by ZTME-Toolbox
  
# Prerequisite
- Termux:API
- Minimun two downloader script

# Recomendation script downloader
* AK500.sh (termux-url-opener) to download audio/video from YouTube via Android shared
* ztme-toolbox (termux-url-opener) to clone github repository via Android shared
  
# Author

</p>
<p align="center">
<a href="https://github.com/luisadha"><img title="Author" src="https://img.shields.io/badge/Author-luisadha-cyan.svg?style=for-the-badge&logo=github"></a>
</p>
