#
# DockerHelper Dockerfile
#
# Pull base image
FROM stefanscherer/node-windows:10-windowsservercore 
LABEL maintainer="Pooja Patel <pooja.php30@gmail.com>" 
# copy directories from local to $ComputerName local $Destination directory
COPY Fibonacci.ps1 c:/data/
# Define mountable directories
VOLUME [ "c:/data" ]
# Define working directory
WORKDIR c:/data/
# Run the PowerShell commands
SHELL ["pwsh", "-Command"]
# set the $env in the powershell script
CMD .\Fibonacci.ps1 "$env:FIBO_NUMBER"
