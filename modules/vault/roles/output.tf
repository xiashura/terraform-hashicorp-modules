output "groups" {
  value = {
    for key, value in var.groups :
    key => {
      name = value.name
      politicians = [
        for keyPolicy, valuePolicy in var.politicians :
        keyPolicy
        if length(valuePolicy.groups) > 0 &&
        contains(valuePolicy.groups, key)
      ]
    }
  }
}
