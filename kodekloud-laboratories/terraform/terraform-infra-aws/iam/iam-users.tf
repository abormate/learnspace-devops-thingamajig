resource "aws_iam_user" "users" {
    name = "mary"
    count = length(var.project-sapphire-users)
}
