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
    State file - State File name
    .NOTES
    Written by Ahmed Elsayed
    @ahmedig
    https://www.linkedin.com/in/ahmedig/
    #>
param(
    [parameter(Mandatory = $true)]
    [string]$azure_credentials,
    [parameter(Mandatory = $true)]
    [string]$storage_account_name,
    [parameter(Mandatory = $true)]
    [string]$container_name,
    [parameter(Mandatory = $true)]
    [string]$resource_group_name,
    [parameter(Mandatory = $true)]
    [string]$file_name,
)

$azure_creds = $azure_credentials | ConvertFrom-Json
Write-Host "Running terraform Init using client id: $($azure_creds.clientId)"
terraform init -reconfigure -input=false -backend-config=storage_account_name=$storage_account_name -backend-config=container_name=$container_name -backend-config=key=$file_name -backend-config=resource_group_name=$resource_group_name -backend-config=subscription_id=$azure_creds.subscriptionId -backend-config=tenant_id=$azure_creds.tenantId -backend-config=client_id=$azure_creds.clientId -backend-config=client_secret=$azure_creds.clientSecret

# Return password to workflow
# echo "::set-output name=password::$GeneratedPassword"