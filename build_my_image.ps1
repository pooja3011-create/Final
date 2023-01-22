#$HOMEDRIVE = "C:\"
#$HOMEPATH = "Users\" + $env:username

#Docker image name
$DockerHelperImageTag = "dockerhelperimage"
#name of a computer, where Docker is installed
$ComputerName = $env:computername
Function Get-BuildImage {
    
    docker images

    code .\Dockerfile

    docker build -t $DockerHelperImageTag .

    docker images
}
Get-BuildImage
#Run-DockerContainer 
.\run_my_container.ps1