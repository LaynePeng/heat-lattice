A Lattice cluster with Heat
==============================

This project is inspired by the [docker-swarm heat](https://github.com/openstack/magnum/tree/master/magnum/templates/docker-swarm) project，and imitates it. I am planning to integreate it to the Magnum project, keep it similar with the style may help.

These [Heat][] templates will deploy an *N*-node Lattice cluster,
where *N* is the value of the `number_of_nodes` parameter you
specify when creating the stack.

heat: https://wiki.openstack.org/wiki/Heat

Lattice: http://lattice.cf/index.html

## Requirements

### OpenStack

These templates will work with the Juno version of Heat. And:

1. External network should be pre-created;
2. SSH Key should be pre-created. 

### Guest image

These templates will work with Ubuntu 14.04 Cloud Image, which can be downloaded from: http://cloud-images.ubuntu.com/trusty/current/ . 

## Creating the stack

Creating an environment file `local.yaml` with parameters specific to
your environment:

    parameters:
      ssh_key_name: lattice
      external_network_id: 028d70dd-67b8-4901-8bdd-0c62b06cce2d
      dns_nameserver: 10.32.105.133
      server_image: ubuntu-14.04
      number_of_nodes: 10
      lattice_tar_url: http://10.32.105.222/lattice.tgz
      
Parameters: 

* ssh_key_name: The name of precreated SSH key;
* external_network_id: The ID of precreated external network;
* dns_nameserver: Optional paramters, set if your enviroment cannot use 8.8.8.8
* server_image: The name of Ubuntu Cloud Image;
* number_of_nodes: Optional paramters, it is 3 by default. The number of Lattice cells will be added to the cluster;
* lattice_tar_url: Optional paramters, considering we may build Lattice ourself, we can put our build in FTP, or HTTP server. We use "wget" to fetch the images. By default, we will download from: https://s3-us-west-2.amazonaws.com/lattice/unstable/latest/lattice.tgz .

And more optional parameter, please check from [lattice.yaml](https://github.com/LaynePeng/heat-lattice/blob/master/lattice.yaml)

And then create the stack, referencing that environment file:

    heat stack-create -f lattice.yaml -e local.yaml my-lattice-cluster

## Interacting with Lattice

Please follow the guide in [Lattice Get Started](http://lattice.cf/docs/getting-started.html). 

The target is the floating IP of coordinator node with the domain you set (xio.io by default). For example, suppose the floating IP is 10.32.80.133, then please run:

    ltc target 10.32.80.133.xip.io
    ltc vz
    
You should see the cells have been added to Lattice clusters.

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
