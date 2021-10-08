# Terraform Azurerm backend

This action runs terraform init against an Azurerm backend configuration.

What it expects:

## example usage

```yml
     - uses: actions/checkout@v2
     - id: generatedpassword
       uses: Ba4bes/Password-Generator@v0.1
     - run: echo "${{ steps.generatedpassword.outputs.password }}"
       shell: bash
```

# Inspired by: https://github.com/Ba4bes/Password-Generator/blob/main/New-Password.ps1
