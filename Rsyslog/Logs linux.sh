###RsYSlog,  SySloGS @@@@@  SysLO-ng ...##########

[serviços]

Syslog-
RsYSlog-
Syslog-ng-

### elemento de configuração## 
-nivel--

#-elemento-- congfigação#
-Lastlog
-dmersg
-mensages 
-syslog 

# instalando rsyslog.
sudo apt update
sudo apt upgrade
sudo apt install rsyslog
[coomando]
sudo systemctl start rsyslog
sudo systemctl enable rsyslog
sudo systemctl status rsyslog
sudo systemctl restart rsyslog

[pasta]
nano /etc/rsyslog.conf

ex.
# provides UDP syslog reception
module(load="imudp")
input(type="imudp" port="514")

# provides TCP syslog reception
module(load="imtcp")
input(type="imtcp" port="514")

input#

#Enable sending system logs over UDP to rsyslog server
*.* @rsyslog-server-ip:514

#Enable sending system logs over TCP to rsyslog server
*.* @@rsyslog-server-ip:514

##Set disk queue when rsyslog server will be down:
$ActionQueueFileName queue
$ActionQueueMaxDiskSpace 1g
$ActionQueueSaveOnShutdown on
$ActionQueueType LinkedList
$ActionResumeRetryCount -1

ls -l /var/log/

[] log serviçoes
tail /var/log/syslog
