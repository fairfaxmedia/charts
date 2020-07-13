# opentelemetry-operator

[opentelemetry-operator](https://github.com/fairfaxedia/charts/stable/opentelemetry-operator) is a Kubernetes operator.

## TL;DR

```console
$ helm install fairfaxmedia/opentelemetry-operator
```

## Introduction

This chart bootstraps a opentelemetry-operator deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.7+ with Beta APIs enabled

## Installing the Chart

Add the Fairfax Media Helm repository:

```console
$ helm repo add fairfaxmedia https://charts.ffx.io
```

To install the chart with the release name `my-release`:

```console
$ helm install --name my-release fairfaxmedia/opentelemetry-operator
```

The command deploys opentelemetry-operator on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the opentelemetry-operator chart and their default values.

| Parameter                       | Default                                          | Description                        |
|:--------------------------------|:-------------------------------------------------|:-----------------------------------|
| `image.repository`              | `"quay.io/opentelemetry/opentelemetry-operator"` | Image repository                   |
| `image.tag`                     | `"v0.0.2"`                                       | Image tag                          |
| `image.pullPolicy`              | `"IfNotPresent"`                                 | Image pull policy                  |
| `crd.install`                   | `true`                                           | Install custom resource definition |
| `openTelemetryCollector.enable` | `false`                                          | Create specification               |
| `rbac.create`                   | `true`                                           | Create RBAC                        |
| `rbac.clusterRole`              | `false`                                          | Enable clusterRole RBAC            |
| `imagePullSecrets`              | `[]`                                             | Image pull secrets                 |
| `nameOverride`                  | `""`                                             | Name override                      |
| `fullnameOverride`              | `""`                                             | Fullname override                  |
| `serviceAccount.create`         | `true`                                           | Create service account             |
| `serviceAccount.name`           | `""`                                             | Service account name               |
| `podSecurityContext`            | `{}`                                             | Pod security context               |
| `securityContext`               | `{}`                                             | Security context                   |
| `resources`                     | `{}`                                             | Resources                          |
| `nodeSelector`                  | `{}`                                             | Node selector                      |
| `tolerations`                   | `[]`                                             | Tolerations                        |
| `affinity`                      | `{}`                                             | Affinity                           |

Specify each parameter you'd like to override using a YAML file as described above in the [installation](#installing-the-chart) section.

You can also specify any non-array parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
$ helm install fairfaxmedia/opentelemetry-operator --name my-release \
    --set rbac.create=false
```

## After the Helm Installation

### Creating a new openTelemetryCollector instance

The simplest possible way to install is by creating a YAML file like the following:

```YAML
apiVersion: opentelemetry.io/v1alpha1
kind: OpenTelemetryCollector
metadata:
  name: simplest
spec:
  config: |
    receivers:
      otlp:
        protocols:
          grpc: ~
    processors:
      queued_retry: {}
    exporters:
      logging: {}
    extensions:
      health_check: {}
    service:
      extensions: [health_check]
      pipelines:
        traces:
          receivers: [otlp]
          processors: [queued_retry]
          exporters: [logging]
```

The documentation for the [opentelemetry-collector](https://github.com/open-telemetry/opentelemetry-collector) will provide details on building a custom configuration.

Empty values for keys should use `~` or `{}` to preserve the key when it is templated into the resource. Helm drops empty keys and this modifies the result when it is transformed into the final resource.

The YAML file can then be used with `kubectl`:

```console
$ kubectl apply -f simplest.yaml
```
