[Project under construction]

# PowerShell 'DockerHelper' module to run a Fibonacci container
**1. This module run a Fibonacci container**
    
    a. If no parameter passed to the container, it outputs Fibonacci numbers one by one every 0.5 second.
    b. If number n is passed to the container, it outputs Fibonacci sequance till index n. 
    c. If negative number is passed, it responds with an error.

**2. It is written with the Powershell**

**3. instructions are included to build and deploy the software**

**4. To deploy,**

    > git clone https://github.com/pooja3011-create/fibonacci-docker-helper
    > fibonacci-docker-helper
    > Run in Powershell: .\build_my_image.ps1  
    to build Dockerimage and to call run_my_container.ps1 
    
    
You should see something like this in the output (if no parameter passed):

    index 0 of the Fibonacci sequence: 0
    index 1 of the Fibonacci sequence: 1
    index 2 of the Fibonacci sequence: 1
    index 3 of the Fibonacci sequence: 2
    index 4 of the Fibonacci sequence: 3
    index 4 of the Fibonacci sequence: 5
    index 4 of the Fibonacci sequence: 8
    .
    .
    .

You should see something like this if Fibonacci number "5" is passed
    
    index 0 of the Fibonacci sequence: 0
    index 1 of the Fibonacci sequence: 1
    index 2 of the Fibonacci sequence: 1
    index 3 of the Fibonacci sequence: 2
    index 4 of the Fibonacci sequence: 3
    
   
**Current open issues**

- All Files including Dockerfile in One Folder. Ideally, main Folder containing Dockerfile and Subfolder(containing all PS scripts)
- While running container, "The virtual machine or container exited unexpectedly. (0xc0370106)." error appears. 
- Function "If $ComputerName is omitted cmdlet is executed locally." is not complete. 
- Creating volume not tested due to container execution error. 
