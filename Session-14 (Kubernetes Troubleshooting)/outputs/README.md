# Before/after output records

This directory indexes the terminal evidence represented by the screenshots in the parent README.

| File | Capture point |
|---|---|
| `01-command-inspection.txt` | `get`, `get -o wide` and `describe` |
| `02-command-logs-exec.txt` | `logs` and Service request from `exec` |
| `03-command-events-explain-top.txt` | `events`, `explain` and `top` |
| `04-workload-before.txt` | Broken CrashLoopBackOff, Pending, ContainerCreating, configuration and image-pull investigations |
| `05-workload-after.txt` | Successful workload fixes and `exec` checks |
| `06-connectivity-before.txt` | Broken Service selector, DNS and target-port checks |
| `07-connectivity-after.txt` | Healthy Service, endpoint, DNS and HTTP checks |

The corresponding investigation and verification commands are documented in the parent [README](../README.md).
