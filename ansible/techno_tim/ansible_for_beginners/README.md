# Automate EVERYTHING with Ansible! (Ansible for Beginners)


## Coding


### setup on Ubuntu on WSL
```bash
sudo apt-get -y upgate
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible

ansible --version
```

### first steps
```bash
# install sshpass
sudo apt install sshpass

# ping servers. verify ansible can connect with the servers
ansible -i ./inventory/hosts ubuntu -m ping --user serveradmin --ask-pass

ansible-playbook ./playbooks/apt.yml --user serveradmin --ask-pass --ask-become-pass -i ./inventory/hosts

ansible-playbook ./playbooks/qemu-gest-agent.yml --user serveradmin --ask-pass --ask-become-pass -i ./inventory/hosts

ansible-playbook ./playbooks/timezone.yml --user serveradmin --ask-pass --ask-become-pass -i ./inventory/hosts


```



## References
- [Automate EVERYTHING with Ansible! (Ansible for Beginners)](https://www.youtube.com/watch?v=w9eCU4bGgjQ)
- [Techno Time Documentation](https://docs.technotim.live/)
- [launchpad](https://github.com/techno-tim/launchpad)