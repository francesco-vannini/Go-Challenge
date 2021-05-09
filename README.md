# Go-Challenge

## The challenge
We want a basic application in AWS/Azure:
* Redundant
* 1 VPC over 2 subnets in different AZ
* 1 EC2 in each subnet
* 1 Web server per each VM
* 1 Load balancer with public IP to serve the web contents in RR

A [trace for the GO server](https://medium.com/@m.sedrowski/run-your-first-application-on-kubernetes-e54d5194e84b)

## Approach
The installation will have to be automated using *Terraform* on both platforms (AWS and Azure)

### Linux - AWS
[Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started)
In order to install terraform from HashiCorp the repo release has to be set to an Ubuntu one

`deb [arch=amd64] https://apt.releases.hashicorp.com focal main`

So it is _focal_ instead of _ulyssa_

[Install docker (Mint 20)](https://techviewleo.com/how-to-install-and-use-docker-in-linux-mint/)

[Instal AWS CLI (Docker)](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-docker.html)
Which you will then invoke as

`docker run --rm -it amazon/aws-cli command`

`docker run --rm -it -v ~/.aws:/root/.aws amazon/aws-cli s3 ls`

Make it practical to call
`alias aws='docker run --rm -it amazon/aws-cli'`
`alias aws='docker run --rm -it -v ~/.aws:/root/.aws amazon/aws-cli'`
The second includes the credentials mapped to the docker container from the host path via the -v option

### Linux - Azure
[Install AZ CLI (Docker)](https://docs.microsoft.com/en-us/cli/azure/run-azure-cli-docker)

`docker run -it mcr.microsoft.com/azure-cli`

`alias az='docker run -it mcr.microsoft.com/azure-cli'`
Terraform provider is not found in path. Moving to install a local CLI

`sudo apt install azure-cli`

### Windows - Azure
Docker in Windows for CLI.
The whole thing not working because my Win10Pro VM doesn't support virtualisation.
Docker requires WSL which is a VM and requires type hypervisor for nested virtualisation. Unfortunately not with my XCP-ng server it seems.
Moving to install the native CLI

