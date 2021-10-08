# Terraform Azurerm backend

This action runs terraform init against an Azurerm backend configuration.

## What it expects:

## example usage

```yml
    - name: Terraform init azurerm backend
      uses: ahmedig/terraform-azurerm-backend@action-publish
      with:
        azure_credentials: {{ secrets.AZURE_CREDENTIALS }}
        resource_group_name: myresourcegroup
        container_name: mycontainer
        storage_account_name: storageaccount432
        file_name: terraform.tftstate
```