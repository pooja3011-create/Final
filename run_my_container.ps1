Set-Variable FIBO_NUMBER -Option Constant -Force -Value "FIBO_NUMBER"
$DockerHelperImageTag = "dockerhelperimage"
$ComputerName = $env:computername
$ContainerName = "dockerhelpercontainer"
Write-Host $DockerHelperImageTag
Function Get-ContainerRun {
    param(
        [Parameter(Mandatory)]
        [INT] $FIBO_NUMBER
    )
    Write-Host $FIBO_NUMBER
    docker images
    if($FIBO_NUMBER) {
        $containerID = docker run -it -e FIBO_NUMBER=$FIBO_NUMBER --hostname $ComputerName --name $containerName $DockerHelperImageTag
    } else {
        $containerID = docker run -it --hostname $ComputerName --name $containerName $DockerHelperImageTag
    }
    $containerID
    docker ps -a
}
Get-ContainerRun