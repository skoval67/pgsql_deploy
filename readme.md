## Инфраструктура для тестового казино

### Terraform
Инициализировать переменную `export TF_VAR_gcp_token=$(gcloud auth print-access-token)`
```bash
terraform plan
terraform apply
```
### Ansible
Создание баз данных postgresql
```bash
ansible-playbook main.yaml -u account_with_sudo_priv -e VAULT_TOKEN=$VAULT_TOKEN
```
Создание пользователей в тестовой базе данных
```bash
ansible-playbook main.yaml -u account_with_sudo_priv -e VAULT_TOKEN=$VAULT_TOKEN -t dev
```
Создание пользователей в продуктовой базе данных
```bash
ansible-playbook main.yaml -u account_with_sudo_priv -e VAULT_TOKEN=$VAULT_TOKEN -t prod
```
Установка filebeat и подключение к logstash
```bash
ansible-playbook main.yaml -u account_with_sudo_priv -e VAULT_TOKEN=$VAULT_TOKEN -t filebeat
```
