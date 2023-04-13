provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"
  cluster_name = "webservices-prod"
  db_remote_state_bucket = "snn-terrastate"
  db_remote_state_key = "prod/data-stores/mysql/terraform.tfstate"

  instance_type = 't2.micro'
  min_size      = 1
  max_size      = 2
}
