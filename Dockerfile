FROM golang:alpine
RUN apk add git ca-certificates --update


ADD . /go/src/github.com/AgoraIO-Community/agora-cloud-recording


ARG SERVER_PORT
ENV SERVER_PORT $SERVER_PORT

# move to the working directory
WORKDIR $GOPATH/src/github.com/AgoraIO-Community/agora-cloud-recording
# Build the token server command inside the container.
RUN go build -o agora-cloud-recording -v main.go
# RUN go run main.go
# Run the token server by default when the container starts.
ENTRYPOINT ./agora-cloud-recording

EXPOSE 9000                                          
