Install-Module -Name SMLets

Import-Module SMLets -Force

#Need to enter the id of the incident
$WorkItemID = "XXXXXXX" 
 
$WorkItemClass = (Get-SCSMClass -Name System.WorkItem.incident$)  
$WorkItemObject = Get-SCSMObject -Class $WorkItemClass -Filter "Id -eq $WorkItemID "  

#Get the History  
$History = Get-SCSMObjectHistory -Object $WorkItemObject
 
$history  | select -ExpandProperty history  
 

<#
If you want to fetch history of service request, use below line
$WorkItemClass = (Get-SCSMClass -Name System.WorkItem.servicerequest$)  

#>