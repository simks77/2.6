provider "aws" {
  region = "ap-southeast-1"  # Change to your desired region
}

resource "aws_dynamodb_table" "book_inventory" {
  name         = "kssim-bookinventory"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "ISBN"
    type = "S"
  }

  attribute {
    name = "Genre"
    type = "S"
  }

  hash_key  = "ISBN"
  range_key = "Genre"
}