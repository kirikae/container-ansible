# container-ansible

Ansible in a container.

To use this pass through your Ansible directory as a volume located at `/ansible` in the container. Then shell into the container and use away!

```
podman run -it --rm --name ansible -v $HOME/ansible:/ansible:z quay.io/bcolbyse/ansible:4.1.0
```````

NOTE: SELinux will prevent access to the contents of the volume unless you add on the `:z` to the volume.
