#!/usr/bin/bash
# ============================================================
# Script Name  : ztme-toolbox.sh (Zero Tolerance for Major Errors)
# Version      : 1.2.2
# Description  : Interactive Manager Collection Script for bash
# Author       : Luis Adha (luisadha.my.id)
# Created Date : 2025-Feb-05 (Wedn)
# License      : Apache 2.0 License
# GitHub       : https://github.com/luisadha/weapon-url-opener
# ============================================================

# ============================================================
# Script Name  :  wuo.sh / weapon-url-opener.sh
# Version      : 1.1g
# Description  : Switch downloader scripts easily and quickly for termux-url-opener purpose.
# Author       : Luis Adha (luisadha.my.id)
# Created Date : 2025-Feb-05 (Wedn)
# License      : MIT
# GitHub       : https://github.com/luisadha/weapon-url-opener
# ============================================================




banner='[ZTME-TOOLBOX]'
warn='[warning]'
fail='[failure]'
succ='[success]'


ME="ztme-toolbox"
PS3="Your choice: "

echo '#!/usr/bin/bash
exec ~/bin/ztme-toolbox.sh --uninstall "$@"' > ~/.local/bin/wuo-uninstall.sh
chmod +x ~/.local/bin/wuo-uninstall.sh

echo '#!/usr/bin/bash
exec ~/bin/ztme-toolbox.sh --run-wuo "$@"' > ~/.local/bin/wuo.sh
chmod +x ~/.local/bin/wuo.sh
ln -s ~/.local/bin/wuo.sh ~/.local/bin/wuo &>/dev/null;
cp -f ~/.basher/cellar/bin/weapon-url-opener.sh ~/bin/ztme-toolbox.sh

