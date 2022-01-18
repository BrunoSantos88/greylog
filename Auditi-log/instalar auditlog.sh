##### instalando auditlog@@@@@@

apt-get install auditd -y

#[commados]#
auditctl --help
auditctl -D --excluir regras
auditctl -l  ---vizualiar regras

[criando regras] -w
auditctl -w /etc/passwd -p rwxa

[excluir regras]  -W remover
sudo auditctl -W /etc/passwd

[exemplos]
sudo auditctl -a exit,always -F arch=b64 -S clock_settime -F key=mudarhora


[log]
sudo grep -i passwd /var/log/audit/audit.log

[regras]
cat /etc/audit/rules.d/audit.rules

[adicinar regras]
auditctl -l >> /etc/audit/rules.d/audit.rules

#[ausearch]

