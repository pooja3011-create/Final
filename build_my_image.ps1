# Set the Docker image tag and computer name
$DOCKER_IMAGE_TAG = "dockerhelperimage"
$COMPUTER_NAME = $env:COMPUTERNAME

# Define a function to build the Docker image
function Get-BuildImage {
    # Show the list of Docker images
    docker images

    # Open the Dockerfile in Visual Studio Code
    code .\Dockerfile

    # Build the Docker image with the specified tag
    docker build -t $DOCKER_IMAGE_TAG .

    # Show the updated list of Docker images
    docker images
}

# Call the function to build the Docker image
Get-BuildImage

# Call the script to run the Docker container
.\run_my_container.ps1
