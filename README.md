# Helm Charts Repository

An alternative [Helm](https://helm.sh) Charts repository.

## Getting Started

### Install Helm

Get the latest [Helm release](https://github.com/kubernetes/helm#install).

### Add Helm chart repository:

 ```console
 helm repo add fairfaxmedia https://fairfaxmedia.github.io/charts/
 helm repo update
 ```

### Install chart

To install a chart:

```console
helm install fairfaxmedia/${CHART}
```

Check ${CHART}/README.md for full documentation.

## Contributing to charts

Fork the repository, make changes, update unit tests and perform integration test by installing the chart.

On success make a [pull request](https://help.github.com/articles/using-pull-requests) (PR).

## Thanks :heart:

* Thanks to [Buildkite](https://github.com/buildkite) for the deployment scripts and documention template.
