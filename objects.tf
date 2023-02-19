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
      a_string  = "example",
      a_number  = 1,
      a_boolean = true,
      a_map = {
        type1 = 1,
        type2 = 2,
        type3 = 3
      },
      a_set = ["value1", "value2"]

    }
  }

}

output "my_object_output" {

  value = local.my_object
}