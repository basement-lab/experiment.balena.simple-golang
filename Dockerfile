FROM balenalib/%%BALENA_MACHINE_NAME%%-golang:latest-build AS build

WORKDIR /go/src/github.com/balena-io-projects/app

COPY /app ./

RUN go build

FROM balenalib/%%BALENA_MACHINE_NAME%%-debian:stretch

COPY --from=build /go/src/github.com/balena-io-projects/app/ .

CMD ./app
