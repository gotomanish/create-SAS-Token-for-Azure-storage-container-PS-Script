
param( [Parameter(Mandatory=$true, HelpMessage="Storage Account Name")]
[String] $storage_account_name, 
[Parameter(Mandatory=$true, HelpMessage="Any one of the two shared access keys", ParameterSetName="SharedKey", Position=1)]
[String] $storage_shared_key, 
[Parameter(Mandatory=$true, HelpMessage="Enter one or more of the following: racwdlup.",  Position=2)]
[String] $permissions,
[Parameter(Mandatory=$true, HelpMessage="Enter Your container name where blob exists.", Position=3)]
[String] $contianer_name,
[Parameter(Mandatory=$true, HelpMessage="Enter the complete URI for blob.", Position=4)]
[String] $BlobFullURI  
)
$CurrentDate = Get-Date
$ExpiryDate = $CurrentDate.AddDays(7)
$Ctx = New-AzStorageContext -StorageAccountName $storage_account_name -StorageAccountKey $storage_shared_key
$SASToken = New-AzStorageContainerSASToken -Context $Ctx -Permission $permissions -Name $contianer_name -ExpiryTime $ExpiryDate 
$SASURLForBlob = $BlobFullURI + $SASToken
Write-Host "SAS URL for blob level"
$SASURLForBlob
