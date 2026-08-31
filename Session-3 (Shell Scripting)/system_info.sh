read -r -p "Ur name: " name
read -r -p "Ur roll: " roll_no
read -r -p "Any comms: " comm

date
hostname
whoami

df -h
ps aux

mkdir system_report
cd system_report
ps aux >> processes.txt
cat processes.txt

echo "YOur name: $name"
echo "YOur roll: $roll_no"
echo "Ur comment: $comm"
