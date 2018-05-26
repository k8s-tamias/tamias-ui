FROM golang

# Fetch dependencies
RUN go get github.com/tools/godep

# Add project directory to Docker image.
ADD . /go/src/github.com/k8s-tamias/tamias-ui

ENV USER sage
ENV HTTP_ADDR :8888
ENV HTTP_DRAIN_INTERVAL 1s
ENV COOKIE_SECRET 7yo-4FAauTtRLZ2p

# Replace this with actual PostgreSQL DSN.
ENV DSN postgres://sage@localhost:5432/tamias-ui?sslmode=disable&password=secret_pass

WORKDIR /go/src/github.com/k8s-tamias/tamias-ui

RUN godep go build

EXPOSE 8888
CMD ./tamias-ui