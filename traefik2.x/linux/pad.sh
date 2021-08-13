# Linux
sfctl cluster select --endpoint http://localhost:19080 #--pem /path/to/my/pem/cert.pem --no-verify

sfctl application delete --application-id traefik --force-remove FORCE_REMOVE
sfctl application unprovision --application-type-name TraefikType --application-type-version 1.0.0

sfctl application upload --path ./traefik #--show-progress
sfctl application provision --application-type-build-path traefik
sfctl application create --app-name fabric:/traefik --app-type TraefikType --app-version 1.0.0


# Sample pinger app for validating (navidate to /pinger/PingerService/id)
sfctl application delete --application-id pinger --force-remove FORCE_REMOVE
sfctl application unprovision --application-type-name PingerApplicationType --application-type-version 1.0

sfctl application upload --path ./pinger-traefik #--show-progress
sfctl application provision --application-type-build-path pinger.windows-traefik
sfctl application create --app-name fabric:/pinger --app-type PingerApplicationType --app-version 1.0

