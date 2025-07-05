opt=(--add-repo "$@")

if command -v ztme-toolbox >/dev/null 2>&1 || command -v weapon-url-opener >/dev/null 2>&1; then
  cat > ~/bin/ztme-toolbox.sh <<EOF
#!/data/data/com.termux/files/usr/bin/bash
ztme-toolbox "${opt[@]}" 2>&1 || weapon-url-opener "${opt[@]}" 2>&1
EOF
  chmod +x ~/bin/ztme-toolbox.sh
else
  #echo "Please install salah satu dari weapon-url-opener dulu"
  wget https://luisadha.github.io/weapon-url-opener -O ~/.local/bin/weapon-url-opener
  chmod +x ~/.local/bin/weapon-url-opener
fi
