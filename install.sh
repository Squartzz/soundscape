#!/bin/bash
echo "Downloading Soundscape .";
sleep 2;
wget -O soundscape https://github.com/soundscapecloud/soundscape/raw/master/soundscape-linux-amd64;
sudo chmod +x soundscape;
echo " Choose your music folder (ex : /home/user/Music/Soundscape): "
read a;
echo "Installing Soundscape"
sudo setcap cap_net_bind_service=+ep soundscape;
mkdir $a;
echo "Choose your password : ";
read b;
echo "$b" > $a/.authsecret;
echo "What is Your Host ?";
read c;
echo "#!/bin/bash

./soundscape --http-host $c --http-username $USER --data-dir $a
" > start.sh;
echo "Done,use ./start.sh to start soundscape";
chmod +x start.sh
