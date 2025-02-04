#!/usr/bin/bash

# Zero Tolerance for Major Errors (ZTME)-toolbox 1.2.2
# (c) copyright 2025 by @Luis Adha

banner='[ZTME-TOOLBOX]'
warn='[warning]'
fail='[failure]'
succ='[success]'

#cd $PWD/script/interactive &>/dev/null;

PS3="Your choice: "
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


while [[ $# -gt 0 ]]; do
    case "$1" in
        --add-repo)
            clonePackage "$2"
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
echo " Zero Tolerance for Major Errors - Toolbox"
echo " version : v1.2.2"
#echo "-------------------------------------------"
printf %"$(tput cols)"s | tr " " "-"
echo -e "\nRun script as interactively from repository\nWiki bahasa : <https://telegra.ph/Apa-itu-Ztmexluis-03-02>
help translate you can send to mail: <adharudin14@gmail.com>"
printf %"$(tput cols)"s | tr " " "-"

select filename in ${files} "Add repository" "Fix issue if any" Exit;
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
    "Add repository")
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

