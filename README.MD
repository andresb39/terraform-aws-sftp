# terraform-aws-sftp
This module aims to create a SFTP server with an identity provider based on:

- API Gateway
- Lambda
- AWS Secrets

This module will show the **DNS** and **EndPoint** that will allow us to connect to **_SFTP_**.

## Credential Store
The credentials can be stored as AWS Secrets.

The infrastructure code is based on the example provided (in the CF template) in the AWS Storage Blog article
https://aws.amazon.com/blogs/storage/enable-password-authentication-for-aws-transfer-family-using-aws-secrets-manager-updated//.

## TO DO
#### _The following resources will be created._

- [X] IAM Roles for:
  - SFTP
  - Api Gateway
  - Lambda
- [X] Transfer Family Server
- [X] Api Gateway
- [X] Lambda
- [X] Route53

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_sftp_name"></a> [sftp\_name](#input\_sftp\_name) | SFTP DNS Name | `string` | `"sftp"` |   yes    |
| <a name="input_stage"></a> [stage](#input\_stage) | The deployment stage | `string` | `"dev"` |   yes    |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | Zona Name | `string` | `""` |   yes    |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for resources | `map(string)` | `{}` |    no    |


## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | SFTP EndPoint url |
| <a name="output_sft_dns"></a> [sft\_dns](#output\_sft\_dns) | SFTP DNS |

### Usage
```
module "sftp"{
    source = "https://github.com/andresb39/terraform-aws-sftp.git?ref=v0.0.1"
    zone_name = "example.com"
    # optional 
    stage = "prod"
}
```

<!-- END_TF_DOCS -->