FROM golang:1.19-alpine3.18
WORKDIR /app 
COPY go.mod go.sum ./
RUN go mod download
RUN apk add --update --no-cache bash git openssh
RUN go install github.com/cosmtrek/air@latest
COPY . .
RUN go build -o main . 
EXPOSE 8000
CMD ["air","./app/main.go","-b","0.0.0.0"]