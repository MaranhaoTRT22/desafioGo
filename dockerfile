FROM golang:1.22.0-alpine3.19 AS builder
RUN go mod init example/hello
COPY ./go /go
RUN go build

FROM busybox:stable-musl
COPY --from=builder /go/hello .
ENTRYPOINT [ "./hello" ]
