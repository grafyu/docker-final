FROM golang:1.22
WORKDIR /app
COPY *.go ./
COPY *.db ./
COPY go.mod go.sum ./
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /tracker
CMD ["/tracker"]