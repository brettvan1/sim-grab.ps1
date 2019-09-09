
#=====================================================================
# 
#
# Script:      sim-grab.ps1
#
# Author:      Brett van Gennip
# Date:        September 7 2018
#
# Description: Grabs the sim of a DELL Laptop
#
# Disclaimer:     Use at own risk.  Not responsible for any damages.
#
#======================================================================

# Function to Grep the line containing the info
Function grabsim{
Foreach($entry in $get_iccid){
      If($entry.Contains($args[0])){return $entry}
}
}

#Runs command on client machine to get SIM info
$get_iccid=$(netsh mbn show readyinfo int=*)

#Fetches the State of the SIM card status
$state=grabsim "State"
$state=$state.split(":")
$state=$state[1].Trim()

#If it has any other message other than 'SIM not inserted' then it will grab the sim number
if($state -notlike "SIM not inserted"){
      $SIM=grabsim "SIM ICC Id"
      $SIM=$SIM.split(":")
      $SIM=$SIM[1].Trim()
      }
$SIM | clip
