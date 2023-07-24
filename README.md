# widebot-devops-task

## overview 
This task involves setting up an infrastructure on AWS for a web application using Infrastructure provisioning tool (Terraform).

## Prerequisites

- [x] AWS Account
- [x] Proper Permissions for your user
- [X] Terraform installed on your IDE
- [X] AWS CLI installed and configured on your IDE
# Steps

## 1. Provision EKS Cluster:

1. Clone the Github repository.

    ```
       git clone https://github.com/mahmoud-sabra/widebot-devops-task.git
    ```

1. Initialize Terraform.

    ```bash
    terraform init
    ```

1. See what resources will be created.

    ```bash
    terraform plan
    ```

1. Create the resources and deploy the infrastructure

      ```bash
    terraform apply --auto-approve
    ```

1. Update your `kubeconfig` file 
  
    ```bash
    aws eks update-kubeconfig --name elmesary --region us-east-1
    ```
#### Clean up

1. Run the following command:

   ```bash
   terraform destroy --auto-approve
   ```
  
