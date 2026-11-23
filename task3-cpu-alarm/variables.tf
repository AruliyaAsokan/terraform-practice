variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "alert_email" {
  type        = string
  description = "Email that receives the alarm"
}

variable "cpu_threshold" {
  type    = number
  default = 60
}
variable "evaluation_periods" {
  type        = number
  description = "Consecutive breaching periods before the alarm fires"
  default     = 2
}