# Terraform_AWS_spot
Code to create Master and Nodes from K8s manual install

1) Configure access to your AWS account via AWS configure

2) In testing.tfvars change your key_name to your early created key in your AWS region

3) 4) Enter command:

    ```sh
    terraform init
    ```

4) Enter command:

    ```sh
    terraform apply -var-file="testing.tfvars" --auto-approve
    ```
5) Watch ip adresses in terraform outputs 