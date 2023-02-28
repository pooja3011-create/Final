# Set the constant value for the Fibonacci number
$FIBO_NUMBER = 20

# Set the Docker image tag and container name
$DOCKER_IMAGE_TAG = "dockerhelperimage"
$CONTAINER_NAME = "dockerhelpercontainer"

# Define a function to run the Docker container
function Get-ContainerRun {
    param (
        [Parameter(Mandatory)]
        [int] $FIBO_NUMBER
    )

    Write-Host "Fibonacci Number: $FIBO_NUMBER"

    # Build the Docker run command
    $dockerRunCommand = "docker run -it --hostname $env:COMPUTERNAME --name $CONTAINER_NAME $DOCKER_IMAGE_TAG"
    if ($FIBO_NUMBER) {
        $dockerRunCommand += " -e FIBO_NUMBER=$FIBO_NUMBER"
    }

    # Run the Docker container
    $containerID = Invoke-Expression $dockerRunCommand

    Write-Host "Container ID: $containerID"

    # Show the status of all Docker containers
    docker ps -a
}

# Call the function to run the Docker container
Get-ContainerRun -FIBO_NUMBER $FIBO_NUMBER

