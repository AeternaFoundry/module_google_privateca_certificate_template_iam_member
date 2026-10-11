variable "privateca_certificate_template_iam_members" {
  description = <<EOT
Map of privateca_certificate_template_iam_members, attributes below
Required:
    - certificate_template
    - member
    - role
Optional:
    - location
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    certificate_template = string
    member               = string
    role                 = string
    location             = optional(string)
    project              = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

