# Shell Scripting

This folder contains my Session 3 Bash practice. I worked through basic Bash scripting concepts including file creation, output redirection, user input, variables, functions, loops, conditions, and system information.

## Scripts and files

```text
Shell Scripting/
├── hello.sh
├── data.sh
├── script1.sh
├── input.sh
├── variable.sh
├── function.sh
├── loop.sh
├── system_info.sh
├── condition.sh
├── while_loop.sh
├── while_loop1.sh
├── hello/
├── data/
├── data1/
└── system_report/
```

## 1. Create a directory and file — `hello.sh`

This script creates a directory, writes text into a log file using `>`, and displays the file using `cat`.

```bash
mkdir -p hello
printf '%s\n' "This is the Logfile heheehe" > hello/app.log
cat hello/app.log
```

I initially received a `Permission denied` error when trying to execute the script because it did not have execute permission. I then used `chmod +x hello.sh`.

```console
$ chmod +x hello.sh
$ ./hello.sh
This is the Logfile heheehe
```

## 2. Overwrite a file — `data.sh`

This script demonstrates that `>` overwrites the existing contents of a file.

```bash
mkdir data1
cd data1
touch app.log

echo "This is a log file." > app.log
cat app.log

echo "This is overridern line" > app.log
cat app.log
```

Output:

```text
This is a log file.
This is overridern line
```

The second `>` replaced the first line instead of adding to it.

## 3. Append to a file — `script1.sh`

This script demonstrates the `>>` operator.

```bash
mkdir -p data
cd data
touch app.log

echo "This is first line" >> app.log
echo "This is second line" >> app.log
cat app.log
```

First run:

```text
This is first line
This is second line
```

When I ran the script again, the new lines were appended to the existing file:

```text
This is first line
This is second line
This is first line
This is second line
```

Therefore:

* `>` → overwrite
* `>>` → append

## 4. Take user input — `input.sh`

This script uses `read` to take information from the user and stores it in variables.

```bash
read -p "ur naam: " name
read -p "ur roll: " roll_no
read -p "2 words: " comm

echo "tera naam: $name"
echo "tera roll_no: $roll_no"
echo "2 shabad: $comm"
```

I tested it with:

```text
ur naam: pratham
ur roll: 136
2 words: he ha
```

Output:

```text
tera naam: pratham
tera roll_no: 136
2 shabad: he ha
```

## 5. Variables — `variable.sh`

This script stores information directly in Bash variables and then uses those variables in `echo` commands.

```bash
name="pratham"
roll_no="136"
comment="Ye le"

echo "My name is $name"
echo "Me roll $roll_no"
echo "$comment"
```

Output:

```text
My name is pratham
Me roll 136
Ye le
```

Variables are assigned without `$` and their values are accessed using `$variable_name`.

## 6. Function — `function.sh`

This script defines a function called `show_my_info` and then calls it.

```bash
show_my_info() {
        echo "My name is pratham"
        echo "My roll no is 23bcs10136"
}

show_my_info
```

Output:

```text
My name is pratham
My roll no is 23bcs10136
```

The commands inside the function run when `show_my_info` is called.

## 7. For loop — `loop.sh`

This script uses a C-style Bash `for` loop.

```bash
for ((i = 0; i < 10; i++)); do
        echo "This is iteration no. $i"
done
```

Output:

```text
This is iteration no. 0
This is iteration no. 1
This is iteration no. 2
This is iteration no. 3
This is iteration no. 4
This is iteration no. 5
This is iteration no. 6
This is iteration no. 7
This is iteration no. 8
This is iteration no. 9
```

The loop starts at `0`, continues while `i < 10`, and increments `i` after every iteration.

## 8. Complete system report — `system_info.sh`

This is the main system-information script. It takes user input, displays system information, checks disk usage, displays running processes, saves the process list, and finally displays the entered student details.

```bash
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
```

I ran it using:

```console
$ ./system_info.sh
Ur name: pratham
Ur roll: 136
Any comms: no comments
```

The system information from my machine included:

```text
Mon Aug 31 08:07:08 PM IST 2026
pratham-onkar-singh-swift-sfg14-71
pratham-onkar-singh
```

The disk usage command produced information including:

```text
Filesystem      Size  Used Avail Use% Mounted on
/dev/nvme0n1p5  125G   89G   30G  75% /
/dev/nvme0n1p1  256M   68M  189M  27% /boot/efi
```

`ps aux` displayed the running processes, and the process information was also saved to:

```text
system_report/processes.txt
```

The script finally printed:

```text
YOur name: pratham
YOur roll: 136
Ur comment: no comments
```

The complete `ps aux` output is not included here because it is very large and changes as processes start and stop.

## 9. If/else conditions — `condition.sh`

I extended the basic condition assignment by using multiple `elif` branches to categorize ages.

```bash
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
```

I tested several ages:

```text
Ur age: 13
Ur a teen
```

```text
Ur age: 20
Ur an adult
```

```text
Ur age: 40
U r simply dead
```

```text
Ur age: 100
U r simply dead
```

This script demonstrates `if`, `elif`, and `else` branches.

## 10. While loop with input — `while_loop.sh`

This script repeatedly accepts input until `q` is entered. It also rejects non-numeric input.

```bash
while true; do
    read -r -p "Enter a number (or 'q' to quit): " input

    if [[ "$input" == "q" ]]; then
        echo "Exiting the loop."
        break
    elif ! [[ "$input" =~ ^[0-9]+$ ]]; then
        echo "Invalid input. Please enter a valid number."
        continue
    fi

    echo "You entered: $input"
done
```

I tested it with a valid number, invalid input, and the quit option:

```text
Enter a number (or 'q' to quit): 10
You entered: 10
Enter a number (or 'q' to quit): w
Invalid input. Please enter a valid number.
Enter a number (or 'q' to quit): q
Exiting the loop.
```

This demonstrates `while`, `break`, `continue`, and Bash pattern matching for input validation.

## 11. While loop counter — `while_loop1.sh`

This script uses a counter-controlled `while` loop.

```bash
count=0

while [ "$count" -lt 5 ]; do
    echo "This is iteration number $count"
    ((count++))
done
```

Output:

```text
This is iteration number 0
This is iteration number 1
This is iteration number 2
This is iteration number 3
This is iteration number 4
```

## What I practiced

* Creating and executing Bash scripts
* Giving scripts execute permission with `chmod +x`
* Creating directories and files
* Using `>` to overwrite files
* Using `>>` to append to files
* Taking user input with `read`
* Creating and using variables
* Defining and calling functions
* Using `for` loops
* Using `while` loops
* Using `break` and `continue`
* Using `if`, `elif`, and `else`
* Using command substitution/system commands in scripts
* Checking disk usage with `df -h`
* Checking running processes with `ps aux`
* Redirecting process output into a file

## My Session 3 directory

At the end of the assignment, my Shell Scripting directory contained:

```text
condition.sh
data/
data1/
data.sh
function.sh
hello/
hello.sh
input.sh
loop.sh
script1.sh
system_info.sh
system_report/
variable.sh
while_loop1.sh
while_loop.sh
```

The scripts were made executable and were tested directly from the terminal using `./script_name.sh`.
