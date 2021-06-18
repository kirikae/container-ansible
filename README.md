# container-ansible

Ansible in a container.

To use this pass through your ansible directory as a volume located at `/ansible` in the container. Then shell into the container and use away!

```
podman run -it --rm --name ansible -v $HOME/ansible:/ansible quay.io/bcolbyse/ansible:4.1.0
```
