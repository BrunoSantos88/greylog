##Step 1 — Confirming Your Logrotate Version#
Logrotate is installed by default on Ubuntu. However, if you need to install it, run the following commands to update your package list and retrieve the package:

sudo apt update
sudo apt install logrotate
 
If you’re using a non-Ubuntu server, first make sure Logrotate is installed by asking for its version information:

logrotate --version

[pasta]
cat /etc/logrotate.d/apt

cat /etc/logrotate.d/cron

[memoria pasta]
du -h /var/log cron.log
