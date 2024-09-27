variable "instances" {
  type = map(any)

  
}


variable "zone_id" {
  type    = string
  default = "Z06398699XM2ECJQJB98"

}

variable "domain_name" {
  type    = string
  default = "cpr85.online"

}

variable "common_tags" {

  default     = {

    Project= "expense"
    Terraform = true

  }

}

variable "tags" {
  type        = map
 
}

variable "environment" {

 
 
}




