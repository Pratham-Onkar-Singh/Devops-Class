# Linux Networking Commands Lab

## Objective

The purpose of this exercise is to practise common Linux networking commands, record their output, and understand how each command can help with connectivity and troubleshooting.

> **Environment note:** The outputs below were collected on 4 September 2026. IP addresses, response times, routes, and service uptime may change when the commands are run again.

## Command Observations

### 1. Testing connectivity with `ping`

```bash
$ ping -c 2 google.com
PING google.com (192.178.174.113) 56(84) bytes of data.
64 bytes from lcbomo-in-f113.1e100.net (192.178.174.113): icmp_seq=1 ttl=115 time=43.8 ms
64 bytes from lcbomo-in-f113.1e100.net (192.178.174.113): icmp_seq=2 ttl=115 time=23.6 ms

--- google.com ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1000ms
rtt min/avg/max/mdev = 23.551/33.689/43.828/10.138 ms
```

**What I understood:** `ping` sends ICMP echo requests to check whether a host is reachable. Here, both packets returned successfully, so there was no packet loss. The average round-trip time was about 33.7 ms.

### 2. Viewing the route with `traceroute`

```bash
$ traceroute -m 4 google.com
traceroute to google.com (192.178.174.102), 4 hops max
  1   100.128.160.1    4.688ms  3.494ms  4.502ms
  2   114.79.130.29   17.277ms 38.253ms 14.505ms
  3   72.14.208.165   91.875ms 21.871ms 16.976ms
  4   192.178.84.175  21.611ms 27.949ms 15.388ms
```

**What I understood:** `traceroute` displays the routers, or hops, that packets pass through on the way to a destination. The `-m 4` option limits this test to four hops. It is useful for identifying where delay or packet loss begins.

### 3. Inspecting the routing table with `netstat`

```bash
$ netstat -rn
Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
0.0.0.0         100.128.160.1   0.0.0.0         UG        0 0          0 wlp0s20f3
100.128.160.0   0.0.0.0         255.255.240.0   U         0 0          0 wlp0s20f3
172.17.0.0      0.0.0.0         255.255.0.0     U         0 0          0 docker0
172.18.0.0      0.0.0.0         255.255.0.0     U         0 0          0 br-41f88096ef77
```

**What I understood:** `netstat -rn` prints the kernel routing table using numeric addresses. The default route (`0.0.0.0`) sends traffic through gateway `100.128.160.1` over the Wi-Fi interface `wlp0s20f3`. The Docker networks have separate local routes.

### 4. Checking a remote port with `telnet`

```bash
$ telnet example.com 80
Trying 172.66.147.243...
Connected to example.com.
Escape character is '^]'.
Connection closed by foreign host.
```

**What I understood:** `telnet` can test whether a TCP connection can be established to a host and port. The successful connection confirms that port 80 was reachable. Telnet is not suitable for secure remote login because its traffic is unencrypted.

### 5. Capturing packets with `tcpdump`

Run the following in a separate terminal because packet capture requires administrator permission:

```bash
$ sudo timeout 10 tcpdump -i any -c 3 -nn
```

**Output:** Add the three captured packet lines here after running the command.

**What I understood:** `tcpdump` captures packets passing through a network interface. `-i any` listens on all interfaces, `-c 3` stops after three packets, and `-nn` prevents hostname and port-name resolution. It is useful for investigating DNS requests, TCP handshakes, and unexpected traffic.

### 6. Looking up DNS information with `nslookup`

```bash
$ nslookup google.com
Server:         127.0.0.53
Address:        127.0.0.53#53

Non-authoritative answer:
Name:   google.com
Address: 192.178.174.139
Name:   google.com
Address: 192.178.174.102
Name:   google.com
Address: 192.178.174.100
Name:   google.com
Address: 192.178.174.113
Name:   google.com
Address: 192.178.174.101
Name:   google.com
Address: 192.178.174.138
```

**What I understood:** `nslookup` queries DNS to translate a domain name into one or more IP addresses. `127.0.0.53` is the local systemd-resolved DNS stub. The non-authoritative response came from a resolver cache rather than directly from Google's authoritative name server.

### 7. Performing a concise DNS query with `dig`

```bash
$ dig +short google.com
192.178.174.101
192.178.174.100
192.178.174.113
192.178.174.138
192.178.174.139
192.178.174.102
```

**What I understood:** `dig` provides detailed DNS query tools. The `+short` option shows only the returned records, which makes it convenient for scripts and quick checks. Multiple addresses help a large service distribute traffic.

### 8. Fetching HTTP response headers with `curl`

```bash
$ curl -I --max-time 10 https://example.com
HTTP/2 200
date: Fri, 04 Sep 2026 15:24:10 GMT
content-type: text/html
server: cloudflare
last-modified: Wed, 02 Sep 2026 22:14:26 GMT
allow: GET, HEAD
accept-ranges: bytes
cf-cache-status: HIT
```

**What I understood:** `curl` transfers data using protocols such as HTTP and HTTPS. `-I` requests headers only, while `--max-time 10` prevents the command from waiting for more than ten seconds. Status `200` means the request succeeded.

### 9. Viewing the ARP cache with `arp`

```bash
$ arp -a
wifi.height8tech.com (100.128.160.1) at d0:ea:11:32:00:19 [ether] on wlp0s20f3
? (100.128.171.38) at f6:66:af:d1:6b:1c [ether] on wlp0s20f3
```

**What I understood:** `arp -a` displays known IPv4-to-MAC-address mappings on the local network. The first entry is the gateway discovered through the wireless interface. On modern Linux systems, `ip neigh` is the newer alternative.

### 10. Checking the DNS service with `systemctl`

```bash
$ systemctl status systemd-resolved --no-pager
● systemd-resolved.service - Network Name Resolution
     Loaded: loaded (/usr/lib/systemd/system/systemd-resolved.service; enabled; preset: enabled)
     Active: active (running) since Thu 2026-09-03 16:51:07 IST; 1 day 4h ago
   Main PID: 914 (systemd-resolve)
     Status: "Processing requests..."
      Tasks: 1 (limit: 16609)
     Memory: 9.1M (peak: 11.4M)
```

**What I understood:** `systemctl` manages and inspects services controlled by systemd. This output confirms that the local DNS resolver is loaded, enabled at startup, and currently running. `--no-pager` prints the result directly in the terminal.

## Summary

This exercise covered four main areas of network troubleshooting:

- **Reachability and path:** `ping`, `traceroute`
- **Routes and local devices:** `netstat`, `arp`
- **DNS and web connectivity:** `nslookup`, `dig`, `curl`
- **Ports, packets, and services:** `telnet`, `tcpdump`, `systemctl`

Together, these commands help move from a general connectivity check to more specific investigation of routing, DNS, ports, packets, and system services.
