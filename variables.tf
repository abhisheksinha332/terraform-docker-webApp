
variable "client_id" {
  description = "Client ID for the service principal"
  type        = string 
}

variable "client_secret" {
  description = "Client secret for the service principal"
  type        = string 
}

variable "tenant_id" {
  description = "Tenant ID for the service principal"
  type        = string  
}

variable "subscription_id" {
  description = "Subscription ID for the service principal"
  type        = string  
}


variable "resource_group" {
  description = "Resource group for the Azure resources"
  type        = string
}

variable "app-service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
  
}
variable "web_app_name" {
  description = "Name of the Web App"
  type        = string
}

variable "docker_image_name" {
  description = "Docker image name for the web app"
  type        = string
}