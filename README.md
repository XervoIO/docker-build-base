Modulus Base Docker Build Image
=========

The base Docker image for all Modulus build images. Extends from
`onmodulus/image-base`.

## mop user
All user code is run under mop user/group by the Modulus platform.

## Volumes

`/mnt`

The volume mounted at `/mnt` requires the follow subdirectories to be created
by the host system and accessible by the `mop` user/group.

* `/mnt/tmp` Temporary storage. The TEMP_DIR environment variable is defined to here.
* `/mnt/home` The mop user's home directory. The HOME environment variable is defined to here.
* `/mnt/input` The directory where your source will be extracted. The INPUT_DIR environment variable is defined to here.
* `/mnt/output` The directory that will be archived as a successful build. The OUTPUT_DIR environment variable is defined to here.

## Usage
The Modulus base runtime image is used like any other image:

```
FROM: onmodulus/image-build-base:1.0.0

# Customizations

# The base image extends phusion/baseimage so it's important to run
# the init system as the CMD.
CMD ["/sbin/my_init"]
```
