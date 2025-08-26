variable "prefix" {
  description = "Prefix for resources in AWS"
  default     = "vamet"
}
variable "project" {
  description = "Project name for taggigng resources"
  default     = "devops-iac"
}
variable "contact" {
  description = "contact email for tagging resources"
  default     = "dheerajvarma.bhupathiraju@valuemomentum.com"
}

variable "db_username" {
  description = "Username for the recipe app api database"
  default     = "idpdbuser"
}

variable "db_password" {
  description = "Password for the Terraform database"
}

variable "ecr_proxy_image" {
  description = "Path to the ECR repo with the proxy image"
}

variable "ecr_app_image" {
  description = "Path to the ECR repo with the API image"
}

variable "django_secret_key" {
  description = "Secret key for Django"
}

# variable "dns_zone_name" {
#   description = "Domain name"
#   default     = "shribhavanifarm.com"
# }

# variable "subdomain" {
#   description = "Subdomain for each environment"
#   type        = map(string)

#   default = {
#     prod    = "api"
#     staging = "api.staging"
#     dev     = "api.dev"
#   }
# }

