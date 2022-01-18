##//instalando graylog 4.1//
##//Setup Prerequisites//##
## UBUNT 20.04//

4 CPU Cores
8 GB RAM
SSD Hard Disk Space with High IOPS for Elasticsearch Log Storage
Ubuntu 20.04 LTS installed and updated.
All packages upgraded

##//instalando dependencia// --> java 11 

sudo apt update
sudo apt install -y apt-transport-https openjdk-11-jre-headless uuid-runtime pwgen curl dirmngr

java -version

##//Step 2 – Install Elasticsearch on Ubuntu 20.04// version 7

wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

echo "deb https://artifacts.elastic.co/packages/oss-7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list

sudo apt update
sudo apt install -y elasticsearch-oss

arquivo elasticsearch.yml
nano /etc/elasticsearch/elasticsearch.yml

#[alterar]
cluster.name: graylog
action.auto_create_index: false

#[coomados elasticsearch]

sudo systemctl daemon-reload
sudo systemctl start elasticsearch
sudo systemctl enable elasticsearch
systemctl status elasticsearch

curl -X GET http://localhost:9200

##//install MongoDB on Ubuntu 20.04//

sudo apt update
sudo apt install -y mongodb-server
systemctl status mongodb

##//Install Graylog Server on Ubuntu 20.04// --version 4.1 graylog

wget https://packages.graylog2.org/repo/packages/graylog-4.1-repository_latest.deb
sudo dpkg -i graylog-4.1-repository_latest.deb

sudo apt update
sudo apt install -y graylog-server

[arquivo] pasta graylog
nano /etc/graylog/server/server.conf

#[alterar]
password_secret= "senha pwgen"
root_password_sha2 = "senhagraylog"
http_bind_address = 0.0.0.0:9000

[instalar pwgen]

#[commado] pwgen
pwgen -N 1 -s 96
senha:

#[coomado]
echo -n 1234 | sha256sum
senha: "senha gralog"

#[coomados graylog]
sudo systemctl daemon-reload
sudo systemctl restart graylog-server
sudo systemctl enable graylog-server
sudo systemctl restart graylog-server
[commado log ]
sudo tail -f /var/log/graylog-server/server.log
[saida] - Graylog server up and running.
