<#
    .SYNOPSIS
    This script generates a password
    .DESCRIPTION
    Runs Terraform init using the azurerm backend configuration, and saves the state file in an Azure storage account
    .PARAMETER azure_credentials
    Azure_Credentials in JSON format
    https://github.com/marketplace/actions/azure-cli-action#configure-azure-credentials-as-github-secret
    .PARAMETER storage_account_name
    State file - Storage Account Name
    .PARAMETER container_name
    State file - Container Name
    .PARAMETER resource_group_name
    State file - Resource Group Name
    .PARAMETER file_name
    State file - State File name (optional)
    .PARAMETER directory
    Terraform working directory
    .PARAMETER subscription_id
    Subscription Id (optional)
    .NOTES
    Written by Ahmed Elsayed
    @ahmedig
    https://www.linkedin.com/in/ahmedig/
    #>
param(
    [parameter(Mandatory = $true)]
    $azure_credentials,
    [parameter(Mandatory = $true)]
    [string]$storage_account_name,
    [parameter(Mandatory = $true)]
    [string]$container_name,
    [parameter(Mandatory = $true)]
    [string]$resource_group_name,
    [parameter(Mandatory = $true)]
    [string]$file_name,
    [parameter(Mandatory = $true)]
    [string]$directory,
    [parameter(Mandatory = $true)]
    [string]$subscription_id
)

function Set-TFCreds() {
    $azure_creds = $azure_credentials | ConvertFrom-Json

    $env:ARM_CLIENT_ID = $azure_creds.clientId
    $env:ARM_CLIENT_SECRET = $azure_creds.clientSecret
    $env:ARM_TENANT_ID = $azure_creds.tenantId
    
    echo "ARM_CLIENT_ID=$env:ARM_CLIENT_ID" | Out-File -FilePath $Env:GITHUB_ENV -Encoding utf8 -Append
    echo "ARM_CLIENT_SECRET=$env:ARM_CLIENT_SECRET" | Out-File -FilePath $Env:GITHUB_ENV -Encoding utf8 -Append
    echo "ARM_TENANT_ID=$env:ARM_TENANT_ID" | Out-File -FilePath $Env:GITHUB_ENV -Encoding utf8 -Append
        
    if($subscription_id -eq 'empty')
    {
        $env:ARM_SUBSCRIPTION_ID = $azure_creds.subscriptionId
    }
    else {
        $env:ARM_SUBSCRIPTION_ID = $subscription_id
        
    }
    echo "ARM_SUBSCRIPTION_ID=$env:ARM_SUBSCRIPTION_ID" | Out-File -FilePath $Env:GITHUB_ENV -Encoding utf8 -Append
}

function Run-TFInit() {
    terraform version
    terraform init -reconfigure -input=false -backend-config="storage_account_name=$storage_account_name" -backend-config="container_name=$container_name" -backend-config="key=$file_name" -backend-config="resource_group_name=$resource_group_name"
}

function Show-Logs() {
    Write-Host "Storage account name: $storage_account_name"
    Write-Host "Container name: $container_name"
    Write-Host "Resource group name: $resource_group_name"
    Write-Host "file name: $file_name"
}

Write-Host "starting action"



pushd $directory
Get-Location

Show-Logs
Set-TFCreds
Run-TFInit

# Return password to workflow
# echo "::set-output name=password::$GeneratedPassword"
popd
