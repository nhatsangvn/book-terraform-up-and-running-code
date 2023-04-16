##
#export TF_VAR_db_username="(YOUR_DB_USERNAME)"
#export TF_VAR_db_password="(YOUR_DB_PASSWORD)"
variable "db_username" {
  description = "The username for the database"
  type        = string
  sensitive   = true # allow to input
}

variable "db_password" {
  description = "The password for the database"
  type        = string
  sensitive   = true # allow to input
}
