resource "aws_iam_user" "developer" {
    name = split(":", var.cloud_users)[count.index]
    count = length(split(":", var.cloud_users))
}
