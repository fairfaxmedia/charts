# Varnish

Varnish Cache Engine.

-   <https://varnish-cache.org/>

## Redirects

There are two types of redirect (`302` - temporary, and `301` - permanent).

These support either straight redirects (`from: "^/some/path/?$"` `to: "https://www.example.com/another/place"`),
or regex substitutions (`from: "/pathpart/to/match$"` `sub: true` `to: "/newpath/to/substitite"`) on the stripped url (no querystring).

## Values

| Parameter                        | Default                          | Description                                           |
| -------------------------------- | -------------------------------- | ----------------------------------------------------- |
| `replicaCount`                   | `1`                              | ..                                                    |
| `revisionHistoryLimit`           | `5`                              | ..                                                    |
| `image.repository`               | `egeland/varnish-alpine-docker`  | ..                                                    |
| `image.tag`                      | `3.6-qs-gotpl-2`                 | ..                                                    |
| `image.pullPolicy`               | `IfNotPresent`                   | ..                                                    |
| `ingress.external.host`          | `dummy-varnish.example.com`      | ..                                                    |
| `service.name`                   | `varnish`                        | ..                                                    |
| `service.type`                   | `ClusterIP`                      | ..                                                    |
| `service.externalPort`           | `80`                             | ..                                                    |
| `service.internalPort`           | `80`                             | ..                                                    |
| `service.probePath`              | `/internal/health`               | ..                                                    |
| `service.nameOverride`           | _no value_                       | Allows the naming of the service to whatever you need |
| `resources.limits.cpu`           | `2`                              | ..                                                    |
| `resources.limits.memory`        | `2Gi`                            | ..                                                    |
| `resources.requests.cpu`         | `100m`                           | ..                                                    |
| `resources.requests.memory`      | `1Gi`                            | ..                                                    |
| `config.varnish.memory`          | `1G`                             | ..                                                    |
| `config.varnish.backend.address` | `backend.example.com`            | ..                                                    |
| `config.varnish.backend.port`    | `80`                             | ..                                                    |
| `config.varnish.config_file`     | `/etc/varnish/default.vcl`       | ..                                                    |
| `config.varnish.gomplate.file`   | `/var/varnish/default.vcl.gotpl` | ..                                                    |
| `config.varnish.dns.refresh`     | `true`                           | ..                                                    |
| `gomplateFile.default.vcl.gotpl` | .. some VCL                      | ..                                                    |
