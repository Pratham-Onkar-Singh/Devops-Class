### Name: Pratham Onkar Singh
### Roll No.: 24bcs10136

# Linux Fundamentals

## Files and paths

### 1. `pwd` - show the current path

```console
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ pwd
/home/pratham-onkar-singh
```

### 2. `ls -la` - list all files with details

```console
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ ls -la
total 4606624
drwxr-x--- 57 pratham-onkar-singh pratham-onkar-singh 4096 Aug 31 17:17 .
drwxr-xr-x  3 root                root                4096 Aug  6  2024 ..
-rw-rw-r--  1 pratham-onkar-singh pratham-onkar-singh 60085406 Oct 25  2024 adobe.deb
drwxrwxr-x  2 pratham-onkar-singh pratham-onkar-singh 4096 Jul 24 23:46 .android
-rw-------  1 pratham-onkar-singh pratham-onkar-singh 73175 Aug 31 17:17 .bash_history
```

### 3. `cd` - change the current directory

```console
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ cd /var/log
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:/var/log$
```

### 4. `mkdir` - create a directory

```console
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ mkdir linux-test
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ ls
linux-test
```

### 5. `touch` - create an empty file

```console
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ touch notes.txt
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ ls
notes.txt
```

### 6. `cp` - copy a file or directory

```console
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ cp notes.txt notes-backup.txt
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ ls
notes-backup.txt  notes.txt
```

Use `cp -r source-directory destination-directory` when copying a directory.

### 7. `mv` - move or rename a file

```console
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ mv notes-backup.txt old-notes.txt
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ ls
notes.txt  old-notes.txt
```

### 8. `rm` - remove a file

```console
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ rm -i old-notes.txt
rm: remove regular empty file 'old-notes.txt'? y
```

### 9. `cat` - display a text file

```console
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ cat notes.txt
Linux commands become easier with practice.
```

## System and processes

### 10. `whoami` - show the current user

```console
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ whoami
pratham-onkar-singh
```

### 11. `hostname` - show the machine name

```console
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ hostname
pratham-onkar-singh-swift-sfg14-71
```

### 12. `uname -a` - show kernel and system information

```console
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ uname -a
Linux pratham-onkar-singh-swift-sfg14-71 7.0.0-30-generic #30~24.04.1-Ubuntu SMP PREEMPT_DYNAMIC Fri Aug 7 13:27:52 UTC 2026 x86_64 x86_64 x86_64 GNU/Linux
```

### 13. `date` - show the current date and time

```console
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ date
Mon Aug 31 06:51:39 PM IST 2026
```

### 14. `uptime` - show uptime and load average

```console
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ uptime
18:51:48 up 1 day, 49 min, 1 user, load average: 1.36, 1.70, 1.53
```

### 15. `ps aux` - take a snapshot of running processes

```console
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ ps aux
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  0.0  24620 15564 ?        Ss   Aug30   0:04 /sbin/init splash
root           2  0.0  0.0      0     0 ?        S    Aug30   0:00 [kthreadd]
root           3  0.0  0.0      0     0 ?        S    Aug30   0:00 [pool_workqueue_release]
pratham+   32428  0.3  0.9 1157.9g 149444 ?        S    ...    0:06 code
```

The full output contains many running system and user processes, so only a few representative entries are shown here.

### 16. `top` - monitor processes and resources live

```console
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ top
top - 18:52:38 up 1 day, 50 min, 1 user, load average: 1.43, 1.67, 1.53
Tasks: 436 total, 1 running, 435 sleeping, 0 stopped, 0 zombie
%Cpu(s): 3.8 us, 0.7 sy, 0.0 ni, 95.4 id
MiB Mem : 15673.2 total, 1279.4 free, 12085.4 used, 6247.1 buff/cache
MiB Swap: 4096.0 total, 3839.8 free, 256.2 used
```


### 17. `kill` - send a signal to a process

```console
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ kill 2481
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$
```

## Networking

### 18. `ip addr` - show network interfaces and addresses

