# escape=`

FROM microsoft/windowsservercore

WORKDIR C:\traefik

COPY traefik.exe .

# 'clustermanagementurl' must point to your cluster's public IP
# or an SF endpoint that is accessible from inside the container.
COPY traefik.toml .

# expose Traefik and it's dashboard.
EXPOSE 80
EXPOSE 8080

# to persist files, configure volumes.
ENTRYPOINT ["traefik.exe", "--configfile=traefik.toml"]