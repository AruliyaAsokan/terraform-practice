# EC2 CPU Alarm

Terraform that creates an EC2 instance, a CloudWatch alarm on CPU usage, and an
SNS email alert. The instance loads its own CPU at boot so the alarm can be
tested without logging in.

## Usage

    cp example.tfvars terraform.tfvars   # then edit it
    terraform init
    terraform apply

Confirm the SNS subscription email before testing. Run `terraform destroy` when
finished.

## Variables

| Name | Default | Purpose |
|------|---------|---------|
| region | ap-south-1 | AWS region |
| alert_email | — | Address that receives alarm emails |
| cpu_threshold | 60 | CPU percent that triggers the alarm |
| evaluation_periods | 2 | Breaching periods before it fires |

---