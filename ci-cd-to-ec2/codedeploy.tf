resource "aws_codedeploy_app" "nodejs_app" {
  name = "NodejsApp"
  compute_platform = "Server"
}

resource "aws_codedeploy_deployment_group" "nodejs_deployment_group" {
  app_name              = aws_codedeploy_app.nodejs_app.name
  deployment_group_name = "NodejsAppDeploymentGroup"
  service_role_arn      = aws_iam_role.codedeploy_role.arn
  deployment_config_name = "CodeDeployDefault.OneAtATime"

  ec2_tag_set {
    ec2_tag_filter {
      key   = "Environment"
      type  = "KEY_AND_VALUE"
      value = "Dev"
    }
  }

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

  deployment_style {
  deployment_type   = "IN_PLACE"
  deployment_option = "WITHOUT_TRAFFIC_CONTROL"
}

  load_balancer_info {
    # Opsiyonel: Eğer ELB varsa buraya eklenebilir
  }

  alarm_configuration {
    enabled = false
    ignore_poll_alarm_failure = false
    # CloudWatch alarm ekleyeceksek burası açılır
  }

  autoscaling_groups = []
}
