# broker-service.dockerfile

# Use the 'broker-base' image to copy the already built brokerApp binary
FROM broker-base AS runtime

# Create directory for the app in the final image
RUN mkdir /app

# Copy the brokerApp binary from the builder image to the runtime image
COPY --from=builder /app/brokerApp /app/

# Set the command to run the brokerApp binary
CMD ["/app/brokerApp"]