# About:

I'm actively guiding my students to extend their learning beyond the current curriculum. Within the framework of Nucamp Coding Bootcamp's workshop 2, the focus is on mastering the fundamentals of constructing a Basic Python Django application seamlessly integrated with a Postgresql database through AWS. While covering essential configurations with an EC2 instance, RDS setup, repository creation, and application containerization, we've been executing these steps manually.

To empower my students with a deeper understanding and a more streamlined approach, I proactively introduced Terraform to automate the infrastructure-building process. This not only enhances their comprehension but also exposes them to additional concepts. Furthermore, I took the initiative to construct a Helm chart, offering a convenient deployment option to Amazon EKS (Elastic Kubernetes Service) should the need arise. This strategic move broadens the scope of their learning, preparing them for more advanced and efficient practices in the realm of cloud infrastructure and deployment.

## Prerequisites:

- AWS Account
- AWS CLI
- Terraform
- Docker
- Docker Compose
- Python
- Django
- PostgreSQL
- Nginx
- Kubectl (Kubernetes)
- Helm (Kubernetes)
- K9S (Kubernetes)

## Project Overview 1.0

I will be connecting my application to a AWS EC2 instance to test that my application is working 100% in cloud. I will be using the following technologies:

    - Python
    - Django
    - PostgreSQL
    - Docker
    - Docker Compose
    - Nginx
    - AWS EC2
    - AWS Relational Database Service (RDS)
    - AWS EKS

## Project Overview 2.0

- I will be creating a docker image and I will uploaded to the AWS registry, and I will use the image to run the project into Kubernetes. I will be using the following technologies:
    - Docker
    - AWS Elastic Container Registry (ECR)
    - Kubernetes
    - Helm


## Infrastructure
This part will be set up with Terraform. I will be using Terraform to create the following:

- VPC
- Subnets
- Internet Gateway
- Route Table
- Security Group
- EC2 Instance
- RDS Instance

## Getting Started

- Clone this repository and this repository: https://github.com/hvaandres/workshop2
- If you are using "Workshop2" repository, you will need to change the "main.tf" file to your own AWS account. You will need to change the "aws_access_key" and "aws_secret_key" to your own AWS account. OR you will need to change the "variables.tf" file to your own AWS account. You will need to change the "aws_access_key" and "aws_secret_key" to your own AWS account.
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


## Application Structure (Kubernetes)

- terraform: You should run this pproject first. This will create the AWS resources.
- docker-compose.yml: Should have the AWS account connection information. Then, it should be ready for the container registry
- Now, you will have to add the URL from your container registry to the "values.yaml" located in the "helm" folder. You will need to change the following line: "repository: [Container_registry_image]"
- Login into your EKS Cluster and run the following command: "helm install [name] ." You will need to be inside of the "helm project" folder to ensure this command will work.
- If everything above is working, you will be able to verify the pods and services by running the following commands:
    - "kubectl get pods"
    - "kubectl get services"
- If the service is running as expected, you should be able to get an external IP address from the load balancer which will be the main source of the application.


# Personal Notes

This is what I teach in my DevOps course with Nucamp: https://nucamp.co?referral=YGVUVG. If you want to learn more about this course, you can [check it out here](https://nucamp.co?referral=YGVUVG). If you have more questions, you can always feel free to reach out to me and I will be happy to help you out.


## Go to the "terraform" folder and run the following commands:

- Destroy the resources by running the following command: "terraform destroy"
- This will take a few minutes to destroy the resources.

## Guides

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

## Books
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


