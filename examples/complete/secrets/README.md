# secrets

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
Create AWS Secrets Manager to store the credentials
- [AWS Secrets Manager](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.6.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.38 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.38 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_kms_key.kms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_secretsmanager_secret.secretmanager](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.secretmanager](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Description for resources | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name for resources | `string` | n/a | yes |
| <a name="input_secrets_maps"></a> [secrets\_maps](#input\_secrets\_maps) | A Key/Value map of secrets that will be added to AWS Secrets | `map(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resource. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_secret"></a> [secret](#output\_secret) | Secret ARN |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
