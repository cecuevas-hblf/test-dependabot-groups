
# TFC workspace variables
variable "environment" {
  description = "Name of environment (e.g. `dev1`, `stg1`, `prd1`, etc.)"
  type        = string
}

variable "foundation_tfcloud_organization_name" {
  description = "The unique name of the Terraform Cloud organization housing the foundation run's Terraform Cloud workspace"
  type        = string
  nullable    = false
}
variable "foundation_tfcloud_workspace_name" {
  description = "The unique name of the foundation run's Terraform Cloud workspace"
  type        = string
  nullable    = false
}

variable "gcp_billing_account_id" {
  description = "Google Cloud billing account Id --- This variable is managed by Terraform"
  type        = string
}

variable "gcp_organization_id" {
  description = "Google Cloud organization Id --- This variable is managed by Terraform"
  type        = string
}

variable "gcp_parent_folder_id" {
  description = "ID of parent (stage) folder in GCP --- This variable is managed by Terraform"
  type        = string
}

variable "parent_workspace" {
  description = "Name of parent TFC workspace"
  type        = string
}
variable "stage" {
  description = "Name of stage (e.g. `dev`, `stg`, `prd`, etc.)"
  type        = string
}

variable "tfc_project_name" {
  description = "The name of the project in Terraform Cloud where these workspaces are deployed"
  type        = string
  nullable    = false
}

variable "tfc_team_token" {
  description = "TFC token for stage project team"
  type        = string
  sensitive   = true
}

variable "workspace" {
  description = "Name of Terraform workspace running this code --- This variable is managed by Terraform."
  type        = string
}

# Variables for this project
variable "github_config" {
  description = "Github configuration for TFC workspaces"
  type = object({
    orgname        = string
    name           = string
    default_branch = optional(string)
  })
}

variable "oauth_client" {
  description = "TFC OAuth client ID for Github VCS connection to hlf-gcp-platform-gke org"
  type        = string
}

variable "pipeline_roles" {
  description = "List of roles required by tfc pipeline service account to manage the tenant project resources"
  type        = list(string)
}

variable "connector_pipeline_roles" {
  description = "List of roles required by tfc pipeline service account to manage the tenant project connector resources"
  type        = list(string)
}

variable "pipeline_roles_con" {
  description = "List of roles for google managed service account required by tfc pipeline to manage the tenant project resources"
  type        = list(string)
}

variable "tenant_project" {
  description = "New tenant project configuration"
  type = object({
    name                              = string
    enable_shared_vpc_host_project    = bool
    enable_shared_vpc_service_project = bool
    activate_apis                     = list(string)
  })
}

variable "connector_project_name" {
  description = "Connector Project Name"
  type        = string
}

variable "tf_version_constraint" {
  description = "Terraform version constraint for GKE infrastructure TFC workspaces"
}

# apigee Network workspace specfic variales
variable "github_net_config" {
  description = "Github configuration for network  TFC workspaces"
  type = object({
    orgname        = string
    name           = string
    default_branch = optional(string)
  })
}

# Integration connector repo
variable "github_conn_config" {
  description = "Github configuration for connector TFC workspaces"
  type = object({
    orgname        = string
    name           = string
    default_branch = optional(string)
  })
}

variable "oauth_client_network" {
  description = "TFC OAuth client ID for Github VCS connection to hn-iac - Netops org"
  type        = string
}

variable "github_action" {
  description = "list of Github Orgs - Github action config for Apigee resource deployment"
  type        = list(string)
}

variable "apigee_github_action_roles" {
  description = "List of roles required by github action's service account to deploy the apigee proxy/product/kvm..etc"
  type        = list(string)
}

variable "ado_gsm_tenant_id" {
  description = "ADO Pipeline service connection tenant ID for Secret manager"
  type        = string
}

variable "ado_gsm_app_id" {
  description = "ADO Pipeline service connection app ID for Secret manager"
  type        = string
}

variable "workspaces" {
  description = "Workspace configuration"
  type = map(object({
    agent_pool_name              = optional(string) # default: null
    allow_destroy_plan           = bool
    auto_apply                   = bool
    file_triggers_enabled        = optional(bool, true) # default: false
    global_remote_state          = optional(bool)       # default: false
    ingress_submodules           = optional(bool)       # default: false
    queue_after_creation         = optional(bool, true) # default: false
    terraform_root_module_path   = string
    terraform_version_constraint = string
    trigger_patterns             = optional(list(string), null) # default: null
  }))
}

variable release {
  type = string
}