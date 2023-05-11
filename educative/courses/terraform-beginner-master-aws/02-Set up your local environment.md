# Set up your local environment

## Install Terraform CLI on Mac

Install the official Terraform formula from the terminal.

```shell
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

To update to the latest version of Terraform

```shell
brew update
brew upgrade hashicorp/tap/terraform
```

Enable tab completion

```shell
touch ~/.bashrc
terraform -install-autocomplete
```

Install **HashiCorp Terraform** VS Code extension.

---

## Install and set up AWS CLI

Install <ins>**AWS CLI v2**</ins> by following the instructions [here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).

Set up <ins>**AWS credential file**</ins>: **~/.aws/credentials**, for example:

```ini
[your-profile-name-of-aws-management-account]
aws_access_key_id = <access key of IAM user in your aws-management-account>
aws_secret_access_key = <secret access key of IAM user in your aws-management-account>

[your-profile-name-of-aws-member-account]
region = ap-southeast-1
role_arn = arn:aws:iam::<account ID of aws-member-account>:role/<iam-role-name-to-be-assumed-on-aws-member-account>
source_profile = your-profile-name-of-aws-management-account
mfa_serial = arn:aws:iam::<account ID of aws-management-account>:mfa/<your MFA name in aws-management-account>
```

---
