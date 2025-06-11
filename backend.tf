terraform {
  backend "s3" {
    bucket = "sctp-ce10-tfstate"
    key    = "kssim-dynamodb.tfstate"
    region = "ap-southeast-1"
  }
}