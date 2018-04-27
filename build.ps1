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
docker build -t traefik.win -f win.Dockerfile .
$IMAGE = "${env:DOCKER_USERNAME}/${env:DOCKER_IMAGE}"
docker tag traefik.win $IMAGE
