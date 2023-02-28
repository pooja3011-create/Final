# Use official Node.js image
FROM node:10-alpine

LABEL maintainer="Pooja Patel <pooja.php30@gmail.com>"

# Copy the PowerShell script to the container
COPY Fibonacci.ps1 /app/

# Define working directory
WORKDIR /app

# Define an environment variable for the Fibonacci number
ENV FIBO_NUMBER

# Run the PowerShell script
CMD ["pwsh", "-Command", "./Fibonacci.ps1 $env:FIBO_NUMBER"]
