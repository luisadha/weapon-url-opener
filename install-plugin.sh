opt='--add-repo "$@"'

if [ $(which ztme-toolbox) || $(which weapon-url-opener) ]; then
  echo '#!/data/data/com.termux/files/usr/bin/bash
ztme-toolbox $opt 2>&1 || weapon-url-opener $opt 2>&1' > ~/bin/ztme-toolbox.sh
else 
  echo "Please install salah satu dari weapon-url-opener dulu"
fi
  
