# 🚀 AWS Resource List Script

A lightweight Bash script that lists AWS resources from your AWS account using the AWS CLI. Simply specify an AWS region and the service name to retrieve the resources associated with that service.

---

## 📖 Overview

Managing AWS resources across multiple services can be time-consuming. This script provides a quick and simple way to list resources from commonly used AWS services directly from the terminal.

It is designed for:
- DevOps Engineers
- Cloud Engineers
- AWS Beginners
- System Administrators
- Anyone learning Bash scripting and AWS CLI

---

## ✨ Features

- 🔹 Lists AWS resources using AWS CLI
- 🔹 Supports multiple AWS services
- 🔹 Simple command-line interface
- 🔹 Lightweight and easy to customize
- 🔹 Beginner-friendly Bash script

---

## 📦 Supported AWS Services

| Service | Description |
|----------|-------------|
| EC2 | List EC2 Instances |
| RDS | List RDS Databases |
| S3 | List S3 Buckets |
| CloudFront | List CloudFront Distributions |
| VPC | List Virtual Private Clouds |
| IAM | List IAM Users |
| Route53 | List Hosted Zones |
| CloudWatch | List CloudWatch Alarms |
| CloudFormation | List CloudFormation Stacks |
| Lambda | List Lambda Functions |
| SNS | List SNS Topics |
| SQS | List SQS Queues |
| DynamoDB | List DynamoDB Tables |
| EBS | List EBS Volumes |

---

## 📋 Prerequisites

Before using the script, ensure you have:

- Bash Shell
- AWS CLI installed
- AWS CLI configured
- AWS account with valid credentials
- Appropriate IAM permissions

Verify AWS CLI installation:

```bash
aws --version
```

Verify AWS configuration:

```bash
aws configure
```

---

## 📂 Project Structure

```
AWS_Resource_List/
│
├── aws_resource_list.sh
└── README.md
```

---

## ⚙️ Installation

Clone the repository:

```bash
git clone https://github.com/Shubham-Stunner/AWS_Resource_List.git
```

Navigate into the project directory:

```bash
cd AWS_Resource_List
```

Make the script executable:

```bash
chmod +x aws_resource_list.sh
```

---

## 🚀 Usage

```bash
./aws_resource_list.sh <aws-region> <service-name>
```

### Example

List EC2 instances:

```bash
./aws_resource_list.sh us-east-1 ec2
```

List S3 buckets:

```bash
./aws_resource_list.sh us-east-1 s3
```

List Lambda functions:

```bash
./aws_resource_list.sh ap-south-1 lambda
```

---

## 📝 Supported Service Names

Use any of the following service names as the second argument:

```text
ec2
rds
s3
cloudfront
vpc
iam
route53
cloudwatch
cloudformation
lambda
sns
sqs
dynamodb
ebs
```

---

## 💡 Example Output

```bash
$ ./aws_resource_list.sh us-east-1 ec2

Listing EC2 Instances in us-east-1

{
    "Reservations": [
        ...
    ]
}
```

---

## ⚠️ Notes

- Ensure AWS CLI is configured before running the script.
- Some AWS services (such as IAM, Route53, and S3) are global services, so the region parameter may not affect the output.
- The IAM user or role executing the script must have sufficient permissions to access the requested AWS service.

---

## 🛣️ Future Enhancements

- [ ] Add support for more AWS services
- [ ] Export output to CSV
- [ ] Export output to JSON
- [ ] Add colored terminal output
- [ ] Display results in table format
- [ ] Interactive menu for selecting services
- [ ] List all supported services with a single command
- [ ] Error handling for invalid AWS regions

---

## 🤝 Contributing

Contributions are welcome!

If you'd like to improve this project:

1. Fork the repository
2. Create a feature branch

```bash
git checkout -b feature-name
```

3. Commit your changes

```bash
git commit -m "Add new feature"
```

4. Push to your branch

```bash
git push origin feature-name
```

5. Open a Pull Request

---

## 📜 License

This project is licensed under the MIT License.

---

## 👨‍💻 Author

**Shubham Mukherjee**

- GitHub: https://github.com/Shubham-Stunner

⭐ If you found this project useful, don't forget to star the repository!