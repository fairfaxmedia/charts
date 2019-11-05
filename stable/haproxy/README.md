# HAProxy

The Reliable, High Performance TCP/HTTP Load Balancer.

## Introduction

This chart installs HAProxy on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites
  - Kubernetes 1.11+

## Installing the Chart

To install the chart:

```console
$ helm repo add fairfaxmedia http://kubernetes-charts.ffxblue.com.au
$ helm repo update
$ helm install fairfaxmedia/haproxy
```

The command deploys HAProxy on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the release:

```console
$ helm ls | grep haproxy
$ helm delete ${RELEASE}
```

The command removes most of the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the elasticsearch chart and their default values.

| Parameter               | Default        | Description |
| ----------------------- | -------------- | ----------- |
| `replicaCount`          | `1`            | ..          |
| `image.repository`      | `haproxy`      | ..          |
| `image.tag`             | `2.0.1-alpine` | ..          |
| `image.pullPolicy`      | `IfNotPresent` | ..          |
| `imagePullSecrets`      | `[]`           | ..          |
| `nameOverride`          | ``             | ..          |
| `fullnameOverride`      | ``             | ..          |
| `servicenameOverride`   | ``             | ..          |
| `service.type`          | `ClusterIP`    | ..          |
| `service.port`          | `80`           | ..          |
| `service.containerPort` | `8080`         | ..          |
| `service.probePath`     | `/stats`       | ..          |
| `ingress.enabled`       | `false`        | ..          |
| `ingress.hosts`         | `[]`           | ..          |
| `ingress.tls`           | `[]`           | ..          |
| `config.env`            | `[]`           | ..          |
| `config.haproxy.cfg`    |                | ..          |
| `nodeSelector`          | `{}`           | ..          |
| `tolerations`           | `[]`           | ..          |
| `affinity`              | {}             | ..          |

### Config

The `haproxy.cfg` is set as a value of `config.haproxy.cfg`.

The default configuration provides very little functionality and will want to be changed.
```
  defaults
    mode http
    timeout connect 5s
    timeout client 5s
    timeout server 5s

  frontend web
    mode http
    bind :8080
    stats enable
    stats uri /stats
```

### Example

A YAML file that specifies the values for the parameters can be provided while installing the chart.

```console
$ helm install fairfaxmedia/elasticsearch --values values.yaml
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Ingress Support

Ingress support can be enabled by adding the following values.

```yaml
ingress:
  enabled: true
  hosts:
    - haproxy.example.org
  annotations:
    kubernetes.io/ingress.class: nginx
```
