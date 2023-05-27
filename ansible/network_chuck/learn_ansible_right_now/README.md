# you need to learn Ansible RIGHT NOW!! (Linux Automation)

## Coding

### Steps

1. Find in Stack Scripts networkchuck/ansible

```bash
#!/bin/bash
yum update -y
yum install epel-release -y
yum install ansible -y
```

2. Deploy a new Linode (virtual machine) with that script. Confiugre
    2. Region
    2. Linode Plan (choose one from 1 or 2 GB or fam in Shared CPU)
    2. Set a label
    2. Set a password

3.  After create your VM  login with ssh
```bash
ssh root@$linode_ansible_ip
```

4. Test the ansible installation
```bash
ls
cd /etc/ansible
ls -la

# this is your inventory file
vim hosts
```

5. In this file , at end , add the group [linux], then put the public ips of the other virtual machines and the credentials

```bash
[linux]
<PUT_THE_PUBLIC_IP_01>
<PUT_THE_PUBLIC_IP_02>
<PUT_THE_PUBLIC_IP_03>

[linux:vars]
ansible_user=<USER_NAME>
ansible_password=<PASSWORD>
```

6. Edith the ansible.cfg file un comment the host_key_checking
```bash
host_key_checking = False
```

7. Execute the ping command with ansible
```bash
# ansible <GROUP_NAME> -m <COMMAND>
ansible linux -m ping

#
ansible linux -a "cat /etc/os-release"

# 
ansible linux -a "rebot"

#
ansible linux -m ping

```

8. Create your first playbook
```yaml
---
  - name: iluvnano
    hosts: linux
    tasks:
      - name: ensure nano is there
        yum:
          name: nano
          state: latest
```

9. Execute the playbook
```bash
ansible-playbook iluvnano.yml
```

10.  Change teh state from latest to absent
```yaml
---
  - name: iluvnano
    hosts: linux
    tasks:
      - name: ensure nano is there
        yum:
          name: nano
          state: absent
```

11. Run again your playbook
```bash
ansible-playbook iluvnano.yml
```


## References

- [you need to learn Ansible RIGHT NOW!! (Linux Automation)](https://www.youtube.com/watch?v=5hycyr-8EKs)
- [Ansible Documentation](https://docs.ansible.com/ansible/latest/index.html)
- [Installing Ansible on Ubuntu](https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-ubuntu)

- [Ansible](https://www.ansible.com/)
- [How Ansible works](https://www.ansible.com/overview/how-ansible-works)