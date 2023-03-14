# Kubernetes Secret Updater

This is used in conjunction with [Confidant](https://github.com/lyft/confidant), to update the secrets in k8s namespaces.
See the [k8s-secret-updater](https://github.com/fairfaxmedia/k8s-secret-updater) source code, and the [docker image](https://hub.docker.com/r/fairfaxmedia/k8s-secret-updater).

## Configuration Values

| Parameter                   | Default                            | Description                                             |
| --------------------------- | ---------------------------------- | ------------------------------------------------------- |
| `secretupdater.host`        | `"0.0.0.0"`                        | ..                                                      |
| `secretupdater.port`        | `"80"`                             | ..                                                      |
| `secretupdater.authMethod`  | `"saml"`                           | ..                                                      |
|                             |                                    |                                                         |
| `confidant.debug`           | `"false"`                          | ..                                                      |
| `confidant.webhookUsername` | `"webhookusername"`                | ..                                                      |
| `confidant.webhookPassword` | `"someSecretPasswordHere"`         | ..                                                      |
| `confidant.serverAuthKey`   | `"some_key_here"`                  | ..                                                      |
| `confidant.request.backoff` | `1`                                | Backoff factor for retries. See urllib3's Retry helper. |
| `confidant.request.timeout` | `5`                                | Connect and read timeout in seconds.                    |
| `confidant.request.retries` | `0`                                | Number of retries to use on failed requests.            |
|                             |                                    |                                                         |
| `saml.confidantUrlRoot`     | `"https://confidant.example.com/"` | ..                                                      |
|                             |                                    |                                                         |
| `awsDefaultRegion`          | `"ap-southeast-2"`                 | ..                                                      |

### Generic

| Parameter              | Default | Description |
| ---------------------- | ------- | ----------- |
| `replicaCount`         | `1`     | ..          |
| `revisionHistoryLimit` | `5`     | ..          |

### Image

| Parameter          | Default                           | Description |
| ------------------ | --------------------------------- | ----------- |
| `image.repository` | `fairfaxmedia/k8s-secret-updater` | ..          |
| `image.tag`        | `latest`                          | ..          |
| `image.pullPolicy` | `Always`                          | ..          |

### Service

| Parameter               | Default          | Description |
| ----------------------- | ---------------- | ----------- |
| `service.name`          | `secret-updater` | ..          |
| `service.containerPort` | `80`             | ..          |

### Ingress

| Parameter               | Default                      | Description |
| ----------------------- | ---------------------------- | ----------- |
| `ingress.name`          | `secret-updater`             | ..          |
| `ingress.containerPort` | `80`                         | ..          |
| `ingress.host`          | `secret-updater.example.com` | ..          |
| `ingress.path`          | `/`                          | ..          |
| `ingress.pathType`      | `Prefix`                     | ..          |
| `ingress.annotations`   | `{}`                         | ..          |

### Service Account

| Parameter               | Default | Description |
| ----------------------- | ------- | ----------- |
| `serviceAccount.create` | `false` | Create a service account with `.Chart.Name` as the name or if `serviceAccount.name`  set will use this as the name |
| `serviceAccount.name`   | `""`    | Include a service account by its name. If `serviceAccount.create` is `true` use this name when creating the service account |
| `serviceAccount.annotations` | `{}` | .. |

### Security Context

| Parameter                                  | Default | Description |
| ------------------------------------------ | ------- | ----------- |
| `securityContext.runAsNonRoot`             | `false` | If `true` containers must be required to run as non-root users. |
| `securityContext.privileged`               | `false` | Run container in privileged mode. |
| `securityContext.allowPrivilegeEscalation` | `false` | Controls whether a process can gain more privileges than its parent process. |
| `securityContext.runAsUser`                | `10001` | The UID that the container's main process should run as.  |
| `securityContext.runAsGroup`               | `10001` | The GID that the container's main process should run as.  |
