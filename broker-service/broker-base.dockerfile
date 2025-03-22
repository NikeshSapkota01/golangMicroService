# broker-base.dockerfile

# Use Go 1.23 alpine image as the base image for building
FROM golang:1.23-alpine AS builder

# Create directory for the app inside the container
RUN mkdir /app

# Copy everything into the container
COPY . /app

# Set the working directory
WORKDIR /app

# Build the Go application binary named 'brokerApp'
RUN CGO_ENABLED=0 go build -o brokerApp ./cmd/api

# Make the binary executable
RUN chmod +x /app/brokerApp