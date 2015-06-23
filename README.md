# Modulus Base Docker Build Image
The Modulus images are a set of Docker images designed to run arbitrary applications with a standardized external interface. The Modulus image convention enforces a high degree of security and control required by PaaS environments and might not be suitable for small, more focused, deployments.

## The mop user
The [Modulus base image](https://github.com/onmodulus/docker-base) creates a mop user, under which all external software is run. The mop user does not have write access to anywhere on the Docker volume. Instead it can only write to a volume externally mounted from the host system.

## Volumes

`/mnt`

The volume mounted at `/mnt` requires the follow subdirectories to be created
by the host system and accessible by the `mop` user/group.

* `/mnt/tmp` Temporary storage. The TEMP_DIR environment variable is defined to here.
* `/mnt/home` The mop user's home directory. The HOME environment variable is defined to here.
* `/mnt/input` The directory where your source will be extracted. The INPUT_DIR environment variable is defined to here.
* `/mnt/output` The directory that will be archived as a successful build. The OUTPUT_DIR environment variable is defined to here.

## The Build script
The Modulus build image standard requires there to be an executable somewhere in the PATH named `build`. This executable should not block and should redirect any logging to stdout. The build image should read the input source from /mnt/input, perform any necessary actions, and output the compiled artifact in /mnt/output. For example, the [Node.js build image](https://github.com/onmodulus/docker-build-node) performs an npm install and optionally runs the unit tests as part of its build.

## Usage
The base build image is not meant to be run directly. It's designed to be inherited by an application specific image, for example the [Node.js build image](https://github.com/onmodulus/docker-build-node).

```
FROM: onmodulus/docker-build-base:1.0.0

# Customizations

# The base image extends phusion/baseimage so it's important to run
# the init system as the CMD.
CMD ["/sbin/my_init"]
```

# License
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
