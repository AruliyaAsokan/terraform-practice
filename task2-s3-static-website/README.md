# Task 2: S3 Static Website Hosting with Terraform

Hosted a static website on Amazon S3 using Terraform.

### What I did
- Created an S3 bucket using Terraform.
- Enabled static website hosting.
- Uploaded `index.html` using Terraform.
- Configured public access settings and a bucket policy for public read access.
- Accessed and tested the website using the S3 website endpoint.

### AWS Services & Tools
- Amazon S3
- Terraform
- AWS CLI

### Terraform Commands
```bash
terraform init
terraform validate
terraform plan
terraform apply
```

To delete the resources:

```bash
terraform destroy
```

### Note
The bucket is configured for public read access to serve the website. No sensitive data should be stored in it.