```console
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 state UNKNOWN
    inet 127.0.0.1/8 scope host lo
2: wlp0s20f3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 state UP
    inet 100.128.164.170/20 brd 100.128.175.255 scope global dynamic wlp0s20f3
3: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 state DOWN
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
```

My main network interface is `wlp0s20f3`, which is the Wi-Fi interface. The system also has a Docker bridge interface called `docker0`.

### 19. `ip route` - show the routing table

```console
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ ip route
default via 100.128.160.1 dev wlp0s20f3 proto dhcp src 100.128.164.170 metric 600
100.128.160.0/20 dev wlp0s20f3 proto kernel scope link src 100.128.164.170 metric 600
172.17.0.0/16 dev docker0 proto kernel scope link src 172.17.0.1 linkdown
```

### 20. `ping` - test reachability and latency

```console
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ ping -c 3 8.8.8.8
64 bytes from 8.8.8.8: icmp_seq=1 ttl=119 time=19.8 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=119 time=19.5 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=119 time=17.7 ms

--- 8.8.8.8 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss
rtt min/avg/max/mdev = 17.676/19.000/19.846/0.948 ms
```

### 21. `ss -tulnp` - inspect listening sockets

```console
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ ss -tulnp
Netid State  Local Address:Port  Peer Address:Port Process
tcp   LISTEN 0 511 127.0.0.1:6379  0.0.0.0:*
tcp   LISTEN 0 200 127.0.0.1:5432  0.0.0.0:*
tcp   LISTEN 0 511 *:27121         *:*        users:(("code",pid=32897,fd=57))
```

The flags show TCP, UDP, listening sockets, numeric addresses, and process information.

### 22. `curl -I` - fetch only HTTP response headers

```console
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ curl -I https://example.com
HTTP/2 200
content-type: text/html
content-length: 1256
```

This is useful for checking whether a web server responds without downloading the full page.

## Basic volumes

### 23. `lsblk` - list block devices

```console
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ lsblk
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
nvme0n1     259:0    0 476.9G  0 disk
├─nvme0n1p1 259:1    0   260M  0 part /boot/efi
├─nvme0n1p2 259:2    0    16M  0 part
├─nvme0n1p3 259:3    0 348.7G  0 part
├─nvme0n1p4 259:4    0     1G  0 part
└─nvme0n1p5 259:5    0   127G  0 part /
```

My system has a 476.9 GB NVMe disk with several partitions, including the EFI partition and the partition mounted at `/`.

### 24. `mount` - show or attach mounted filesystems

```console
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ sudo mount /dev/nvme1n1 /mnt/data
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ mount
/dev/nvme0n1p5 on / type ext4 (rw,relatime)
```

The target directory and filesystem must already be prepared before mounting a real device.

### 25. `umount` - detach a mounted filesystem

```console
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$ sudo umount /mnt/data
pratham-onkar-singh@pratham-onkar-singh-swift-sfg14-71:~$
```

I first make sure no program is using files inside the mount point.


## Short homework notes

### Soft link and hard link

* A **hard link** is another name for the same file. Both names share the same inode, so the data remains available if one name is deleted. It normally cannot cross filesystems or link directories.
* A **soft link**, or symbolic link, stores the path of another file. It can cross filesystems and link directories, but it becomes broken if its target is removed.
* `ln original.txt hard-link.txt` creates a hard link, while `ln -s original.txt soft-link.txt` creates a soft link. `ls -li` can be used to compare inode numbers.

### `adduser` and `useradd`

* `useradd` is the lower-level, distribution-independent command. Its behaviour depends on options and system defaults, so administrators often specify the home directory and shell explicitly.
* On Debian and Ubuntu, `adduser` is normally preferred for creating a regular user manually. It is a friendlier wrapper that creates the home directory, copies default files, and asks for the required details.
* Therefore, there is no single preferred command for every Linux distribution: use `adduser` for interactive Debian/Ubuntu administration and `useradd` when a portable or scripted low-level command is required.

### `journalctl`

`journalctl` reads logs collected by `systemd-journald`. It is useful for checking boot problems, service failures, and recent system events. Useful forms include `journalctl -b` for the current boot, `journalctl -u nginx` for one service, and `journalctl -f` to follow new entries.
