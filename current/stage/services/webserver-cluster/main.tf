terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "snn-terrastate"
    key            = "stage/services/webserver-cluster/terraform.tfstate"
    region         = "us-east-2"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"
  cluster_name = "webservices-stage"
  db_remote_state_bucket = "snn-terrastate"
  db_remote_state_key = "stage/data-stores/mysql/terraform.tfstate"

  instance_type = "t2.micro"
  min_size      = 1
  max_size      = 2
  desired_capacity = 1
}
