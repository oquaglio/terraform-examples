# terraform-constructs

Playpen for Terraform lanuage constructs.

## Init

Run the terraform init command with the -chdir flag, specifying the path to the directory where your modules are located:
```
terraform init -chdir=../modules
```

## Console Commands

> local.my_object

> data.external.my_json_parser

> data.external.my_json_parser.result["name"]