terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket         = "terraform-state-pg-0002"  
    key            = "terraform/state.tfstate"
    region         = "us-east-1"               
    encrypt        = true
    dynamodb_table = "terraform-lock"          
  }
}
