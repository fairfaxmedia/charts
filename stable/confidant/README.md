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
| `saml.spKeyFilePassword`                | `putTheSpKeyPasswordHere`                                           | ..          |
| `saml.idpCert`                          | `-----BEGIN CERTIFICATE-----`                                       | ..          |
| `confidant.enableSecurityRoles`         | `false`                                                             | Can ONLY be used with the fairfaxmedia/confidant:4.4.0-roles docker image. Currently only SAML auth type is supported, future releases may support other auth types|
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
| `confidant.serverAuthKey`               | `some_key_here`                                                     | ..          |
| `confidant.sessionSecret`               | `someuniquestringheretomakethingssafer`                             | ..          |
| `confidant.forwardedAllowIps`           | `*`                                                                 | ..          |
| `secretupdater.enable`                  | `false`                                                             | ..          |
