# Traefik 2.x samples
Contains SF application templates to deploy a Traefik 2.x proxy with support for the service fabric Pilot based plugin.

Before deploying the templates, please replace the Pilot token with your token in the traefik.yaml Code package directory (xxx/pinger-traefik/PingerService/Code):

```yaml
...
pilot:
    token: "add-your-own-traefik-pilot-token"
experimental:
    plugins:
        traefikServiceFabricPlugin:
            moduleName: "github.com/dariopb/traefikServiceFabricPlugin"
            version: "v0.2.1"

providers:
  plugin:
    traefikServiceFabricPlugin:
      pollInterval: 4s
      clusterManagementURL: http://dariotraefik1.southcentralus.cloudapp.azure.com:19080/
      #certificate : ./cert.pem
      #certificateKey: ./cert.key
```

Also, for secure clusters, a good certificate able to access SF at least RO should be added in the service Code location.

These are templates and sample applications that are useful to ***me*** for quick deployment and testing. They might not fit exactly your use case!
