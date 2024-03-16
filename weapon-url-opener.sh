#!/data/data/com.termux/files/usr/bin/bash
# weapon-url-opener v1.0
# Created March 2024
# by: luisadha

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
echo -e  " )⇒ Project Name  :weapon-url-opener             ⇐("
echo -e  " )⇒ Author        :luisadha                      ⇐("       
echo -e  " )⇒ Github        :github.com/luisadha           ⇐("
echo -e  " )⇒ Telegram      :@adharudin14                  ⇐("        
echo -e  " ╚════════════════════════════════════════════════╝"
echo -e " Tips: Use CTRL + C to safe exit!\n"
test -f ~/bin/termux-url-opener
if [ $? -eq 1 ]; then
  tidakada="(service not used)"
  echo -n " IN USE: $tidakada"; echo
else
  echo -n " IN USE: "; basename "$(cat .weapon-url-opener.status 2>/dev/null | awk '{print $2}')"; echo
fi
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
      break 2
    else
      echo "You selected `basename $weapon` as primary weapon"
      sleep 1
      cp -f ~/bin/"$(basename $weapon)" ~/bin/termux-url-opener   
      break
    fi
  done
done