function clonePackage() {
 local args="$1"
       if timeout 10s ping -c 1 google.com &> /dev/null; then
         if [ -z ${1:-$REPO_LINK} ]; then
           echo "$warn : Broken link."
           exit 1
         fi
         REPO_FOLDER=$(basename "${1:-$REPO_LINK}" .git)
         if git clone "${1:-$REPO_LINK}.git" "$REPO_FOLDER"; then
         echo "$succ : Repo's was completly cloned, please refresh!"
       else
         echo "$fail : Unable to clone the repository, please correct the names. "
         exit 1
         fi
       else
           echo "$fail : Couldn't connected to internet!, Abort."
           exit 2
        fi
}
function findMatch() {
  find . -maxdepth 1 -type d -exec sh -c 'for d; do [ -f "$d/${d##*/}.sh" ] && basename "$d/${d##*/}.sh" .sh; done' _ {} +
}
function findMatchRecursif() {
  find . -type d -exec sh -c 'for d; do [ -f "$d/${d##*/}.sh" ] && basename "$d/${d##*/}.sh" ".sh"; done' _ {} +
}
function wuo() {
#!/data/data/com.termux/files/usr/bin/bash
# weapon-url-opener v1.0
# Created March 2024
# by: luisadha

# Algoritm: dynamic-condition-response using 'select do' and etc.

while true; do
cat << "EOF"
 _       __                                              __     
| |     / /__  ____ _____  ____  ____        __  _______/ /     ____  ____  ___  ____  ___  _____
| | /| / / _ \/ __ `/ __ \/ __ \/ __ \______/ / / / ___/ /_____/ __ \/ __ \/ _ \/ __ \/ _ \/ ___/
| |/ |/ /  __/ /_/ / /_/ / /_/ / / / /_____/ /_/ / /  / /_____/ /_/ / /_/ /  __/ / / /  __/ /
|__/|__/\___/\__,_/ .___/\____/_/ /_/      \__,_/_/  /_/      \____/ .___/\___/_/ /_/\___/_/
                 /_/                                              /_/
EOF

echo -e  " ╔════════════════════════════════════════════════╗"
echo -e  " )⇒ Project Name  :weapon-url-opener x ztme      ⇐("
echo -e  " )⇒ Author        :luisadha                      ⇐("  
echo -e  " )⇒ Github        :github.com/luisadha           ⇐("
echo -e  " )⇒ Telegram      :@adharudin14                  ⇐("  
echo -e  " ╚════════════════════════════════════════════════╝"
echo -e " Tips: Use CTRL + C or CTRL + Z to safe exit!\n"
#test -f ~/bin/termux-url-opener 
ref_hash=$(md5sum ~/bin/termux-url-opener | awk '{print $1}'); match="";
for file in ~/bin/*.sh; do
    file_hash=$(md5sum "$file" | awk '{print $1}')

    if [ "$ref_hash" = "$file_hash" ]; then
        match=true
        toggle="$(basename $file)" 
        #echo -n " IN USE: $toggle"; echo
        #cocok dengan termux-url-opener
    else
        match=false
        toggle="$(basename $file)" #idak cocok dengan termux-ur
        #echo -n " IN USE: $toggle"; echo
    fi
     [[ "$match" == "true" ]] && echo -n " IN USE: $toggle"; echo
done

echo

  file_list=($(ls -Art ~/bin/*.sh))
file_list=( $(for file in "${file_list[@]}"; do basename "$file"; done) )
  select weapon in "${file_list[@]}" "EXIT"; do
    {
        diff -sq ~/bin/"$weapon" ~/bin/termux-url-opener > .weapon-url-opener.status 2>/dev/null
    }
    [[ -n "$weapon" ]] || { break; }
 if [[ "$weapon" == "EXIT" ]]; then
      echo "Exiting the program"
      rm -f .weapon-url-opener.status
      exit 1
    else
      echo "You selected `basename $weapon` as primary weapon"
      sleep 1
      cp -f ~/bin/"$(basename $weapon)" ~/bin/termux-url-opener 
      break
    fi
  done
done
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        --add-repo)
            clonePackage "$2"
            shift 2
            ;;
        --uninstall)
            echo "Cleaning symlink."
            rm -f ~/.local/bin/wuo.sh
            rm -f ~/.local/bin/wuo
            rm -f ~/bin/ztme-toolbox.sh
            sleep 0.5
            echo -n "..All done";
            echo -e ""
            echo -e "You can make symboliclink again with \`weapon-url-opener\' or\n"
            echo -e "Procced full erases with \`basher uninstall luisadha/weapon-url-opener\'\n"
            echo -e ""
            ;;            
        --wuo|--run-wuo)
            wuo
            shift 2
            ;;
        -h|--help)
            echo "Help messages"
            exit 0
            ;;
        *)
            if [[ "$1" =~ ^https?:// ]]; then
                echo "Cloning repository from: $1"
                clonePackage "$1"
                shift
            fi
            ;;
    esac
done


files="$(findMatch)"

echo "Preparing..." && findMatch &>/dev/null
sleep 0.8
clear
printf %"$(tput cols)"s | tr " " "-"
#echo "-------------------------------------------"
echo " Zero Tolerance for Major Errors - Toolbox x wuo"
echo " version : v1.2.2"
#echo "-------------------------------------------"
printf %"$(tput cols)"s | tr " " "-"
echo -e "\nRun script as interactively from repository\nWiki bahasa : $a_href
help translate you can send to mail: <adharudin14@gmail.com>"
printf %"$(tput cols)"s | tr " " "-"

select filename in ${files} "Add repository (termux-url-opener)" "Fix issue if any" Exit;
do
[[ -n $filename ]] || { echo "$warn :What's that? Please try again." >&2; continue; }

  case ${filename} in
    "Exit")
      echo "Exiting.."
      break
      ;;
      "Fix issue if any")
      echo -e "Fixing the HISTSIZE BAD NUMBER issue..."
      sleep 0.5
      unset HISTSIZE
     # echo -e "Fixing the REQUIRED FILE NOT FOUND issue..."
     # sleep 0.5
      echo -n "...Done!"
      ;;
    "Add repository (termux-url-opener)")
      echo "$banner : Paste your repository link below :"
      read REPO_LINK
    
      clonePackage $REPO_LINK
      break
      ;;
    *)
    	echo "You selected $filename ($REPLY)"
    echo
      chmod +x ${filename}/${filename,,}.sh
      # termux-fix-shebang ${filename}/${filename,,}.sh
      ./${filename}/${filename,,}.sh
    echo
     read -t 0.1
     continue
     ;;
  esac
done

