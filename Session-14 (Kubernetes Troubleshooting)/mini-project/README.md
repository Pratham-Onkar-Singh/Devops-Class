# Mini Project: Troubleshoot a Web Service

## Problem statement

A two-replica Nginx web application is exposed through the `s14-web` ClusterIP Service. The diagnostic client accessed it by its Service name. The project reproduced an invalid image and an incorrect Service selector, then restored the working application.

## Investigation and solution

| Failure | Investigation | Root cause | Fix | Verification |
|---|---|---|---|---|
| Image pull | `describe pod` and Pod events | Non-existent image tag | Use `nginx:1.27-alpine` | Pod becomes Ready |
| Service traffic | Labels, EndpointSlice and client request | Selector matched no Pods | Select `app: s14-web` | Endpoints appear; HTTP returns Nginx page |

The parent [README](../README.md#task-2-common-issues) contains the investigation commands and evidence. The working manifests are `app.yaml` and `service.yaml`; broken variants are under `../issues/`.
