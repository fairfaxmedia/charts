# Confidant

(pronounced: "con-fide-ant")

For <http://github.com/lyft/confidant>

## Values

| Parameter                               | Default                                                             | Description |
| --------------------------------------- | ------------------------------------------------------------------- | ----------- |
| `replicaCount`                          | `1`                                                                 | ..          |
| `revisionHistoryLimit`                  | `5`                                                                 | ..          |
| `awsDefaultRegion`                      | `us-east-1`                                                         | ..          |
| `image.repository`                      | `lyft/confidant`                                                    | ..          |
| `image.tag`                             | `1.9.0`                                                             | ..          |
| `image.pullPolicy`                      | `IfNotPresent`                                                      | ..          |
| `service.type`                          | `LoadBalancer`                                                      | ..          |
| `service.containerPort`                 | `80`                                                                | ..          |
| `service.probePath`                     | `/loggedout`                                                        | ..          |
| `environment`                           | `{}`                                                                | Add Environment Variables |
| `authModule`                            | `saml`                                                              | ..          |
| `saml.confidantUrlRoot`                 | `https://confidant.example.com/`                                    | ..          |
| `saml.securitySloRespSigned`            | `false`                                                             | ..          |
| `saml.securityMessagesSigned`           | `false`                                                             | ..          |
| `saml.securityAssertionsSigned`         | `true`                                                              | ..          |
| `saml.idpSignonUrl`                     | `https://example.onelogin.com/trust/saml2/http-post/sso/000000`     | ..          |
| `saml.idpEntityId`                      | `https://app.onelogin.com/saml/metadata/000000`                     | ..          |
| `saml.idpLogoutUrl`                     | `https://example.onelogin.com/trust/saml2/http-redirect/slo/000000` | ..          |
| `saml.spCert`                           | ..                                                                  | ..          |
| `saml.spKey`                            | `-----BEGIN PRIVATE KEY-----`                                       | ..          |
| `saml.spKeyFilePassword`                | `""`                                                                | ..          |
| `saml.idpCert`                          | `-----BEGIN CERTIFICATE-----`                                       | ..          |
| `confidant.debug`                       | `true`                                                              | ..          |
| `confidant.dynamodbTable`               | `confidant-data`                                                    | ..          |
| `confidant.createDynamodbTable`         | `true`                                                              | ..          |
| `confidant.host`                        | `0.0.0.0`                                                           | ..          |
| `confidant.port`                        | `80`                                                                | ..          |
| `confidant.geventResolver`              | `ares`                                                              | ..          |
| `confidant.permanentSessionLifetime`    | `3600`                                                              | ..          |
| `confidant.maxPermanentSessionLifetime` | `43200`                                                             | ..          |
| `confidant.ignoreConflicts`             | `true`                                                              | ..          |
| `confidant.webhookUrl`                  | `http://localhost:5050/v1/update`                                   | ..          |
| `confidant.webhookUsername`             | `webhookusername`                                                   | ..          |
| `confidant.webhookPassword`             | `someSecretPasswordHere`                                            | ..          |
| `confidant.serverAuthContext`           | `iamRoleForConfidantServer`                                         | ..          |
| `confidant.serverAuthKey`               | `authKmsKeyName`                                                    | ..          |
| `confidant.serverKmsMasterKey`          | `masterKmsKeyName`                                                  | ..          |
| `confidant.sessionSecret`               | `someuniquestringheretomakethingssafer`                             | ..          |
| `confidant.forwardedAllowIps`           | `*`                                                                 | ..          |
| `confidant.aclModulePath`               | `""`                                                                | See https://lyft.github.io/confidant/acls.html |
| `secretupdater.enable`                  | `false`                                                             | ..          |
| `serviceAccount.create`                 | `false`                                                             | Create a service account with `.Chart.Name` as the name or if `serviceAccount.name`  set will use this as the name |
| `serviceAccount.name`                   | `""`                                                                | Include a service account by its name. If `serviceAccount.create` is `true` use this name when creating the service account |
| `serviceAccount.annotations`            | `{}`                                                                | .. |
| `annotations`                           | `{}`                                                                | ..          |
| `ingress.enable`                        | `false`                                                             | ..          |
| `ingress.annotations`                   | `{}`                                                                | ..          |
| `ingress.className`                     | `""`                                                                | ..          |
| `ingress.path`                          | `"/"`                                                               | ..          |
| `ingress.pathType`                      | `"ImplementationSpecific"`                                          | ..          |
| `ingress.host`                          | `confidant.example.com`                                             | ..          |
| `securityContext.runAsNonRoot`             | `false`                                                          | If `true` containers must be required to run as non-root users. |
| `securityContext.privileged`               | `false`                                                          | Run container in privileged mode. |
| `securityContext.allowPrivilegeEscalation` | `false`                                                          | Controls whether a process can gain more privileges than its parent process. |
| `securityContext.runAsUser`                | `10001`                                                          | The UID that the container's main process should run as. |
| `securityContext.runAsGroup`               | `10001`                                                          | The GID that the container's main process should run as. |
