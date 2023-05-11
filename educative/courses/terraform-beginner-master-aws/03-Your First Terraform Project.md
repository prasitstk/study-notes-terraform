# Your First Terraform Project

## Project files

./projects/**03_your_first_terraform_project/main.tf**

```text
provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_s3_bucket" "first_bucket" {
  bucket = "<your-bucket-name>"
}
```

> NOTE: Please ensure that the bucket name `<your-bucket-name>` is <ins>**globally unique**</ins>.

---

## Basic Terraform operations

Initialize Terraform project by:

```shell
terraform init
```

> NOTE: `terraform init` will download the <ins>**AWS provider**</ins> into **.terraform** directory inside the root directory of the Terraform project.

Initialize **AWS STS session token (Method 1)** or **AWS Access/Secret Keys (Method 2)** for your terminal session before running other terraform commands that connect to <ins>your AWS member account</ins> by: 

- **Method 1**: Use your own AWS account credentials

```shell
TOKEN=<enter MFA token from your device>

CREDENTIAL=$(aws --profile <your-profile-name-of-aws-management-account sts get-session-token> --serial-number arn:aws:iam::<account ID of aws-management-account>:mfa/<your MFA name in aws-management-account> --output text --query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken,Expiration]" --token-code $TOKEN)

export AWS_ACCESS_KEY_ID=$(echo ${CREDENTIAL} | cut -d $'\t' -f 1)
export AWS_SECRET_ACCESS_KEY=$(echo ${CREDENTIAL} | cut -d $'\t' -f 2)
export AWS_SESSION_TOKEN=$(echo ${CREDENTIAL} | cut -d $'\t' -f 3)

CREDENTIAL=$(aws sts assume-role --role-arn "arn:aws:iam::<account ID of aws-member-account>:role/<iam-role-name-to-be-assumed-on-aws-member-account>" --role-session-name AWSCLI-Session --output text --query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken,Expiration]")

export AWS_ACCESS_KEY_ID=$(echo ${CREDENTIAL} | cut -d $'\t' -f 1)
export AWS_SECRET_ACCESS_KEY=$(echo ${CREDENTIAL} | cut -d $'\t' -f 2)
export AWS_SESSION_TOKEN=$(echo ${CREDENTIAL} | cut -d $'\t' -f 3)
```

- **Method 2**: Use AWS-account-specific IAM User Access/Secret keys

```shell
export AWS_ACCESS_KEY_ID=<AWS Access key of the IAM User>
export AWS_SECRET_ACCESS_KEY=<AWS Secret key of the IAM User>
```

Create a Terraform plan: *The plan is what Terraform will do to get the real infrastructure from where it is now to how you have specified you want it to be in code.*

```shell
terraform plan
```

- After that, it will print output to show what Terraform will do when we apply the planned updates. Please review it before going to the next step. If we think something wrong, go back to edit the **main.tf** file and generate the plan again.
- `terraform plan` command can be useful if you want to <ins>test something but do not want to run the risk of applying it by accident.</ins>

Once you are OK about the plan output, apply that updates by:

```shell
terraform apply
terraform apply -auto-approve # applying without asking you to confirm
```

- Actuall, `terraform apply` will automatically do `terraform plan` first and then wait for you to confirm.
  
To destroy the infrastructure we have created, do the following:

```shell
terraform destroy
```

The plan can be exported to a file (plan phase) and imported to apply updates (apply phase) by:

```shell
terraform plan -out /tmp/my-project.tfplan
terraform apply /tmp/my-project.tfplan
```

Here is **the recommended way** to work with because it allow a human operator <ins>to check the plan before you pass it to be applied.</ins>

> NOTE: With `terraform apply /tmp/my-project.tfplan`, Terraform will just **apply** your plan saved in the file **my-project.tfplan** without stopping to ask you if you wanted to do it or not.

---
