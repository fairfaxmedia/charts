# elasticsearch

An opinionated Kubernetes implementation for [Elasticsearch](https://github.com/elastic/elasticsearch) focused on providing a reliable yet flexible solution based on the upstream official image.

The documentation is currently a work in progress and should not be considered complete. Unfinished sections:
* Details about configuration of each helm value.
* Explanation how to tune container memory limits.
* Explanation how to configure data persistence.
* Cluster architecture and sizing.

## Introduction

This chart bootstraps an Elasticsearch cluster on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites
  - Kubernetes 1.11+

## Installing the Chart

To install the chart:

```console
$ helm repo add fairfaxmedia http://kubernetes-charts.ffxblue.com.au
$ helm repo update
$ helm install fairfaxmedia/elasticsearch
```

The command deploys Elasticsearch on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the release:

```console
$ helm ls | grep elasticsearch
$ helm delete ${RELEASE}
```

The command removes most of the Kubernetes components associated with the chart and deletes the release.

If configured, there will still be persistent volume claims (PVC) and persistent volumes (PV) in the namespace that the chart was installed in. Removal of the PV will permanently delete stateful data and should be done with care.

If recreating the cluster after deletion of the release, it is recommended to modify the PV to remove the `spec.claimRef` as this will prevent the new  PVC from associating with the PV.

## Configuration

The following table lists the configurable parameters of the elasticsearch chart and their default values.

| Parameter                          | Default                      | Short Description                                   |
|:-----------------------------------|:-----------------------------|:----------------------------------------------------|
| `image.repository`                 | `fairfaxmedia/elasticsearch` | Image repository                                    |
| `image.tag`                        | `v1.0.4-elasticsearch6.5.1`  | Image tag                                           |
| `image.pullPolicy`                 | `IfNotPresent`               | Image pull policy                                   |
| `revisionHistoryLimit`             | `5`                          | Statefulset and deployment revision history limit   |
| `podManagementPolicy`              | `~`                          | ..                                                  |
| `priorityClassName`                | `~`                          | ..                                                  |
| `nameOverride`                     | `~`                          | Override the short release name                     |
| `fullnameOverride`                 | `~`                          | Override the full release name                      |
| `servicenameOverride`              | `~`                          | Override the service name                           |
| `service.annotations`              | `{}`                         | Service annotations                                 |
| `service.type`                     | `ClusterIP`                  | Type of service                                     |
| `service.port`                     | `9200`                       | HTTP port published by service                      |
| `service.probePath`                | `/_cluster/health`           | Health check of service                             |
| `ingress.enabled`                  | `false`                      | Enable ingress resource                             |
| `ingress.annotations`              | `{}`                         | Ingress annotations                                 |
| `ingress.path`                     | `/`                          | Ingress path mapping to service                     |
| `ingress.hosts`                    | `["chart-example.local"]`    | An array of hostnames managed by the ingress        |
| `ingress.tls`                      | `[]`                         | Ingress TLS configuration                           |
| `common.clusterName`               | `~`                          | Cluster name                 |                      |
| `common.env`                       | `{}`                         | List of environmental variables key value pairs     |
| `common.settings`                  | `{}`                         | HereDoc of settings to add to `elasticsearch.yml`   |
| `master.replicaCount`              | `1`                          | Master node replica count                           |
| `master.strategyType`              | `RollingUpdate`              | Master node upgrade strategy                        |
| `master.resources`                 | `{}`                         | Master node resources                               |
| `master.resources.requests.memory` | `512Mi`                      | Master node memory requests                         |
| `master.resources.limits.memory`   | `512Mi`                      | Master node memory limits                           |
| `master.ramPercentage`             | `25`                         | Master node JVM heap size ratio                     |
| `master.affinity`                  | `[]`                         | Array of master node affinity                       |
| `master.nodeSelector`              | `[]`                         | Array of master node selector                       |
| `master.tolerations`               | `[]`                         | Array of master node tolerations                    |
| `data.replicaCount`                | `1`                          | Data node replica count                             |
| `data.strategyType`                | `OnDelete`                   | Data node upgrade strategy                          |
| `data.resources`                   | `{}`                         | Data node resources                                 |
| `data.resources.requests.memory`   | `658Mi`                      | Data node memory requests                           |
| `data.resources.limits.memory`     | `658Mi`                      | Data node memory limits                             |
| `data.ramPercentage`               | `40`                         | Data node JVM heap size ratio                       |
| `data.affinity`                    | `[]`                         | Array of data node affinity                         |
| `data.nodeSelector`                | `[]`                         | Array of data node selector                         |
| `data.tolerations`                 | `[]`                         | Array of data node tolerations                      |
| `client.replicaCount`              | `1`                          | Client node replica count                           |
| `client.replicaScaleFactor`        | `2`                          | Client node HPA replica maximum scaling factor      |
| `client.cpuThreshold`              | `70`                         | Client node HPA CPU threshold before scaling        |
| `client.maxUnavailable`            | `33%`                        | Client node maximum unavailable pods                |
| `client.strategyType`              | `RollingUpdate`              | Client node upgrade strategy                        |
| `client.resources`                 | `{}`                         | Client node resources                               |
| `client.resources.requests.memory` | `658Mi`                      | Client node memory requests                         |
| `client.resources.limits.memory`   | `658Mi`                      | Client node memory limits                           |
| `client.ramPercentage`             | `40`                         | Client node JVM heap size ratio                     |
| `client.affinity`                  | `[]`                         | Array of client node affinity                       |
| `client.nodeSelector`              | `[]`                         | Array of client node selector                       |
| `client.tolerations`               | `[]`                         | Array of client node tolerations                    |
| `persistence.enabled`              | `false`                      | Enable persistent storage for master and data nodes |
| `persistence.provisioner`          | `~`                          | Provisioner                                         |
| `persistence.provisionerType`      | `~`                          | Provisioner type                                    |
| `persistence.masterSize`           | `4Gi`                        | Master node volume size                             |
| `persistence.dataSize`             | `4Gi`                        | Data node volume size                               |
| `memory.buffer`                    | `384Mi`                      | Unused                                              |
| `virtualMemory.enabled`            | `false`                      | Enable custom virtual memory settings               |
| `virtualMemory.maxMapCount`        | `262144`                     | Virtual memory max map count                        |

### Generic

Generic configuration that is typical in most Helm charts. It is unlikely that any of these values will need to be changed unless using a different image repository or tag.

#### image.repository
Default: `fairfaxmedia/elasticsearch`
Image repository

#### image.tag
Default: `v1.0.4-elasticsearch6.5.1`
Image tag

#### image.pullPolicy
Default: `IfNotPresent`
Image pull policy

#### revisionHistoryLimit
Default: `5`
Statefulset and deployment revision history limit

#### podManagementPolicy
Default: `~`

#### priorityClassName
Default: `~`

#### nameOverride
Default: `~`
Override the short release name

#### fullnameOverride
Default: `~`
Override the full release name

### Service

Most service values will not need to be updated however additional service annotations may be required for monitoring. A service name override is useless when requiring a specific service name instead of a host derived from the full release name.

#### servicenameOverride
Default: `~`
Override the service name

#### service.annotations
Default: `{}`
Service annotations

#### service.type
Default: `ClusterIP`
Type of service

#### service.port
Default: `9200`
HTTP port published by service

#### service.probePath
Default: `/_cluster/health`
Health check of service

### Ingress

If the Elasticsearch cluster is required to be accessible outside of the cluster (consider the security implications before doing this) ingress resource can be enabled and a host can be defined. It will likely be necessary to add an ingress annotation as well.

#### ingress.enabled
Default: `false`
Enable ingress resource

#### ingress.annotations
Default: `{}`
Ingress annotations

#### ingress.path
Default: `/`
Ingress path mapping to service

#### ingress.hosts
Default: `["chart-example.local"]`
An array of hostnames managed by the ingress

#### ingress.tls
Default: `[]`
Ingress TLS configuration

### Common

The common section is the most likely section requiring configuration. It is highly recommended to set the `common.clusterName` and add any specific Elasticsearch settings to the `common.Settings`.

#### common.clusterName
Default: `~`
Cluster name

#### common.env
Default: `{}`
List of environmental variables key value pairs

#### common.settings
Default: `{}`
HereDoc of settings to add to `elasticsearch.yml`

### Master / Data / Client

Using this chart in a production environment will require this section to be modified, especially the `replicaCount` for the nodes. The default resources and percentages must be tuned as the default values are based around simple test clusters with low usage and storage.

#### master.replicaCount
Default: `1`
Master node replica count

#### master.strategyType
Default `RollingUpdate`
Master node upgrade strategy

#### master.resources
Default: `{}`
Master node resources

##### master.ramPercentage
Default: `25`
Master node JVM heap size ratio

#### master.affinity
Default: `[]`
Array of master node affinity

#### master.nodeSelector
Default `[]`
Array of master node selector

#### master.tolerations
Default: `[]`
Array of master node tolerations

#### data.replicaCount
Default: `1`
Data node replica count

#### data.strategyType
Default: `OnDelete`
Data node upgrade strategy

#### data.resources
Default: `{}`
Data node resources
data.resources.requests.memory `658Mi`
data.resources.limits.memory `658Mi`

#### data.ramPercentage
Default: `40`
Data node JVM heap size ratio

#### data.affinity
Default: `[]`
Array of data node affinity

#### data.nodeSelector
Default: `[]`
Array of data node selector


#### data.tolerations
Default: `[]`
Array of data node tolerations

#### client.replicaCount
Default: `1`
Client node replica count

#### client.replicaScaleFactor
Default: `2`
Client node HPA replica maximum scaling factor

#### client.cpuThreshold
Default: `70`
Client node HPA CPU threshold before scaling

#### client.maxUnavailable
Default: `33%`
Client node maximum unavailable pods

#### client.strategyType
Default: `RollingUpdate`
Client node upgrade strategy

#### client.resources
Default: `{}`
Client node resources
client.resources.requests.memory `658Mi`
client.resources.limits.memory `658Mi`

#### client.ramPercentage
Default: `40`
Client node JVM heap size ratio

#### client.affinity
Default: `[]`
Array of client node affinity

#### client.nodeSelector
Default: `[]`
Array of client node selector

#### client.tolerations
Default: `[]`
Array of client node tolerations

### Persistence

#### persistence.enabled
Default: `false`
Enable persistent storage for master and data nodes

#### persistence.provisioner
Default: `~`
Provisioner

#### persistence.provisionerType
Default: `~`
Provisioner type

#### persistence.masterSize
Default: `4Gi`
Master node volume size

#### persistence.dataSize
Default: `4Gi`
Data node volume size

### Miscellaneous

#### memory.buffer
Default: `384Mi`
Unused

#### virtualMemory.enabled
Default: `false`
Enable custom virtual memory settings

#### virtualMemory.maxMapCount
Default: `262144`
Virtual memory max map count

### Example

A YAML file that specifies the values for the parameters can be provided while installing the chart.

```console
$ helm install fairfaxmedia/elasticsearch --values values.yaml
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Prometheus Metrics

Metrics can be enabled for Prometheus by adding the following annotations to the values file.

```yaml
service:
  annotations:
    prometheus.io/path: /_prometheus/metrics
    prometheus.io/port: "9200"
    prometheus.io/scrape: "true"
```

## Ingress Support

Ingress support can be enabled by adding the following values.

```yaml
ingress:
  enabled: true
  hosts:
    - elasticsearch.example.org
  annotations:
    kubernetes.io/ingress.class: nginx
```

## Cluster Scaling

Elasticsearch needs to have the nodes scaled appropriately. In a production environment it is critical to get the correct balance of master, data and client nodes. A reasonable starting point would be as follows:

Master: 3 nodes (should be odd number to prevent split brain and preferably one per availability zone)
Data: 3 nodes (one per availability zone)
Client: 3 nodes (one per availability zone)

This can be configured in the Helm values as such:

```yaml
master:
  replicaCount: 3

data:
  replicaCount: 3

client:
  replicaCount: 3
```

### Data Persistence

Data persistence can be enabled by adding the following values.

```yaml
persistence:
  enabled: true
  provisioner: kubernetes.io/aws-ebs
  provisionerType: gp2
```
