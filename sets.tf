locals {

  empty_set = toset([])

  example_set = toset(["value1", "value2", "value3"])

  example_set_as_objects = [
    for sne in local.example_set : {
      name = sne
    }
  ]

}


output "example_set_output" {
  value = local.example_set
}

output "example_set_output_using_for" {
  value = toset([
    for blah in local.example_set : blah
  ])
}

output "example_set_as_objects_output" {
  value = toset([
    for goo in local.example_set_as_objects : goo.name
  ])
}

output "example_set_astericks_output" {
  value = local.example_set.*
}



# output "example_set_for_each_output" {
#   for_each = local.example_set
#     value = each.value

# }
