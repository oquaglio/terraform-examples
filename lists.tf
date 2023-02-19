locals {

  empty_list = []

  # a list
  example_list = ["value1", "value2", "value3"]



  # concat lists
  #a_list = concat)

  # concat tuples

  #for_each = toset(var.security_groups)

  # a_list_items =  {
  #     for name in local.a_list_set :
  #     name => aws_instance.example[name].id
  # }

  # convert list to map
  list_to_convert_to_map = ["key1", "value1", "key2", "value2", "key3", "value3"]
  #map_converted_from_list  = zipmap(chunklist(local.list_to_convert_to_map, 2))

  # Helper function to chunk a list into pairs
  # This is needed because the zipmap function requires two lists of the same length
  # but our original list has key-value pairs
  # so we need to split it into two lists before passing it to zipmap
  # This function takes a list and returns a list of lists, each containing two elements
  # For example, ["key1", "value1", "key2", "value2"] becomes [["key1", "value1"], ["key2", "value2"]]
  #     chunklist = function(list, size) {
  #         [ for i in range(0, length(list), size) : slice(list, i, i+size) ]
  #   }


}

variable "example_list_set" {
  type    = set(string)
  default = ["web-01", "web-02", "web-03"]
}




output "example_list" {
  value = local.example_list
}

output "example_list_length" {
  value = length(local.example_list)
}
