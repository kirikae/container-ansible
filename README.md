[![Docker Repository on Quay](https://quay.io/repository/bcolbyse/ansible/status "Docker Repository on Quay")](https://quay.io/repository/bcolbyse/ansible)
# Ansible in a Container

Ansible in a container.

## container-ansible

To use this passthrough your Ansible directory as a volume located at `/ansible` in the container. Then shell into the container and use away!

Contains `vim` for file modifications, otherwise these can be modified externally to the container.

```
podman run -it --rm --net=host --name ansible -v $HOME/ansible:/ansible:z quay.io/bcolbyse/ansible:4.1.0
```

NOTE: SELinux will prevent access to the contents of the volume unless you add on the `:z` to the volume.

## container-ocp-ansible

Similar to `container-ansible` however, it includes `oc` and `opm` binaries.

## Ansible Galaxy

You could additionally passthrough a directory containing Collections and Roles installed from Ansible Galaxy. These should be volume mounted as `-v $HOME/.ansible:/root/.ansible:z`.
Alternatively, these could be installed inside the container interactively.
