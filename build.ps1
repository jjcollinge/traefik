cd c:\gopath\src\github.com\containous\traefik\

# Get go-bindata. Please note, the ellipses are required
go get github.com/containous/go-bindata/...

# Start build

# generate
# (required to merge non-code components into the final binary, such as the web dashboard and provider's Go templates)
go generate

# Standard go build
go build ./cmd/traefik
# run other commands like tests

# Build the Windows container
docker build -t traefik.win -f win.Dockerfile

# Push the Windows container
docker login -u $env:DOCKER_USERNAME -p $env:DOCKER_PASSWORD $env:DOCKER_REGISTRY
docker push traefik.win:$env:APPVEYOR_BUILD_ID
