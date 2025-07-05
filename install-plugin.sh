opt='--add-repo "$@"'

if command -v ztme-toolbox >/dev/null 2>&1 || command -v weapon-url-opener >/dev/null 2>&1; then
 echo -e "Performing to install.. plugin (ztme-toolbox)" 
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
