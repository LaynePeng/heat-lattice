A Lattice cluster with Heat
==============================

These [Heat][] templates will deploy an *N*-node Lattice cluster,
where *N* is the value of the `number_of_nodes` parameter you
specify when creating the stack.

[heat]: https://wiki.openstack.org/wiki/Heat

## Requirements

### OpenStack

These templates will work with the Juno version of Heat.

### Guest image

These templates will work with Ubuntu 14.04

## Creating the stack


Creating an environment file `local.yaml` with parameters specific to
your environment:

    parameters:
      ssh_key_name: apmelton
      external_network_id: 028d70dd-67b8-4901-8bdd-0c62b06cce2d
      dns_nameserver: 192.168.200.1
      server_image: ubuntu-14.04

And then create the stack, referencing that environment file:

    heat stack-create -f lattice.yaml -e local.yaml my-lattice-cluster

You must provide values for:

- `ssh_key_name`
- `external_network_id`
- `server_image`
- `swarm_token`

## Interacting with Lattice


## Testing



## License

Copyright 2015 EMC Layne (appamail@hotmail.com)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use these files except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
