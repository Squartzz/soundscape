#!/bin/bash
echo "Downloading Soundscape .";
sleep 2;
// Downloading Soundscape official ;
wget -O soundscape https://github.com/soundscapecloud/soundscape/raw/master/soundscape-linux-amd64;
sudo chmod +x soundscape;
echo " Choose your music folder (ex : /home/user/Music/Soundscape): "
read a;
echo "Installing Soundscape"
// Authorize soundscape to use port 80 and 443 without admin permission. ;
sudo setcap cap_net_bind_service=+ep soundscape;
mkdir $a;
echo "Choose your password : ";
read b;
echo "$b" > $a/.authsecret;
echo "What is Your Host ?";
read c;
echo "Do you want to use https (y or n)";
read d;
if [ $d = y ]
then
  echo "#!/bin/bash

./soundscape --http-host $c --http-username $USER --data-dir $a --letsencrypt
" > start.sh;
else
  echo "#!/bin/bash

  ./soundscape --http-host $c --http-username $USER --data-dir $a
  " > start.sh;
fi;
echo "Done,use ./start.sh to start soundscape";
chmod +x start.sh
