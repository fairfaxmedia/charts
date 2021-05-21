# SnapPass

It's like SnapChat... for passwords.

This is a web app that lets you share passwords securely.

## Introduction

This chart deploys SnapPass to a Kubernetes cluster.

## Prerequisites
  - Kubernetes 1.11+

## Installing the Chart

To install the chart:

```console
$ helm repo add fairfaxmedia https://charts.ffx.io
$ helm repo update
$ helm install fairfaxmedia/snappass
```

The command deploys SnapPass on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the release:

```console
$ helm ls | grep snappass
$ helm delete ${RELEASE}
```

The command removes most of the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the elasticsearch chart and their default values.

| Parameter                          | Default                 | Short Description                                                 |
|:-----------------------------------|:------------------------|:------------------------------------------------------------------|
| `replicaCount`                     | 1                       | Replica count                                                     |
| `image.repository`                 | `fairfaxmedia/snappass` | Image repository                                                  |
| `image.tag`                        | `1.4.1`                 | Image tag                                                         |
| `image.pullPolicy`                 | `IfNotPresent`          | Image pull policy                                                 |
| `imagePullSecrets`                 | `[]`                    |                                                                   |
| `nameOverride`                     | `~`                     | Override the short release name                                   |
| `fullnameOverride`                 | `~`                     | Override the full release name                                    |
| `service.type`                     | `ClusterIP`             | Type of service                                                   |
| `service.port`                     | `80`                    | HTTP port published by service                                    |
| `ingress.enabled`                  | `false`                 | Enable ingress resource                                           |
| `ingress.annotations`              | `{}`                    | Ingress annotations                                               |
| `ingress.hosts`                    | `[]`                    | An array of hostname and path managed by the ingress              |
| `ingress.tls`                      | `[]`                    | Ingress TLS configuration                                         |
| `resources`                        | `{}`                    | Resource requests and limits                                      |
| `master.affinity`                  | `[]`                    | Array of master node affinity                                     |
| `master.nodeSelector`              | `[]`                    | Array of master node selector                                     |
| `master.tolerations`               | `[]`                    | Array of master node tolerations                                  |
| `secretsEnabled`                   | `true`                  | Enable managing secrets from values                               |
| `config.secretKey`                 | `Secret Key`            | Unique key that's used to sign key                                |
| `config.debug`                     | `False`                 | Run Flask web server in debug mode                                |
| `config.staticUrl`                 | `static`                | Location of static assets                                         |
| `config.noSSL`                     | `True`                  | Disable SSL                                                       |
| `config.urlPrefix`                 | ``                      | Useful when running behind a reverse proxy                        |
| `config.redisHost`                 | `redis-headless`        | Redis host                                                        |
| `config.redisPort`                 | `6379`                  | Redis port                                                        |
| `config.snapPassRedisDB`           | `0`                     | Redis server database                                             |
| `config.redisUrl`                  | `~`                     | Redis URL to use (disables use of host, port and database values) |
| `config.redisPrefix`               | `snappass`              | Prefix used on Redis keys to prevent collisions                   |
| `redis.enabled`                    | `true`                  | Enable Redis component                                            |
| `redis.fullnameOverride`           | `redis`                 | Service endpoint for Redis                                        |
| `redis.cluster.enabled`            | `false`                 | Enable Redis clustering                                           |
| `redis.usePassword`                | `false`                 | Enable Redis password support                                     |
| `redis.master.persistence.enabled` | `false`                 | Enable Redis data persistence                                     |
| `nodeSelector`                     | `{}`                    | Settings for nodeselector                                         |
| `tolerations`                      | `[]`                    | Settings for toleration                                           |
| `affinity`                         | `{}`                    | Settings for affinity                                             |

### Example

A YAML file that specifies the values for the parameters can be provided while installing the chart.

```console
$ helm install fairfaxmedia/snappass --values values.yaml
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Ingress Support

Ingress support can be enabled by adding the following values.

```yaml
ingress:
  enabled: true
  annotations:
    kubernetes.io/ingress.class: nginx
  hosts:
  - host: onetimesecret.example.org
    paths:
    - /
```

### Data Persistence

Data persistence to the Redis component can be enabled by adding the following values.

```yaml
redis:
  master:
    persistence:
      enabled: true
```
