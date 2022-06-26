# Build the manager binary
FROM golang:1.13 as builder

WORKDIR /workspace
ENV GOPROXY="http://172.26.1.9:5000"
ENV GOSUMDB="off"
ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GO111MODULE=on
# Copy the Go Modules manifests
COPY go.mod go.mod
COPY go.sum go.sum
# Copy the go source
COPY main.go main.go
COPY templates.go templates.go

# Build
RUN go build -a -o  dex-login dex-login

# Use distroless as minimal base image to package the manager binary
# Refer to https://github.com/GoogleContainerTools/distroless for more details
FROM alpine:3.12
WORKDIR /
COPY --from=builder /workspace/dex-login .
EXPOSE 5555
ENTRYPOINT ["/dex-login"]
