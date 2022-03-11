FROM golang:1.10-alpine


ADD . /go/src/github.com/divija-swetha/Blockchain-in-Golang-using-Docker
WORKDIR /go/src/github.com/divija-swetha/Blockchain-in-Golang-using-Docker
RUN go install github.com/divija-swetha/Blockchain-in-Golang-using-Docker


# Launch a server instance
ENTRYPOINT /go/bin/Blockchain-in-Golang-using-Docker


EXPOSE 5000
