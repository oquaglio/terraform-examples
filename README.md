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

### Maps

> local.example_map.a

> { for key, val in local.example_map : key => val }

> local.tables

> local.tables.TABLE_1.cols