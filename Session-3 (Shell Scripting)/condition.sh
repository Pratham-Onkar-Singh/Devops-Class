read -p "Ur age: " age

if [ $age -lt 0 ]; then
  echo "Enter a valid age!"
elif [ $age -lt 13 ]; then
  echo "Ur a Child"
elif [ $age -lt 20 ]; then
  echo "Ur a teen"
elif [ $age -lt 40 ]; then
  echo "Ur an adult"
else
  echo "U r simply dead"
fi
