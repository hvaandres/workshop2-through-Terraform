# Python, Django, PostgreSQL, Docker, Docker Compose, Nginx.

I will be connecting my application to a AWS EC2 instance. I will be using the following technologies:

- Python
- Django
- PostgreSQL
- Docker
- Docker Compose
- Nginx
- AWS EC2
- AWS Relational Database Service (RDS)

# Infrastructure
This part will be set up with Terraform. I will be using Terraform to create the following:

- VPC
- Subnets
- Internet Gateway
- Route Table
- Security Group
- EC2 Instance
- RDS Instance

This project is coming from this repository:

- https://github.com/hvaandres/terraform_aws_assignment

# Notes

This is what I teach in my DevOps course with Nucamp: https://nucamp.co?referral=YGVUVG. If you want to learn more about this course, you can [check it out here](https://nucamp.co?referral=YGVUVG). If you have more questions, you can always feel free to reach out to me and I will be happy to help you out.

# Prerequisites

- AWS Account
- AWS CLI
- Terraform
- Docker
- Docker Compose
- Python
- Django
- PostgreSQL
- Nginx

# Getting Started

- Clone this repository and this repository: https://github.com/hvaandres/terraform_aws_assignment
- If you are using "Terraform_aws_assignment" repository, you will need to change the "main.tf" file to your own AWS account. You will need to change the "aws_access_key" and "aws_secret_key" to your own AWS account. OR you will need to change the "variables.tf" file to your own AWS account. You will need to change the "aws_access_key" and "aws_secret_key" to your own AWS account.
- After you run the terraform project, you will need to confirm the EC2 instance and RDS instance. 
- You will need to collect the following information from your AWS resources:
    - EC2 Instance Public IP
    - RDS Instance Endpoint
    - RDS Instance Username
    - RDS Instance Password
    - RDS Instance Database Name
    - RDS Instance Port
    - ECR Repository URL
- You will need to change the "docker-compose.yml" file to your own AWS resources. You will need to change the following:
- "DJANGO_ALLOWED_HOSTS" to your EC2 instance public IP
- "DJANGO_DATABASE_HOST" to your RDS instance endpoint
- "DJANGO_DATABASE_USER" to your RDS instance username
- "DJANGO_DATABASE_PASSWORD" to your RDS instance password
- "DJANGO_DATABASE_NAME" to your RDS instance database name
- "DJANGO_DATABASE_PORT" to your RDS instance port
- "ECR_REPOSITORY_URL" to your ECR repository URL

# Running the project
- Run the following command to build the docker image: "docker-compose build"
- Run the following command to run the docker image: "docker-compose up"
- Run the following command to run the docker image in the background: "docker-compose up -d"
- Run the following command to stop the docker image: "docker-compose down"
- Run the following command to stop the docker image in the background: "docker-compose down -v"

# Running the project in AWS EC2 instance & do some testing

- Clone this repository
- Run all the commands mentioned before in "Running the project"
- Test the application by using Insonmia or Postman:
    - GET: http://<EC2_INSTANCE_PUBLIC_IP>:8000/api/v1/tutotials
    - POST: http://<EC2_INSTANCE_PUBLIC_IP>:8000/api/v1/tutotials
      - You will change the JSON body, and where it has a different name, you will have to add your name.
      - Send the request
      - If it is successful, you will be able to see the JSON response.
      - At this point, you will know that you're done with the project.

# Push your docker image to AWS ECR
- Run the following command to tag your docker image: "docker tag <DOCKER_IMAGE_ID> <ECR_REPOSITORY_URL>:latest"
- Run the following command to push your docker image to AWS ECR: "docker push <ECR_REPOSITORY_URL>:latest"

# Login into your ECR repository

- Run the following command to login into your ECR repository: "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <ECR_REPOSITORY_URL>"

- Check that the image is in your ECR repository, and after this, you will be done with the project.

# Site notes:

- If you would like to create any more resources in AWS, you now will be able to do so. And you will be able to use the ECR repository to copy the docker image to your AWS resources. As an example, you will be able to run an EKS instance within Helm and use the ECR image to add your application to the EKS instance.

# Go to the Terraform_aws_assignment repository

- Destroy the resources by running the following command: "terraform destroy"
- This will take a few minutes to destroy the resources.

# Guides

- These are the guides:
[Run EKS on AWS](https://docs.aws.amazon.com/eks/latest/userguide/what-is-eks.html)
[Run Helm on AWS](https://docs.aws.amazon.com/eks/latest/userguide/helm.html)
[Run ECR on AWS](https://docs.aws.amazon.com/AmazonECR/latest/userguide/what-is-ecr.html)
[Run EKS with Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster)
[Learn more about Terraform](https://www.terraform.io/docs/index.html)
[Learn more about AWS](https://aws.amazon.com/)
[Learn more about Docker](https://docs.docker.com/)
[Learn more about Docker Compose](https://docs.docker.com/compose/)
[Learn more about Nginx](https://docs.nginx.com/nginx/admin-guide/)
[Learn more about Python](https://docs.python.org/3/)
[Learn more about Django](https://docs.djangoproject.com/en/3.2/)
[Learn more about PostgreSQL](https://www.postgresql.org/docs/)
[Learn more about AWS EC2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html)
[Learn more about AWS Relational Database Service (RDS)](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Welcome.html)
[Learn more about AWS Elastic Container Registry (ECR)](https://docs.aws.amazon.com/AmazonECR/latest/userguide/what-is-ecr.html)
[Learn more about AWS Elastic Kubernetes Service (EKS)](https://docs.aws.amazon.com/eks/latest/userguide/what-is-eks.html)
[Learn more about AWS Elastic Load Balancing (ELB)](https://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/what-is-load-balancing.html)
[Learn more about AWS Elastic Beanstalk (EB)](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/Welcome.html)
[Learn more about AWS Elastic Container Service (ECS)](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/Welcome.html)

# Books
- These are the books:
[Learn Terraform](https://www.terraformupandrunning.com/)
[Learn AWS](https://www.amazon.com/Amazon-Web-Services-Step-Step/dp/1119138558)
[Learn Docker](https://www.amazon.com/Docker-Deep-Dive-Nigel-Poulton/dp/1491935677)
[Learn Nginx](https://www.amazon.com/Nginx-HTTP-Server-Second-Configuration/dp/1491905018)
[Learn Python](https://www.amazon.com/Python-Crash-Course-Hands-Project-Based/dp/1593279280)
[Learn Django](https://www.amazon.com/Django-2-0-Web-Development-Quickly/dp/1787125939)
[Learn PostgreSQL](https://www.amazon.com/PostgreSQL-12-High-Performance-Scalable-Reliable/dp/1484250629)
[Learn AWS EC2](https://www.amazon.com/Amazon-Web-Services-Step-Step/dp/1119138558)
[Learn AWS Relational Database Service (RDS)](https://www.amazon.com/Amazon-Web-Services-Step-Step/dp/1119138558)
[Learn AWS Elastic Container Registry (ECR)](https://www.amazon.com/Amazon-Web-Services-Step-Step/dp/1119138558)
[Learn AWS Elastic Kubernetes Service (EKS)](https://www.amazon.com/Amazon-Web-Services-Step-Step/dp/1119138558)
[Learn AWS Elastic Load Balancing (ELB)](https://www.amazon.com/Amazon-Web-Services-Step-Step/dp/1119138558)


