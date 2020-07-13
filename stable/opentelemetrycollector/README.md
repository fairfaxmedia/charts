# opentelemetrycollector

[opentelemetrycollector](https://github.com/fairfaxedia/charts/stable/opentelemetrycollector) is a Kubernetes resource used by the OpenTelemetry Operator to create a OpenTelemetry collector.

## TL;DR

```console
$ helm install fairfaxmedia/opentelemetrycollector
```

## Introduction

This chart bootstraps a openTelemetryCollector resource on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.7+ with Beta APIs enabled
- OpenTelemetry Operator installed

## Installing the Chart

Add the Fairfax Media Helm repository:

```console
$ helm repo add fairfaxmedia https://charts.ffx.io
```

To install the chart with the release name `my-release`:

```console
$ helm install --name my-release fairfaxmedia/opentelemetrycollector
```

The command deploys opentelemetrycollector on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Creating a customised openTelemetryCollector instance

The simplest possible way to install is by creating a YAML values file like the following:

```YAML
config:
  receivers:
    otlp:
      protocol:
        grpc: ~
  processors:
    queued_retry: {}
  exporters:
    logging: {}
  extensions:
    health_check: {}
  pipelines:
    extensions: [health_check]
    traces:
      receivers: [otlp]
      processors: [queued_retry]
      exporters: [logging]
```

The documentation for the [opentelemetry-collector](https://github.com/open-telemetry/opentelemetry-collector) will provide details on building a custom configuration.

Empty values for keys should use `~` or `{}` to preserve the key when it is templated into the resource. Helm drops empty keys and this modifies the result when it is transformed into the final resource.

```console
$ helm install fairfaxmedia/opentelemetrycollector --name my-release \
    --file values.yaml
```

## Configuration

The following table lists the configurable parameters of the opentelemetrycollector chart and their default values.

| Parameter          | Default                        | Description                                                                                                                       |
|:-------------------|:-------------------------------|:----------------------------------------------------------------------------------------------------------------------------------|
| `image.repository` | `otel/opentelemetry-collector` | Image repository. Undefined uses operator builtin default.                                                                        |
| `image.tag`        | `~`                            | Image tag. Undefined uses operator builtin default.                                                                               |
| `mode`             | `Deployment`                   | Mode represents how the collector should be deployed (`Deployment` or `DaemonSet`). Undefined uses operator builtin default.      |
| `args`             | `{}`                           | Args is the set of arguments to pass to the OpenTelemetry Collector binary.                                                       |
| `config`           |                                | Config as per the `opentelemetry-collector` specification in YAML.                                                                |
| `ports`            | `[]`                           | Ports allows a set of ports to be exposed by the underlying service. Inferred by operator inspecting the specification.           |
| `replicas`         | `~`                            | Replicas is the number of pod instances for the underlying OpenTelemetry Collector. Undefined uses operator builtin default.      |
| `serviceAccount`   | `~`                            | ServiceAccount indicates the name of an existing service account to use with this instance. Automatically generated if undefined. |
| `volumes`          | `[]`                           | Volumes represents which volumes to use in the underlying collector deployment.                                                   |
| `volumeMounts`     | `[]`                           | VolumeMounts represents the mount points to use in the underlying collector deployment.                                           |

Specify each parameter you'd like to override using a YAML file as described above in the [installation](#installing-the-chart) section.

You can also specify any non-array parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
$ helm install fairfaxmedia/opentelemetrycollector --name my-release \
    --set deployment=DaemonSet
```
