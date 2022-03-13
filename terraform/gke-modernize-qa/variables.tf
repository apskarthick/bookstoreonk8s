variable "clsname" {
  type = string
  default = "bookstore-prod"
}

variable "region" {
  type = string
  default = "us-central1"
}
variable "project" {
 type= string 
 default = "ipl2021-342414"
}
variable "nodepool" {
 type= string 
 default = "bookstore-prod-nodepool"
}

variable "dbname" {
 type= string 
 default = "Bookstore-qa"
}

variable "dbusername" {
 type= string 
 default = "bookstore-qa-user"
}