sudo apt-get update

sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io 

docker pull gaomd/ikev2-vpn-server

docker run --privileged -d --name ikev2-vpn-server --restart=always -p 500:500/udp -p 4500:4500/udp gaomd/ikev2-vpn-server:0.3.0

docker exec -it ikev2-vpn-server cat /etc/ipsec.secrets

sudo docker run --restart=always -d gaomd/ikev2-vpn-server
