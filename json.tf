# Options for parsing JSON

# Using the jsondecode() function:
# Terraform has a built-in jsondecode() function that can be used to parse JSON strings. Here's an example:
# In this example, we define a local variable called my_json that contains a JSON string.
# We then use the jsondecode() function to parse the JSON string and assign it to a local variable called parsed_json.
# We can then access the values in the JSON object using Terraform's built-in map syntax, like local.parsed_json["name"].
locals {
  my_json     = <<EOF
  {
    "name": "John Smith",
    "age": 35,
    "city": "New York"
  }
  EOF
  parsed_json = jsondecode(local.my_json)

}

output "name_using_jsonencode" {
  value = local.parsed_json["name"]
}

output "age_using_jsonencode" {
  value = local.parsed_json["age"]
}

output "city_using_jsonencode" {
  value = local.parsed_json["city"]
}


# Using the external data source:
# Terraform also has an external data source that can be used to execute external scripts and programs, including scripts that can parse JSON.
# Here's an example:
# In this example, we define an external data source that runs a Python script called parse_json.py.
# The script takes a JSON string as input and outputs the parsed JSON as a map.
# We can then access the values in the JSON object using Terraform's built-in map syntax, like data.external.my_json_parser.result["name"].
# NOTE: I got an error when using JSON with differnt types for keys: https://github.com/hashicorp/terraform/issues/12256
locals {
  my_json_2 = <<EOF
  {
    "name": "John Smith",
    "city": "New York"
  }
  EOF
}


data "external" "my_json_parser" {
  program = ["python3", "${path.module}/modules/parse_json.py", local.my_json_2]
}

output "name_using_python" {
  value = data.external.my_json_parser.result["name"]
}

# output "age_using_python" {
#   value = data.external.my_json_parser.result["age"]
# }

output "city_using_python" {
  value = data.external.my_json_parser.result["city"]
}
