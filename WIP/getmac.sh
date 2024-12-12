# get default NIC
n=$(ip -o -4 route show to default | awk '{print $5}')
echo "default NIC=$n"

# get MAC
mac=$(cat /sys/class/net/$n/address)

echo "MAC=$mac"

IFS=':' read -a arr <<<"$mac"
id="${arr[0]}${arr[1]}${arr[2]}"

echo "id=$id"


