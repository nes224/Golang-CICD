FROM golang:1.19-alpine3.18
WORKDIR /app 
COPY go.mod go.sum ./
RUN go mod download
RUN go install github.com/cosmtrek/air@latest
COPY . .
RUN go build -o main . 
EXPOSE 8000