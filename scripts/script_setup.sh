#!/usr/bin/sh
chmod +x ./scripts/add-users.sh
chmod +x ./scripts/create_pvs.sh
chmod +x ./scripts/generate_inventory.sh
chmod +x ./scripts/multitenancy.sh
chmod +x ./scripts/pvs_10Gsize.sh
chmod +x ./scripts/pvs_5Gsize.sh
chmod +x ./scripts/uninstall.sh

sed -i -e 's/\r$//' ./scripts/add-users.sh
sed -i -e 's/\r$//' ./scripts/create_pvs.sh
sed -i -e 's/\r$//' ./scripts/generate_inventory.sh
sed -i -e 's/\r$//' ./scripts/multitenancy.sh
sed -i -e 's/\r$//' ./scripts/pvs_10Gsize.sh
sed -i -e 's/\r$//' ./scripts/pvs_5Gsize.sh
sed -i -e 's/\r$//' ./scripts/uninstall.sh

