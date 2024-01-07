variable "name" {
  type        = string
  description = "The name of the virtual network."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the virtual network."
}

variable "location" {
  type        = string
  description = "The location/region where the virtual network is created."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags to assign to the resource."
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used in the virtual network. More than one address space can be provisioned."

  validation {
    condition     = can([for ip in var.address_space : cidrsubnet(ip, 0, 0)])
    error_message = "All value must be a valid IP range in CIDR format."
  }
}

variable "dns_servers" {
  type        = list(string)
  default     = []
  description = "List of IP addresses of DNS servers."

  validation {
    condition     = can([for ip in var.dns_servers : cidrnetmask("${ip}/32")])
    error_message = "All value must be a valid IP address."
  }
}

variable "ddos_protection_plan_id" {
  type        = string
  default     = null
  description = "The ID of DDoS Protection Plan."
}

variable "bgp_community" {
  type        = string
  default     = null
  description = "The BGP community attribute in format `<as-number>:<community-value>`. The as-number segment is the Microsoft ASN, which is always 12076 for now."

  validation {
    condition     = var.bgp_community == null ? true : length(split(":", var.bgp_community)) == 2
    error_message = "The value must be a BGP community range in <as-number>:<community-value> format."
  }

  validation {
    condition     = var.bgp_community == null ? true : split(":", var.bgp_community)[0] == "12076"
    error_message = "The as-number must be 12076."
  }

  validation {
    condition     = var.bgp_community == null ? true : split(":", var.bgp_community)[1] >= 20000 && split(":", var.bgp_community)[1] <= 49999
    error_message = "The community-value must between 20000 and 49999."
  }
}

variable "subnets" {
  type = list(object({
    name                                          = string
    address_prefixes                              = list(string)
    service_endpoints                             = optional(list(string))
    delegation                                    = optional(string)
    private_endpoint_network_policies_enabled     = optional(bool)
    private_link_service_network_policies_enabled = optional(bool)
  }))
  default     = []
  description = "List of objects that represent the configuration of each subnet."
}
