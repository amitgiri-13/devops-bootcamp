# Install Terraform

[Visit: developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

## Install Terraform with yum for Amazon Linux 2
```bash
# install yum-utils for yum-config-manager
sudo yum install -y yum-utils
# add repo
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo

# install terraform
sudo yum -y install terraform

# check
terraform --version
```
---

## Install Terraform with yum for Redhat and Centos
```bash
# install yum-utils for yum-config-manager
sudo yum install -y yum-utils
# add repo
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

# install terraform
sudo yum -y install terraform

# check
terraform --version
```
---

## Install Terraform with pacman
```bash
# update packages
sudo pacman -Suy

# install terraform
sudo pacman -S terraform

# check 
terroform version
```
---

