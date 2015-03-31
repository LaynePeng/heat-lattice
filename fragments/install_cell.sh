#!/bin/sh

set -e
echo Start to install Lattice-Cell
cat /var/lattice/setup/lattice-environment
wget $LATTICE_TAR_URL --quiet -O /tmp/lattice.tgz
tar -xf /tmp/lattice.tgz -C /tmp
/tmp/lattice-build/common/install-common
/tmp/lattice-build/lattice-cell/install-lattice-cell
