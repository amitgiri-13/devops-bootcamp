# Create infrastructure

[Visit: developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-create](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-create)
Let's creaate EC2 instance.

---

## Prerequisites
- The Terraform CLI (1.2.0+) installed
- The AWS CLI installed
- An AWS Account and associated credentials

---

## Write configuration
```bash
# clone a empty repo
git clone  git@github.com:amitgiri-13/terraform-aws.git

# change working dir 
cd terraform-aws
```
---

**Terraform configuration files** are plain text *.tf* files written in HCL. Terraform automatically loads all .tf files in a directory, resolve dependencies, and lets us organize configurations across multiple files. These files use **blocks** to configuure **Terraform, providers, and infrastructure resources.**

---

## The *terraform* block

The *terraform {}* block configures Terraform itself, including required providers and the Terraform v ersion. It's best practive to define it in a dedicated terraform.tf file for easier maintenance.

- terraform.tf
```bash
terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.92"
        }
    }

    required_version = ">= 1.2"
}
```

- **Providers** :
Terraform uses providers (binary plugins) to manage resources via cloud APIs. Providers are versioned separately, allowing support for any API-based platform.

- **Terraform Registry** :
Public providers and moudles are sourced from the HashiCorp Terraform Registry.

- **required_providers** block :
Defines which providers to use and sets version constraints to ensure stability

- **source** argument :
Specifies the provider location (hostname/namespace/name)

- **version** argument :
Restircts provider versions

- **required_version** :
Specify the Terraform version

---

## Configuration blocks

It is best practice to define provider blocks and other primary infrastructure in main.tf. 

- main.tf
```bash
provider "aws" {
    region = "us-east-1"
}

data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
    }

    owners = ["099720109477"] # Canonical
}

resource "aws_instance" "my_server" {
    ami = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"

    tags = {
        Name = "learn-terraform"
    }
}
```
---

### Providers

The **provider** block configures options that apply to all resources managed by our provider, such as the region to create them in. This provider block configures the aws provider. The label of the provider block corresponds to the name of the provider in the required_providers list in our terraform block.

```bash
provider "aws" {
    region = "us-east-1"
}
```

---

### Data sources

We can use **data** blocks to query our cloud provider for information about other resources. This data source fetches data about the latest AWS AMI that matches the filter, so we do not have to hardcode the AMI ID into our configuration. Data sources help keep our configuration dynamic and avoid hardcoded values that can become stale.

```bash
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}
```

Data sources have an ID, which we can use to reference the data attributes within our configuration. Data source IDs are prefixed with data, followed by the block's type and name. 

---

### Resources

A *resource* block defines components of our infrastructure.

```bash
resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "learn-terraform"
  }
}
```
The first line of a resource block declares a resource type and resource name. In this example, the resource type is aws_instance. The prefix of the resource type corresponds to the name of the provider, and the rest of the string is the provider-defined resource type. Together, the resource type and resource name form a unique resource address for the resource in our configuration. The resource address for our EC2 instance is aws_instance.app_server. We can refer to a resource in other parts of your configuration by its resource address.

The arguments in our resource block configure the resource and its behavior.

---

## Working dir
```bash
.
├── main.tf
└── terraform.tf
```
---

## Format configuration

The terraform fmt command automatically reformats all configuration files in the current directory according to HashiCorp's recommended style.

```bash
terraform fmt
# Terraform prints the names of the files it modified, if any.
```
---

## Initialize workspace

Before we can apply our configuration, we must initialize our Terraform workspace with the terraform init command. As part of initialization, Terraform downloads and installs the providers defined in our configuration in our current working directory.

```bash
terraform init
```

Terraform downloaded the aws provider and installed it in a hidden .terraform subdirectory of our current working directory. Terraform also created a file named .terraform.lock.hcl which specifies the exact provider versions used with our workspace, ensuring consistency between runs.\

---

## Validate configuration

Make sure our configuration is syntactically valid and internally consistent by using the *terraform validate*command.

```bash
terraform validate
```

---

## AWS Configure
```bash
aws configure set aws_access_key_id "<key>"
aws configure set aws_secret_access_key "<key>"
aws configure set aws_session_token "<token>"
```

---
 

## Create infrastructure

Terraform updates infrastructure in two steps. It first creates an execution plan to show expected changes, then applies them after our approval using configured providers. This helps catch issues before changes are made.

Running *terrafrom apply* desplays the plan, asks for confirmation, and then creates the defined resources.

```bash
terraform apply
# type: yes
```

---

## Current dir

```bash
.
├── main.tf
├── terraform.tf
└── terraform.tfstate
└── .gitignore
```

- .gitignore
```bash
.terraform/
terraform.tfstate  
```
It’s not a good idea to add terraform.tfstate to GitHub because:

- Contains sensitive data: The state file can store secrets like passwords, API keys, private IPs, and resource IDs in plain text.
- Security risk: If pushed to a public or shared repo, attackers could use that information to access your infrastructure.
- Concurrency issues: Terraform state should be locked during updates. GitHub cannot handle state locking, leading to corrupted state when multiple people run Terraform.
- Environment-specific: State files are tied to a specific environment (dev, prod) and don’t belong in versioned code.
- Single source of truth: Terraform expects one authoritative state location; multiple copies in Git can cause drift and conflicts.

---

## Inspect state

When we applied our configuration, Terraform wrote data about our infrastructure into a file called terraform.tfstate. Terraform stores data about our infrastructure in its state file, which it uses to manage resources over their lifecycle.

```bash
terraform state list
```
Even though the data source is not an actual resource, Terraform tracks it in our state file. Print out your workspace's entire state using the terraform show command.

```bash
terraform show
```

---

## Push to repo

```bash
git add .
git commit -m "writing configuration to create ec2"
git push origin main
```

---
