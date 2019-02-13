
# awscli-eks-vagrant

## About...

This setup is used to create ***pre-requisites*** that are required to ***access/create/delete***     
***Elastic Container Service***.


## Table of Contents

* [What are the pre-requisites ?](#pre-requisites)
* [How to install aws-cli?](#deploy)
* [What are the add-ons provided ?](#addons)
* [What are the VM configuration details ?](#configuration)
* [How to access existing EKS cluster ?](#eks)
* [How to access Kubernetes Dashboard ?](#access_dashboard)
* [How to create new EKS cluster ?](#create)
* [How to Deploy the Kubernetes Web UI (Dashboard) ?](#deploy_dashboard)
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
## How to install aws-cli?
* Open `bash` terminal 
* Checkout the code  (git clone https://github.com/SubhakarKotta/awscli-eks-vagrant.git) 
* `cd awscli-eks-vagrant/provisioning` 
* Default settings:`env.yaml`.
```yaml
VM:
  password: awscli-eks
  ip: 100.10.10.108
  cpus: 2
  memory: 2048
  vmname: awscli-eks
  hostname: awscli-eks.com
```
By running the below command ***aws-cli*** to access ***Elastic Container Service*** cluster will be installed.

* `vagrant up`


<a id="addons"></a>
## What are the add-ons provided ?
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
awscli-eks  |100.10.10.108|CentOS 7|2G|2|


<a id="eks"></a>
## How to access existing EKS Cluster ?

* `$ cd awscli-eks-vagrant/provisioning`
* `$ vagrant ssh awscli-eks`
* `$ sudo su`
* `$ aws configure`
*  `^^^^^^^^^^^^^ AWS Access Key ID [None]:`
*  `^^^^^^^^^^^^^ AWS Secret Access Key [None]:`
*  `^^^^^^^^^^^^^ Default region name [None]:`
*  `^^^^^^^^^^^^^ Default output format [None]:`
* `$ aws eks --region <region> update-kubeconfig --name <cluster_name>`
* `$ kubectl get nodes` [To verify kubectl is connected to eks cluster]


<a id="access_dashboard"></a>
## How to access Kubernetes Dashboard ?
Follow the steps [How to access EKS Cluster](#eks)

From ***local*** system execute the below commands
* `$ ssh -L 8001:localhost:8001 root@100.10.10.108` [***password : awscli-eks***]
* `$ kubectl proxy`

Go to browser and type URL
[http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login](http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login)

![enter image description here](https://lh3.googleusercontent.com/YJE7IrWjWIt8B2JM23u13D0T_7V5ec_SB7BDNbOSCl_nbe5Ob_KHHpGQap6n684HHS8UNxBTkY0 "Watch the Video")

[![Watch the video to access Kubenetes Dashboard]](https://youtu.be/qvYew25_Dao)


<a id="create"></a>
## How to create new EKS Cluster ?

* `$ cd awscli-eks-vagrant/provisioning`
* `$ vagrant ssh awscli-eks`
* `$ sudo su`
* `$ aws configure`
*  `^^^^^^^^^^^^^ AWS Access Key ID [None]:`
*  `^^^^^^^^^^^^^ AWS Secret Access Key [None]:`
*  `^^^^^^^^^^^^^ Default region name [None]:`
*  `^^^^^^^^^^^^^ Default output format [None]:`
* `$ eksctl create cluster --version=1.11 --name=<YOUR_CLUSTER_NAME> --region=<YOUR_REGION_NAME> --nodes-min=<MIN_NODES> --nodes-max=<MAX_NODES> --node-type=m4.xlarge --tags owner=<YOUR_NAME>`


<a id="deploy_dashboard"></a>
## How to Deploy Kubernetes Web UI (Dashboard) ?

[https://docs.aws.amazon.com/eks/latest/userguide/dashboard-tutorial.html](https://docs.aws.amazon.com/eks/latest/userguide/dashboard-tutorial.html)


<a id="delete"></a>
## How to delete existing EKS Cluster ?

* `$ cd awscli-eks-vagrant/provisioning`
* `$ vagrant ssh awscli-eks`
* `$ sudo su`
* `$ aws configure`
*  `^^^^^^^^^^^^^ AWS Access Key ID [None]:`
*  `^^^^^^^^^^^^^ AWS Secret Access Key [None]:`
*  `^^^^^^^^^^^^^ Default region name [None]:`
*  `^^^^^^^^^^^^^ Default output format [None]:`
* `$ eksctl delete cluster --name=<YOUR_CLUSTER_NAME> --region=<YOUR_REGION_NAME>`


<a id="access"></a>
## How to access Vagrant VM ?
The Vagrant VM can be accessed in two ways

***vagrant ssh***
* `$ cd awscli-eks-vagrant/provisioning`
* `$ vagrant ssh awscli-eks`

***putty***
* `100.10.10.108` [***vagrant/vagrant***  (Or) ***root/awscli-eks***]
	
          
<a id="stop"></a>
## How to stop Vagrant VM ?
* `$ cd awscli-eks-vagrant/provisioning`
* `$ vagrant halt`


<a id="restart"></a>
## How to restart Vagrant VM ?
* `$ cd awscli-eks-vagrant/provisioning`
* `$ vagrant up`


<a id="destroy"></a>
## How to destroy Vagrant VM ?
* `$ cd awscli-eks-vagrant/provisioning`
* `$ vagrant destroy`