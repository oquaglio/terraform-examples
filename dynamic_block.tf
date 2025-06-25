variable "items" {
  type = list(object({
    name    = string
    enabled = bool
    weight  = number
  }))

  default = [
    {
      name    = "alpha"
      enabled = true
      weight  = 10
    },
    {
      name    = "beta"
      enabled = false
      weight  = 20
    }
  ]
}

# resource "example_resource" "demo" {
#   name = "demo-resource"

#   dynamic "item" {
#     for_each = var.items
#     content {
#       name    = item.value.name
#       enabled = item.value.enabled
#       weight  = item.value.weight
#     }
#   }
# }

resource "null_resource" "demo" {
  count = length(var.items)

  triggers = {
    name    = var.items[count.index].name
    enabled = tostring(var.items[count.index].enabled)
    weight  = tostring(var.items[count.index].weight)
  }
}

output "simulated_dynamic_blocks" {
  value = [
    for r in null_resource.demo : r.triggers
  ]
}

output "some_output" {
  value = [
    for item in var.items : {
      name    = item.name
      enabled = item.enabled
      weight  = item.weight
    }
  ]
}
