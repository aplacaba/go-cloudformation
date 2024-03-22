        # syntax=docker/dockerfile:1

FROM golang:1.22.1-alpine3.19

WORKDIR /app

COPY go.mod go.sum .
RUN go mod download

COPY *.go .

# Build
RUN CGO_ENABLED=0 GOOS=linux go build -o /hello

EXPOSE 80

CMD /hello
