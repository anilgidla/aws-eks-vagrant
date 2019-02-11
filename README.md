

# awscli-eks

## About...

This setup is used to create awscli client to access eks cluster.


## Table of Contents

* [What are the pre-requisites ?](#pre-requisites)
* [How to install AWSCLI ?](#deploy)
* [What are the addons provided ?](#addons)
* [What are the VM configuration details ?](#configuration)
* [How to access existing EKS cluster ?](#eks)
* [How to access Kubernetes Dashboard ?](#dashboard)
* [How to create new EKS cluster ?](#create)
* [How to delete EKS cluster ?](#delete)
* [How to access Vagrant VM ?](#access)
* [How to stop Vagrant VM ?](#stop)
* [How to restart Vagrant VM ?](#restart)
* [How to destroy Vagrant VM ?](#destroy)


<a id="pre-requisites"></a>
## What are the pre-Requisites ?
* [Git](https://git-scm.com/downloads "Git")
* [Vagrant](https://www.vagrantup.com/downloads.html "Vagrant")
* [Oracle Virtual Manger](https://www.oracle.com/technetwork/server-storage/virtualbox/downloads/index.html "Oracle Virtual Manger")
* `Virtualization needes to be enabled in System BIOS`
* `Minimum laptop/desktop configuration  - 2GB RAM,2 CPU`



<a id="deploy"></a>
## How to install AWSCLI ?
* Open `bash` terminal 
* Checkout the code  (git clone https://github.com/SubhakarKotta/awscli-eks-vagrant.git) 
* `cd awscli-eks-vagrant/provisioning` 
* Default settings:`env.yaml`.
```yaml
VM:
  password: awscli-eks
  ip: 172.17.8.101
  cpus: 2
  memory: 2048
  vmname: awscli-eks
  hostname: awscli-eks.com
```
    
	By running the below command awscli with eks will be installed
* `vagrant up`



<a id="addons"></a>
## What are the addons provided ?
* `kubectl (1.11.5)`
* `aws-iam-authenticator`
* `aws`
* `eksctl` (https://github.com/weaveworks/eksctl)
* `pip`
* `helm`

<a id="configuration"></a>
## What are the VM configuration details ?

Name|IP|OS|RAM|CPU|
|----|----|----|----|----|
awscli-eks  |172.17.8.101|CentOS 7|2G|2|



<a id="eks"></a>
## How to access existing EKS Cluster ?

* `cd awscli-eks-vagrant/provisioning` from bash terminal
* `vagrant ssh awscli-eks`
* `sudo su`
* `aws configure`
*  `^^^^^^^^^^^^^ AWS Access Key ID [None]:`
*  `^^^^^^^^^^^^^ AWS Secret Access Key [None]:`
*  `^^^^^^^^^^^^^ Default region name [None]:`
*  `^^^^^^^^^^^^^ Default output format [None]:`
* `aws eks --region <region> update-kubeconfig --name <cluster_name>`
* `kubectl proxy`

<a id="eks"></a>
## How to access Kubernetes Dashboard ?
Follow the steps [How to access EKS Cluster](#eks)
From local system execute the below commands
* `from bash terminal type  $ssh -L 8001:localhost:8001 root@172.17.8.101`
* `enter password : awscli-eks`
* `Go to browser and type URL`
[http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login](http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login)

![enter image description here](https://lh3.googleusercontent.com/YJE7IrWjWIt8B2JM23u13D0T_7V5ec_SB7BDNbOSCl_nbe5Ob_KHHpGQap6n684HHS8UNxBTkY0 "Watch the Video")

[![Watch the video to access Kubenetes Dashboard]](https://youtu.be/qvYew25_Dao)


<a id="create"></a>
## How to create new EKS Cluster ?

* `cd awscli-eks-vagrant/provisioning` from bash terminal
* `vagrant ssh awscli-eks`
* `sudo su`
* `aws configure`
*  `^^^^^^^^^^^^^ AWS Access Key ID [None]:`
*  `^^^^^^^^^^^^^ AWS Secret Access Key [None]:`
*  `^^^^^^^^^^^^^ Default region name [None]:`
*  `^^^^^^^^^^^^^ Default output format [None]:`
* `eksctl create cluster --version=1.11 --name=demo-cluster --region=us-east-2 --nodes-min=3 --nodes-max=5 --node-type=c4.xlarge --tags owner=demo`


<a id="delete"></a>
## How to delete existing EKS Cluster ?

* `cd awscli-eks-vagrant/provisioning` from bash terminal
* `vagrant ssh awscli-eks`
* `sudo su`
* `aws configure`
*  `^^^^^^^^^^^^^ AWS Access Key ID [None]:`
*  `^^^^^^^^^^^^^ AWS Secret Access Key [None]:`
*  `^^^^^^^^^^^^^ Default region name [None]:`
*  `^^^^^^^^^^^^^ Default output format [None]:`
* `eksctl delete cluster --name=demo-cluster --region=us-east-2


<a id="access"></a>
## How to access Vagrant VM ?
The Vagrant VM can be accessed in two ways

1) Login through vagrant ssh
* `cd awscli-eks-vagrant/provisioning` from bash terminal
* `vagrant ssh awscli-eks`

2) Login through putty
* `172.17.8.101 [credentials : vagrant/vagrant (OR) root/awscli-eks]`


<a id="stop"></a>
## How to stop Vagrant VM ?
* `cd awscli-eks-vagrant/provisioning` from bash terminal
* `vagrant halt`

<a id="restart"></a>
## How to restart Vagrant VM ?
* `cd awscli-eks-vagrant/provisioning` from bash terminal
* `vagrant up`

<a id="destroy"></a>
## How to destroy Vagrant VM ?
* `cd awscli-eks-vagrant/provisioning` from bash terminal
* `vagrant destroy`