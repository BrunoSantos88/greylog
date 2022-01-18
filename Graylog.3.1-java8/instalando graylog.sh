### setup///
JAVA 1.8
UBUNTU 20.04

## instalando java//

apt install openjdk-8-jre-headless -y
java -version


## elaticsearch/// - versao 6
sudo apt -y install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/oss-6.x/apt stable main" | sudo tee  /etc/apt/sources.list.d/elastic-6.x.list

sudo apt update
sudo apt install elasticsearch-oss

#//[pasta]/// elasticserch.yml
nano /etc/elasticsearch/elasticsearch.yml
[alterar]
cluster.name: graylog
action.auto_create_index: false
##//memoria //
nano /etc/elasticsearch/jvm.options

#//[alterar] memoria elasticsearch//
-Xms512m
-Xmx512m
[commado]
sudo systemctl daemon-reload
sudo systemctl enable elasticsearch.service
sudo systemctl restart elasticsearch.service
sudo systemctl status elasticsearch.service

curl -X GET http://localhost:9200

///##instalando mongodb///

wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -

##ubuntu-20.04
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list

sudo apt-get update

sudo apt install -y mongodb-org

sudo apt-get install -y mongodb-org mongodb-org-server mongodb-org-shell mongodb-org-mongos mongodb-org-tools

[commado] #mongodb

sudo systemctl enable --now mongod
systemctl status mongod

#netstat" [coomando] -- algumas vezes trava tudo.
netstat -tunelp | grep 27017

#//[conexao mongo MongoDB]//
mongo --eval 'db.runCommand({ connectionStatus: 1 })'

##instalando graylog 3.3// elaticsearh 6.8

wget https://packages.graylog2.org/repo/packages/graylog-3.3-repository_latest.deb

dpkg -i graylog-3.3-repository_latest.deb

apt-get update -y
apt-get install graylog-server -y

#//[commados]//

sudo systemctl enable graylog-server.service

sudo systemctl start graylog-server.service

## instalando pwgen//
apt install pwgen
[commando]
pwgen -N 1 -s 96
[chave] = GjHICAeylNWLoxMG7QD1aJ4rsf63akmX9PiKSs1y3tLqUkNxy9wOaTMoOUhZ4YaydxPLs4n7XQu5bpTdfVLDB8Q9qYK57Vh5

[senha]#graylog
echo -n 1234 | sha256sum
03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4

[pasta]#graylog
nano /etc/graylog/server/server.conf

[alterar] 
##http_bind_address = 127.0.0.1:9000
#http_publish_uri = http://ipvalido:9000/

##{commado} graylog

systemctl daemon-reload
systemctl start graylog-server
systemctl enable graylog-server
systemctl status graylog-server

[verificar log ] # resultado Graylog server up and running. 
tail -f /var/log/graylog-server/server.log


https://marketplace.graylog.org/