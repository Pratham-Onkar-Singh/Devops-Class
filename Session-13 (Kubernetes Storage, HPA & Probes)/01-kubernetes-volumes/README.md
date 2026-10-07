# Kubernetes Volumes

This exercise compares temporary, node-local, statically provisioned, and dynamically provisioned storage. It demonstrates when data is shared, when it survives a Pod deletion, and who is responsible for creating the backing volume.

## What I learned

| Type | Purpose | Lifetime / scope | Example in this folder |
|---|---|---|---|
| `emptyDir` | Shares temporary data between containers in one Pod | Created with the Pod; removed when that Pod is removed | `emptydir.yaml` |
| `hostPath` | Mounts a path from the node filesystem | Data remains on that node; unsuitable for portable multi-node workloads | `hostpath.yaml` |
| PersistentVolume (PV) | Cluster-level storage resource with capacity, mode, class and reclaim policy | Independent of an individual Pod | `pv.yaml` |
| PersistentVolumeClaim (PVC) | Namespaced request for storage mounted by a workload | Outlives Pods while the claim exists | `pvc-static.yaml` |
| StorageClass | Selects a provisioner and parameters for storage | Cluster-level template for dynamically created PVs | `storageclass.yaml` |
| Dynamic provisioning | Provisioner creates a matching PV after a PVC is requested | PV is created on demand | `pvc-dynamic.yaml` |

## Run the Examples

```bash
kubectl apply -f .
kubectl -n volume-practice get pods,pvc
kubectl get pv,storageclass
```

## Verification Result

The captured output confirms that all three demo Pods were `Running`, the static and dynamic PVCs were `Bound`, and the dynamically provisioned PV was created automatically. It also confirms the expected file contents:

- `emptyDir`: `shared-data`
- `hostPath`: `node-storage`
- Dynamic PVC: `persisted-data`

![Volume verification](../images/s13-volumes-verification.png)

### `emptyDir`

`emptydir-demo` contains a writer and reader. The writer stores `shared-data` in `/data/message.txt`; the reader displays the same file through the shared volume.

```bash
kubectl -n volume-practice exec emptydir-demo -c reader -- cat /data/message.txt
kubectl -n volume-practice delete pod emptydir-demo
kubectl -n volume-practice apply -f emptydir.yaml
```

Container restarts keep the directory because the Pod remains. Deleting the Pod removes the `emptyDir` and a replacement Pod starts with a new one.

### `hostPath`

`hostpath-demo` writes a file to the node directory mounted at `/data`.

```bash
kubectl -n volume-practice exec hostpath-demo -- cat /data/message.txt
```

The workload becomes tied to the node containing the path. This pattern is useful for node agents but is usually avoided for application data.

### Static Provisioning: PV and PVC

`course-pv` supplies 200Mi using the `manual` class with a `Retain` policy. `course-pvc` asks for 100Mi with the same access mode and StorageClass, causing Kubernetes to bind the claim to that matching PV.

```bash
kubectl get pv course-pv
kubectl -n volume-practice describe pvc course-pvc
```

A PV is bound as a whole unit, so a 100Mi claim bound to this 200Mi PV consumes the PV until released. `Retain` preserves the underlying data after the PVC is deleted for administrator review or recovery.

### StorageClass and Dynamic Provisioning

`course-standard` uses the local-path provisioner installed in this Kind cluster. When `dynamic-pvc` is created, the provisioner creates a PV automatically. `pod-pvc.yaml` writes data into the claim; deleting and recreating that Pod preserves the file. On Minikube, replace the provisioner with `k8s.io/minikube-hostpath`.

```bash
kubectl -n volume-practice get pvc dynamic-pvc
kubectl get pv
kubectl -n volume-practice exec dynamic-pvc-demo -- cat /data/file.txt
```

Dynamic provisioning is normally used with cloud block storage or CSI drivers. The `Delete` reclaim policy in this local exercise removes dynamically provisioned storage when its claim is deleted.

## Static vs Dynamic Provisioning

| Detail | Static provisioning | Dynamic provisioning |
|---|---|---|
| PV creator | Cluster administrator | Storage provisioner |
| Required resources | PV and PVC | StorageClass and PVC |
| PV lifecycle in this lab | `Retain` | `Delete` |
| Typical use | Existing or specially managed storage | On-demand cloud or CSI-backed storage |

## Cleanup

```bash
kubectl delete namespace volume-practice
kubectl delete pv course-pv
kubectl delete storageclass course-standard
```
