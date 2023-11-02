/*
* Whit this example you can create a sftp server in aws with Idp authentication + S3 bucket + Credentials in AWS Secret Manager
* ## To DO
* - [X] IAM Roles for:
*   - [X] Lambda
*   - [X] Transfer
*   - [X] API Gateway
* - [X] Lambda functions
* - [X] API Gateway
* - [X] SFTP Server
* - [X] S3 Bucket
* - [X] AWS Secret Manager
* - [X] Route53 DNS record
*
* ## Usage
* ```shell
* terraform init
* terraform plan
* terraform apply
* ```
* ## Clean up
* ```shell
* terraform destroy
* ```
*/
module "sftp" {
  source    = "../.."
  stage     = "prod"
  zone_name = "example.com"
  tags = {
    owner     = "DevOps"
    managered = "terraform"
  }
}
