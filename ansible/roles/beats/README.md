 ### Пример запуска на серверах которые находятся в локальной сети с fluentd

```
ansible-playbook  -i ../ansible/inventory/inventory.gcp.yaml ../ansible/main.yaml  --extra-vars ansible_ssh_private_key_file=~/.ssh/id_rsa_nout --extra-vars ansible_user=USERNAME -l linux -t beats
```

 ### Пример запуска на серверах которые находятся за внешней сетью с fluentd, указать внешний адрес хоста и порт, через OUTPUTS_LOGSTASH

```
ansible-playbook  -i ../ansible/inventory/inventory-plumo.yaml ../ansible/main.yaml  --extra-vars ansible_ssh_private_key_file=~/.ssh/id_rsa_nout --extra-vars ansible_user=USERNAME --extra-vars OUTPUTS_LOGSTASH=fluentd.plumotech.com:5046 -l linux -t beats
```

Без сертификата логи с клиента приниматься не будут, так что если запускать отдельную установку то  нужно обязательно запускаться с тегом beats_ssl, чтобы сертификат создался

```
-l linux -t beats_ssl,filebeat
```

 ### теги для отдельного запуска

```
beats_ssl           -   запуск playbook создание сертификата, клиента, сервера или root-ca
filebeat            -   установка, переноск конфига и запуск filebeat
auditbeat           -   установка, переноск конфига и запуск auditbeat
winlogbeat          -   установка, переноск конфига и запуск winlogbeat
```

 ## Для WINDOWS серверов, необходимо чтобы у вас была учетка там и в консоли экспортировать логи(USERNAME) и пароль(PASS)

```
export WIN_USER=USERNAME && export WIN_PASS=PASS
```

 # В случае если CA.crt или server.crt изменится придется перезалить его на все другие хосты, применив данную роль на все сервера