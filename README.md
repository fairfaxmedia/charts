# elasticsearch

[elasticsearch](https://github.com/mikelorant/elasticsearch-charts/) is an implementation of an Elasticsearch cluster.

## Introduction

This chart implements an Elasticsearch deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites
  - EBS volume IDs for both the master and data pods
  - Kubernetes 1.6+ with Beta APIs enabled (1.7+ for parallel stateful sets)

## Installing the Chart

Create the Helm Values file.

```console
ingress:
  enabled: true
  hosts:
    - (endpoint hostname)
  annotations:
    kubernetes.io/ingress.class: (appropriate class)
persistentVolumes:
  uuid: (output of uuidgen in lower case)
  master:
    volumeIDs:
      - (master volume id for availability zone A)
      - (master volume id for availability zone B)
      - (master volume id for availability zone C)
  data:
    volumeIDs:
      - (data volume id for availability zone A)
      - (data volume id for availability zone B)
      - (data volume id for availability zone C)
```

To install the chart:

```console
helm install ffxblue/elasticsearch \
  --name-template '{{randAlpha 5 | lower }}' \
  --namespace ${NAMESPACE} \
  --values helm/values.yaml
```

The command deploys elasticsearch resources on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete (release name) --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following tables lists the configurable parameters of the elasticsearch chart and their default values.

| Parameter                            | Default                                                                                            |
|:-------------------------------------|:---------------------------------------------------------------------------------------------------|
| replicaCount.master                  | `3`                                                                                                |
| replicaCount.data                    | `3`                                                                                                |
| replicaCount.client                  | `3`                                                                                                |
| image.repository                     | `mikelorant/elasticsearch`                                                                         |
| image.tag                            | `experimental`                                                                                     |
| image.pullPolicy                     | `Always`                                                                                           |
| revisionHistoryLimit                 | `5`                                                                                                |
| service.name                         | `elasticsearch`                                                                                    |
| service.type                         | `ClusterIP`                                                                                        |
| service.ports.http.externalPort      | `80`                                                                                               |
| service.ports.http.internalPort      | `9200`                                                                                             |
| service.ports.transport.externalPort | `9300`                                                                                             |
| service.ports.transport.internalPort | `9300`                                                                                             |
| service.annotations                  | `{}`                                                                                               |
| ingress.enabled                      | `false`                                                                                            |
| ingress.hosts                        | `chart-example.local`                                                                              |
| ingress.annotations                  | `{}`                                                                                               |
| ingress.tls                          | `[]`                                                                                               |
| resources.requests.cpu               | `100m`                                                                                             |
| resources.requests.memory            | `128m`                                                                                             |
| config.es.cluster.name               | `example`                                                                                          |
| config.es.java.opts.master           | `-Xms512m -Xmx512m`                                                                                |
| config.es.java.opts.data             | `-Xms512m -Xmx512m`                                                                                |
| config.es.java.opts.client           | `-Xms512m -Xmx512m`                                                                                |
| persistentVolumes.annotations        | `{}`                                                                                               |
| persistentVolumes.uuid               | `12345678-1234-1234-1234-123456789012`                                                             |
| persistentVolumes.master.size        | `4Gi`                                                                                              |
| persistentVolumes.master.volumeIDs   | `[]`                                                                                               |
| persistentVolumes.data.size          | `50Gi`                                                                                             |
| persistentVolumes.data.volumeIDs     | `[]`                                                                                               |

> **Tip**: You can use the default [values.yaml](values.yaml)
