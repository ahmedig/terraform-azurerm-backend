# Terraform Azurerm backend

This action runs terraform init against an Azurerm backend configuration using an SPN.

It runs exactly the same way as the Azure DevOps Terraform task:
https://marketplace.visualstudio.com/items?itemName=ms-devlabs.custom-terraform-tasks

## Example usage

bare minimum example
```yml
- name: Terraform init azurerm backend
  uses: ahmedig/terraform-azurerm-backend@v1
  with:
    azure_credentials: {{ secrets.AZURE_CREDENTIALS }}
    resource_group_name: myresourcegroup
    container_name: mycontainer
    storage_account_name: storageaccount432
```
Full example
```yml
- name: Terraform init azurerm backend
  uses: ahmedig/terraform-azurerm-backend@v1
  with:
    azure_credentials: {{ secrets.AZURE_CREDENTIALS }}
    resource_group_name: myresourcegroup
    container_name: mycontainer
    storage_account_name: storageaccount432
    file_name: terraform.tftstate
    subscription_id: xxxxx-xxxxxx-xxxxxx-xxxxxx
    tf_working_directory: tfdirectory
```
## Parameters
| Parameter | Optional? | Default Value | Description |
| :--- | :---: | :---: | :--- |
| azure_credentials | [ ] | nil | SPN generated credentials in JSON format |
| resource_group_name | [ ] | nil | Resource group name that holds the storage account where the state file is saved |
| storage_account_name | [ ] | nil | The storage account that the state file will be saved in |
| container_name | [ ] | nil | container name in the storage account |
| file_name | [x] | `terraform.tfstate` | the state file name |
| subscription_id | [x] | default subscription in Azure_credentials. You only need to set this if your SPN has got access to multiple subscriptions | the subscription id where the resource group is located |
| tf_working_directory | [x] | root repo folder | the folder in the repo that has the terraform scripts |


## What it expects:
This action doesnt rely on any other actions.
The only thing it needs is an SPN, and to be saved as a secret.

### Creating an SPN credential
Since the action needs an SPN credential to run, and to make it simple enough, it can leverage the same `AZURE_CREDENTIALS` secret that you need to set up anyway for any Azure action.

To use any credentials like Azure Service Principal,add them as secrets in the GitHub repository and then use them in the workflow.

Follow the steps to configure the secret:

Define a new secret under your repository settings, Add secret menu
Store the output of the below az cli command as the value of secret variable 'AZURE_CREDENTIALS'

```
az ad sp create-for-rbac --name "myApp" --role contributor \
                        --scopes /subscriptions/{subscription-id}/resourceGroups/{resource-group} \
                        --sdk-auth
                        
# Replace {subscription-id}, {resource-group} with the subscription, resource group details

# The command should output a JSON object similar to this:

{
  "clientId": "<GUID>",
  "clientSecret": "<GUID>",
  "subscriptionId": "<GUID>",
  "tenantId": "<GUID>",
  (...)
}
```
  
Now in the workflow file in your branch, replace the secret in the action with your secret.

