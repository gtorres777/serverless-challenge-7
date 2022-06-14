# Serverless Application Challenge

## Description
![Alt text](/serverless_architecture.png?raw=true "Serverless architecture")

Terraform project to setup two API Gateway endpoints that can trigger two different AWS Lambdas, one to read records from an AWS DynamoDB table and the other one to write records to an AWS DynamoDB table.

## Getting Started
This project follows the following file structure:
```
├── modules: folder of the modules configured for the project
│   ├── api_gateway
│   │   ├─── outputs.tf
│   │   ├─── readLambda_resources.tf
│   │   ├─── rest_api.tf
│   │   ├─── variables.tf
│   │   └─── writeLambda_resources.tf
│   ├── dynamodb
│   │   └─── dynamodb.tf
│   ├── readLambda
│   │   ├─── read_function_code: folder of the read lambda code
│   │   │    └─── index.js
│   │   ├─── outputs.tf
│   │   ├─── readLambda.tf
│   │   ├─── read_function_code.zip
│   │   └─── variables.tf
│   ├── s3_lambdas_code
│   │    ├─── outputs.tf
│   │    ├─── s3_lambdas_code.tf
│   │    └─── variables.tf
│   └── writeLambda
│       ├─── write_function_code: folder of the write lambda code
│       │    └─── index.js
│       ├─── outputs.tf
│       ├─── writeLambda.tf
│       ├─── write_function_code.zip
│       └─── variables.tf
├── policies: all policies created for the project
│   ├── assume_readLambda_role_policy.json
│   ├── assume_writeLambda_role_policy.json
│   ├── readLambda_policy.json
│   └── writeLambda_policy.json
├── backend.tf: s3 backend configured to store terraform state files
├── main.tf: main set of configuration for all the modules used
├── outputs.tf: urls from the api gateway to test the application
├── providers.tf: providers configured for the terraform project
├── variables.tf: variables defined that will be used inside terraform templates
├── serverless_architecture.png
└── README.md
```

## Usage
Run ```terraform init``` to initialize the working directory containing Terraform configuration files.

Run ```terraform apply``` to deploy the serverless application.


## Test the serverless application

Run ```terraform output``` to get the invoke urls to test the application.

#### Example of urls obtained from output:

` - readLambda_rest_api_url = "https://xxxxxxxxxxxxxxxxx/prod/read_user" `
` - writeLambda_rest_api_url = "https://xxxxxxxxxxxxxxxxx/prod/write_user" `

Run ```curl -X POST -d '{"id":"1","name":"user1"}' https://xxxxxxxxxxxxxxxxx/prod/write_user``` to make a record of a new user

Output:

  `{"message":"Item entered successfully"}`


Run ```curl -X POST -d '{"id":"1"}' https://xxxxxxxxxxxxxxxxx/prod/read_user``` to obtain an specific user by providing the id

Output:

  `{"message":{"Item":{"id":{"S":"1"},"name":{"S":"user1"}}}}`


#### In this case this urls are live to be tested 

` - readLambda_rest_api_url = "https://n10ved5464.execute-api.us-east-1.amazonaws.com/prod/read_user" `
` - writeLambda_rest_api_url = "https://n10ved5464.execute-api.us-east-1.amazonaws.com/prod/write_user" ` 

