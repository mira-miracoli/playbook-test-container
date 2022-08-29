# playbook-test-container
A Rocky Linux 9 container image that can be used to run GalaxyEU's Ansible playbooks against.
It uses Podman, because it comes with systemd enabled containers by default. Just build with  
```
podman build -t local/rocky9 .
```
and use
```
podman run -d -v $(pwd)/vol:/ansible --name rocky local/rocky9:latest
```
to mount the `./vol` directory in the container at `/ansible.`  
Now you can put all ansible playbooks you want to run there and run them for example with:
```
podman exec -ti rocky /usr/local/bin/ansible-playbook /ansible/container.yml
```
