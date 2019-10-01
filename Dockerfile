FROM balenalib/raspberrypi3-golang:latest-build AS build

WORKDIR /go/src/github.com/balena-io-projects/app

COPY /app ./

RUN go build

FROM balenalib/raspberrypi3-debian:stretch

COPY --from=build /go/src/github.com/balena-io-projects/app/ .

CMD ./app
