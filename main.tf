/*
* This module aims to create a SFTP Server on AWS with an identity provider (IdP) based on users and passwords.
* - The SFTP Server is created using the AWS Transfer Family service.
* - The IdP is created using lambda functions and API Gateway.
*
* This module will show the **DNS** and **EndPoint** that will allow us to connect to **SFTP**.
*
* ## Credentials stored
* The credentials can be stord as AWS Secrets Manager.
*
* ## References
* The infrastructure code is based on the example provided (in the CF template) in the AWS Storage Blog article
* https://aws.amazon.com/blogs/storage/enable-password-authentication-for-aws-transfer-family-using-aws-secrets-manager-updated/
*
* ## To DO
* - [X] IAM Roles for:
*   - [X] Lambda
*   - [X] Transfer
* - [X] Lambda functions
* - [X] API Gateway
* - [X] SFTP Server
* - [X] CloudWatch Log Group
*
* ### Route53 DNS record is optional and can be created if the variable `zone_name` is set.
*
* ## Usage
* ```hcl
* module "sftp" {
*  source    = "andresb39/sftp/aws"
*  version   = "0.0.3"
*  zone_name = "example.com" # Optional
*  stage     = "dev"
*
*  tags = {
*   Environment = "dev"
*   Project     = "sftp"
*   Team        = "devops"
*  }
* }
* ```
*
* # Examples
* - [Complete](https://github.com/andresb39/terraform-aws-sftp/tree/main/examples/complete): With this example we are going to create a SFTP server with Identity Provider + S3 bucket + Credentials in AWS Secret Manage
*/

resource "random_string" "random_suffix" {
  length  = 5
  special = false
  upper   = false
}
