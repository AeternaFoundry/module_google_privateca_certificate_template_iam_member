resource "google_privateca_certificate_template_iam_member" "privateca_certificate_template_iam_members" {
  for_each = var.privateca_certificate_template_iam_members

  certificate_template = each.value.certificate_template
  member               = each.value.member
  role                 = each.value.role
  location             = each.value.location
  project              = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

