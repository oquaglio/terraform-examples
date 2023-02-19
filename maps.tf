locals {

  example_map = tomap({
    a = "b"
    c = "d"
  })

}


# outputs
output "example_map" {
  value       = local.example_map
  description = "A map"
}


output "example_map_for_output" {
  value = {
    for example_map_key, example_map_value in local.example_map :
    example_map_key => example_map_value
  }
}