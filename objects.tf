locals {

  my_object = {
    a_string  = "example",
    a_number  = 1,
    a_boolean = true,
    a_map = {
      type1 = 1,
      type2 = 2,
      type3 = 3
    },
    a_set = ["value1", "value2"]
    a_sub_object = {
      a_string  = "example2",
      a_number  = 2,
      a_boolean = false,
      a_map = {
        type1 = "asc",
        type2 = "asd",
        type3 = "adasd"
      },
      a_set = [1, 2]
    }
  }

  my_objs = [
    { val = 2 },
    { val = 3 }
  ]

}

output "my_object_output" {

  value = local.my_object
}


output "my_objs_val_output" {
  value = local.my_objs[*].val
}

output "my_objs_val_output_2" {
  value = toset([
    for goo in local.my_objs : goo.val
  ])
}


output "my_object_a_string_output" {
  value = {
    for instance_key, instance_value in local.my_object :
    instance_key => instance_value
  }
}

# output "my_object_a_string_output_2" {
#   value = {
#     for instance_key, instance_value in local.my_object :
#     instance_key => instance_value.a_string
#   }
# }