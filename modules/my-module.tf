locals {
  foundation_outputs = {
    tfcloud_organization_name            = data.tfe_outputs.foundation.nonsensitive_values["tfcloud_organization_name"]
    herbalife_com_gcp_organization_id    = data.tfe_outputs.foundation.nonsensitive_values["herbalife_com_gcp_organization_id"]
    herbalife_com_gcp_billing_account_id = data.tfe_outputs.foundation.nonsensitive_values["herbalife_com_gcp_billing_account_id"]
    tfc_organization_run_tasks           = data.tfe_outputs.foundation.nonsensitive_values["tfc_organization_run_tasks"]
  }
  dns_workspace             = "wrk-gcp-${var.environment}-cld-dns-private-zones"
  images_workspace          = "wrk-gcp-common-image-library"
  images_project_id         = data.tfe_outputs.images_outputs.nonsensitive_values.projects.project_id
  net_foundation_workspace  = "wrk-gcp-${var.environment}-cld-net-foundation"
  net_foundation_shared_vpc = nonsensitive(data.tfe_outputs.net_foundation_outputs.values.this.vpc.google_compute_network_network_shared)
  svpc_host_project_id      = var.tenant_project.enable_shared_vpc_service_project == true ? local.net_foundation_shared_vpc.project : ""
  folder_id                 = data.tfe_outputs.foundation.nonsensitive_values["stage_tenant_folders"][var.stage][var.tenant_project.name][0].folder_id
  eas_folder_id             = data.tfe_outputs.foundation.nonsensitive_values["stage_tenant_folders"][var.stage]["eas"][0].folder_id
  api_zone = {
    name    = data.tfe_outputs.dns_outputs.values.private_zones["api"].name
    project = nonsensitive(data.tfe_outputs.dns_outputs.values.private_zones["api"].project)
  }
  common_labels = data.tfe_outputs.environments.nonsensitive_values["common_labels"]
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
}
