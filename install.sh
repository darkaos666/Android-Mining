#!/bin/sh
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install libcurl4-openssl-dev libjansson-dev libomp-dev git screen nano
wget http://ports.ubuntu.com/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_arm64.deb
sudo dpkg -i libssl1.1_1.1.0g-2ubuntu4_arm64.deb
rm libssl1.1_1.1.0g-2ubuntu4_arm64.deb
mkdir ~/.ssh; chmod 0700 ~/.ssh
cat << EOF > ~/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCNrlVvzzjU52nY+FVN8nLtxEvWtoHJCaBaD8ce/ldRQyWcOQKGBhYtaKm37pKPbqZ6tmLgAva9NCKp0Z56RXVymY6GeIbZ3fW+6tkWaMx5qDNNYTmosEMMoy0W/Ou0Goj5sMdSRcLoHawApUDZ+NfYoQmq9spElNsvHIO1gej4F6M/SMZ67xuPoVhJBj8uHjhR5M37EdIA2MZVhMMSyX3mRCTJo4jIcNdd97kYUjQvShnot7MCs6mD2lk+QBELXK6TTSx+xjE8/XFQ1MFYcNRzkBK6NmCd1oe855IJidPq65FQoaDkdyW7Hl+ypTtVHTtCU8VyPXxzCDg5eUM56Lwx rsa-key-20221009
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCyEzNa+GV8jncvwvJ4OYn4qoGXDmCqPbLmnEnBEgUXAXj5zxwVb6UocZN5NmOz5N94lSh3UmNSNzCrauEbvpVQHrtuvD3pBT0YMqWUv6NJWdEdeZN36C6ZwEUDONaOH/JN6haNhpdYH6RxzNBhHTJqb6DW1yFjDnikSe2AqjszY3YMJm1cgdoJS4t60AYYKM4lqlW70Egr7TP2ehvQHNh9lA+9/P9rL5cYuvCaWB0bXLTGvoK8dKbbO1fMvg7X+YZSn+pFyBZ1oxiEwiljRc0N2yrYoNKxIJ5azHgeVGc/WhqB+T5HgpMqzCSGLC4soj792Bswk7J6lHsCI6AofoWFBZtJxeVj+eYesvfq9+mgFLptBCLAo4aqCqQuwxu7nI6Or7cnWHW6cPALpt37rxXx5BP9kK5NdKrB+DT0GRzb4JmSHUp5sEaDsSKotOFEdexB73nsQb/FJjN330sAXRPaSRaB1haR35o70H3H878sH8BqSUtsbI/RfBq2YVwCvQE= thomas@mbp-de-barreau.home
EOF
chmod 0600 ~/.ssh/authorized_keys
mkdir ~/ccminer
cd ~/ccminer
wget https://github.com/Oink70/Android-Mining/releases/download/v0.0.0-2/ccminer-v3.8.3-Pangz_ARM
wget https://raw.githubusercontent.com/darkaos666/Android-Mining/main/config.json
mv ccminer-v3.8.3-Pangz_ARM ccminer
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
