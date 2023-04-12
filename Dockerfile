# FOR GAE Flexible Environment Custom Runtime 
FROM golang:1.17 AS BUILD

WORKDIR /usr/src/myapp
# Copy the code into the container\
COPY . .

# Copy and download dependency using go mod
RUN go mod download

# # Build the application
RUN go build -o myapp .



FROM golang:1.17
# Export necessary port # default GCP App Engine Port
WORKDIR /usr/myapp
COPY --from=BUILD usr/src/myapp/myapp  usr/myapp
EXPOSE 8080

# Command to run when starting the container
CMD ["./usr/myapp"]

