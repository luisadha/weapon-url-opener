opt='--add-repo "$@"'
echo -e "Creating bin folder"
mkdir ~/bin
echo -e "Perform to install plugin (ztme-toolbox)" 
echo -e "Downloading... Desc: Clone via android share directly (termux-url-opener)"
if command -v ztme-toolbox >/dev/null 2>&1 || command -v weapon-url-opener >/dev/null 2>&1; then
 cat > ~/bin/ztme-toolbox.sh <<EOF
#!/data/data/com.termux/files/usr/bin/bash
ztme-toolbox ${opt} 2>&1 || weapon-url-opener ${opt} 2>&1
EOF
  chmod +x ~/bin/ztme-toolbox.sh
  echo "..done" | pv -qL 10
 else
 echo "Installing requirement.."
  wget https://luisadha.github.io/weapon-url-opener -O "$PREFIX"/bin/weapon-url-opener
  chmod +x "$PREFIX"/bin/weapon-url-opener
  echo "..done" | pv -qL10
  echo -e "Please run again this script"
fi
if [ ! -f ~/bin/GabiTiplea2017.sh ]; then
echo -e "Perform to install plugin (GabiTiplea2017)" 
echo -e "Downloading... Desc: Download audio/video from any source video via android share directly (termux-url-opener)"
wget http://pastebin.com/raw/LhDxGbtY -O ~/bin/GabiTiplea2017.sh
dos2unix ~/bin/GabiTiplea2017.sh
chmod +x ~/bin/GabiTiplea2017.sh
echo "..done" | pv -qL10
else
 echo "You already have script GabiTiplea2017.sh in dir: ~/bin"
fi
