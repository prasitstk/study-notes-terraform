# Overview

## What is **Terraform**?

- An <u>**infrastructure as code tool**</u>: **Write** -> **Plan** -> **Apply**
- Lets you define both **cloud and on-prem resources** in **human-readable configuration files** that you can **version**, **reuse**, and **share**.

> NOTE#1: The markup language used by Terraform code is called as <u>**HCL (HashiCorp Configuration Language)**</u>.
> 
> NOTE#2: **Hashicorp** is the company that makes Terraform.

---

## How does **Terraform** work?

- Terraform creates and manages *resources* on **cloud platforms and other services** through <u>**their application programming interfaces (APIs)**</u>.
- <u>**Providers**</u> enable Terraform to work with virtually any platform or service with <u>**an accessible API**</u>.

<p align="center">
    <img alt="how-does-terraform-work" src="./images/how-does-terraform-work.png">
</p>

---

## How do you work with Terraform?

:x: <u>**NO**</u> need to tell Terraform <u>**HOW**</u> to do what we want **imperatively**.

:white_check_mark: Instead, tell Terraform <u>WHAT</u> we want **declaratively**.

For example, in a Terraform project, you have defined that you want <u>**4 AWS EC2 instances**</u>.

- If **currently = 0 instance** -> After run Terraform-> Terraform will **create 4 new instances**.
- If **currently = 3 instances** -> After run Terraform-> Terraform will **create a new one instance**.
- If **currently = 5 instances** -> After run Terraform-> Terraform will **delete one instance**.

From the above example, Terraform will work with you by: 

- You <u>**write**</u> the configuration in the Terraform project to define the number of resources you want.
- Terraform <u>**plans**</u> for how to get from what you have to what you want based on the configuration file you write.
- Terraform <u>**applies**</u> the planned operations in the correct order, respecting any resource dependencies to make it happen.

