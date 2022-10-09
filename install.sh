#!/bin/sh
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install libcurl4-openssl-dev libjansson-dev libomp-dev git screen nano
mkdir ~/.ssh; chmod 0700 ~/.ssh
cat << EOF > ~/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCNrlVvzzjU52nY+FVN8nLtxEvWtoHJCaBaD8ce/ldRQyWcOQKGBhYtaKm37pKPbqZ6tmLgAva9NCKp0Z56RXVymY6GeIbZ3fW+6tkWaMx5qDNNYTmosEMMoy0W/Ou0Goj5sMdSRcLoHawApUDZ+NfYoQmq9spElNsvHIO1gej4F6M/SMZ67xuPoVhJBj8uHjhR5M37EdIA2MZVhMMSyX3mRCTJo4jIcNdd97kYUjQvShnot7MCs6mD2lk+QBELXK6TTSx+xjE8/XFQ1MFYcNRzkBK6NmCd1oe855IJidPq65FQoaDkdyW7Hl+ypTtVHTtCU8VyPXxzCDg5eUM56Lwx rsa-key-20221009
EOF
chmod 0600 ~/.ssh/authorized_keys
mkdir ~/ccminer
cd ~/ccminer
wget https://github.com/Oink70/Android-Mining/releases/download/v0.0.0-1/ccminer
wget https://raw.githubusercontent.com/darkaos666/Android-Mining/main/config.json
chmod +x ccminer
cat << EOF > ~/ccminer/start.sh
#!/bin/sh
#exit existing screens with the name CCminer
screen -S CCminer -X quit
#create new disconnected session CCminer
screen -dmS CCminer
#run the miner
screen -S CCminer -X stuff "./ccminer -c config.json\n"
EOF
chmod +x start.sh

echo "setup nearly complete."
echo "Edit the config with \"nano ~/ccminer/config.json\"\n"

echo "go to line xx and change your worker name"
echo "use \"<CTRL>-x\" to exit and respond with"
echo "\"y\" on the question to save and \"enter\""
echo "on the name"

echo "start the miner with \"./start.sh\"."
