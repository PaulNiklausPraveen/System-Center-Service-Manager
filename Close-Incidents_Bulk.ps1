
Install-Module -Name SMLets
Import-Module -Name SMLets

#Get class for workitem incident
$class = get-scsmclass -name system.workitem.incident$
$tickets=Import-CVS C:\Temp\Incidents.csv
$tickets.Count


Foreach($ticket in $tickets){

get-scsmobject -class $class -filter "Id -eq $ticket" | set-scsmobject -property status -value closed
get-scsmobject -class $class -filter "Id -eq $ticket" | select  ID,status

}

<#

Incase if you need to close a service request use below line instead of incident class 

$class = get-scsmclass -name system.workitem.servicerequest$


Incase if you need to close a service request use below line instead of incident class 

$class = get-scsmclass -name system.workitem.changerequest$

#>