locals {
  foundation_outputs = {
  }
  api_zone = {

  }
  environment_labels = {
    date        = formatdate("YYYY-MM-DD", time_static.environment_created_date.rfc3339)
    environment = var.environment
  }
  labels = merge(local.common_labels, local.environment_labels)
}

data "tfe_outputs" "foundation" {
  organization = var.foundation_tfcloud_organization_name
  workspace    = var.foundation_tfcloud_workspace_name
}

data "tfe_outputs" "environments" {
  organization = var.foundation_tfcloud_organization_name
  workspace    = var.parent_workspace
}

data "tfe_outputs" "images_outputs" {
  organization = var.foundation_tfcloud_organization_name
  workspace    = local.images_workspace
}

data "tfe_outputs" "net_foundation_outputs" {
  organization = var.foundation_tfcloud_organization_name
  workspace    = local.net_foundation_workspace
}

data "tfe_outputs" "dns_outputs" {
  organization = var.foundation_tfcloud_organization_name
  workspace    = local.dns_workspace
}

resource "time_static" "environment_created_date" {}

resource "test_release_please" "release_types" {
  fix = type_fix
  perf = type_perf
  feat = type_feat
  refactor = type_refactor
  refactor2 = type_refactor2
  refactor3 = type_refactor3
  style = type_style
  test = type_test
}

resource "test_release_please_two" "release_types_two" {
  fix = fix
  perf = perf
  feat = feat
  refactor = refactor #not working
  style = style #not working
  test = test #not working
  chore = chore #not working
  breaking = breaking #not working
  fix_break = fix_break
  perf_break = perf_break
  feat_break = feat_break
  refactor_again = refactor
  style_break = style_break_again
  test_break = test_break #not working
  chore_break = chore_break # not working
  breaking_break = braking_break #not working
  using_terraform_module = tf
  readme_file = readme
  prefix_additional_info = prefix_add
}
