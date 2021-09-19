Connect-ServiceFabricCluster

# Register and run the Traefik Application
Remove-ServiceFabricApplication -ApplicationName fabric:/traefik -Force
Unregister-ServiceFabricApplicationType -ApplicationTypeName TraefikType -ApplicationTypeVersion 1.0.0 -Force

Copy-ServiceFabricApplicationPackage -ApplicationPackagePath .\traefik\ # -ApplicationPackagePathInImageStore traefik
Register-ServiceFabricApplicationType -ApplicationPathInImageStore traefik
New-ServiceFabricApplication -ApplicationName fabric:/traefik -ApplicationTypeName TraefikType -ApplicationTypeVersion 1.0.0


# Sample pinger app for validating (navidate to /pinger7000/PingerService/id)
for ($i=7000; $i -le 7003; $i++) {
    Remove-ServiceFabricApplication -ApplicationName fabric:/pinger$i -Force
}
Unregister-ServiceFabricApplicationType -ApplicationTypeName PingerApplicationType -ApplicationTypeVersion 1.0 -Force

Copy-ServiceFabricApplicationPackage -ApplicationPackagePath .\pinger-traefik\ #-ApplicationPackagePathInImageStore pinger
Register-ServiceFabricApplicationType -ApplicationPathInImageStore pinger-traefik

for ($i=7000; $i -le 7003; $i++) {
    New-ServiceFabricApplication -ApplicationName fabric:/pinger$i -ApplicationTypeName PingerApplicationType -ApplicationTypeVersion 1.0 -ApplicationParameter @{Pinger_Port="$i"}
}
