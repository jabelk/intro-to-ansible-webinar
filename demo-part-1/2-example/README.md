

pip install -r requirements.txt
ansible-galaxy collection install -r requirements.yaml


ssh 'developer@10.10.20.50'

device info
```
[all:vars]
ansible_user=cisco
ansible_ssh_pass=cisco
ansible_connection=network_cli

[ios_devices]
ios-1 ansible_network_os=ios ansible_host=172.16.30.72
ios-2 ansible_network_os=ios ansible_host=172.16.30.73
```