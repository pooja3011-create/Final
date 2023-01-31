Set-Variable -Name FIBO_NUMBER -Option Constant -Value 20
$DockerHelperImageTag = "dockerhelperimage"
$ComputerName = $env:computername
$ContainerName = "dockerhelpercontainer"

Function Get-ContainerRun {
    param(
        [Parameter(Mandatory)]
        [INT] $FIBO_NUMBER
    )
    Write-Host "Fibonacci Number: $FIBO_NUMBER"
    if ($FIBO_NUMBER) {
        $containerID = docker run -it -e FIBO_NUMBER=$FIBO_NUMBER --hostname $ComputerName --name $ContainerName $DockerHelperImageTag
    } else {
        $containerID = docker run -it --hostname $ComputerName --name $ContainerName $DockerHelperImageTag
    }
    Write-Host "Container ID: $containerID"
    docker ps -a
}

Get-ContainerRun -FIBO_NUMBER $FIBO_NUMBER
