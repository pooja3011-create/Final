# used for unassigned items
Set-Variable NOT_ASSIGNED -Option Constant -Force -Value -1

function Fibonacci_Core() {    
    Param ([int] $old, $current, $new)
    # Hashtable stores key/value pairs in a hashtable
    [hashtable] $FiboDict = @{}
    $new = $old + $current
    $old = $current
    $current = $new

    $FiboDict = @{old=$old; current=$current; new=$new}
    return $FiboDict
}
# ===
# Main function
# ===
function Fibonacci_Loop 
{    
    Param
    (
        [Parameter(Mandatory=$false, Position=0)]
        [Int]$index=$NOT_ASSIGNED,
        [Parameter(Mandatory=$false, Position=1)]
        [Int]$fibo_old=$NOT_ASSIGNED,
        # [switch]$Param3
        [Parameter(Mandatory=$false, Position=2)]
        [Int]$fibo_current=$NOT_ASSIGNED
    )

    # Case 1: Fibonacci number is provided
    if ( ($index -ne $NOT_ASSIGNED) -and ($fibo_old -eq $NOT_ASSIGNED) -and ($fibo_current -eq $NOT_ASSIGNED) ) {
        # first 2 elements of Fibonacci sequence
        $fibo_old = 0
        $fibo_current = 1
        $fibo_new = 0
        if($index -eq 0) {
            Write-Host "index $index of the Fibonacci sequence: $fibo_old" -ForegroundColor Green
        } elseif($index -eq 1) {
            Write-Host "index $index of the Fibonacci sequence: $fibo_current" -ForegroundColor Green
        }
        else {
            for ($counter=0; $counter -lt $index; $counter++) {
                $FiboDict = Fibonacci_Core $fibo_old   $fibo_current  $fibo_new          
                #-ForegroundColor parameter used to output green text 
                Write-Host "index $counter of the Fibonacci sequence: $fibo_old" -ForegroundColor Green
                # extract scalars from the hashtable 
                $fibo_old = $FiboDict.old
                $fibo_current = $FiboDict.current
                $fibo_new = $FiboDict.new
            }
        }
    }
    
    # Case 2:  No parameters passed. First 2 Fibonacci elements are given . 
    elseif ( ($index -eq $NOT_ASSIGNED) -and ($fibo_old -ne $NOT_ASSIGNED) -and (($fibo_current -ne $NOT_ASSIGNED)) ) {
        # Infinite loop - escape with CTRL-C
        $counter = 0
        while ($true) {
            $FiboDict = Fibonacci_Core $fibo_old   $fibo_current  
            Write-Host "index $counter of the Fibonacci sequence: $fibo_old"  -ForegroundColor Green
            # extract scalars from the hashtable
            $fibo_old = $FiboDict.old
            $fibo_current = $FiboDict.current
            $fibo_new = $FiboDict.new
            #Fibonacci numbers output at 500ms intervals.
            Start-Sleep -Milliseconds 500
            $counter++
        }        
    }
    else {
        Write-Host "!!!!!! WRONG: $index, $fibo_old, $fibo_current"        
        Write-Host "ERROR:" -ForegroundColor Red
        Write-Host "Usage: fibonacci.ps1 [index]" -ForegroundColor Red
    }  
}
# No parameters passed.
if ($($env:FIBO_NUMBER).Count -eq 0) {
    #parameter names with "-fibo_old", "-fibo_current" prefixes 
    Fibonacci_Loop -fibo_old 0 -fibo_current 1
}
# Parameters passed.
elseif ($($env:FIBO_NUMBER).Count -eq 1) {
    Fibonacci_Loop -index $args[0]
}
else {
    # "$MyInvocation.MyCommand.Name" identifies the current command or returns the current script
    $script_name = $MyInvocation.MyCommand.Name
    Write-Host "ERROR:" -ForegroundColor Red
    Write-Host "Usage: $script_name [index]" -ForegroundColor Red
}