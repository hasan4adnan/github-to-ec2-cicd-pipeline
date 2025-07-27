output "artifact_bucket_name" {
  description = "S3 bucket used for storing build artifacts"
  value       = aws_s3_bucket.artifact_bucket.bucket
}

output "codepipeline_name" {
  description = "The name of the CodePipeline"
  value       = aws_codepipeline.cicd_pipeline.name
}

output "codebuild_project_name" {
  description = "The name of the CodeBuild project"
  value       = aws_codebuild_project.nodejs_build.name
}

output "codedeploy_app_name" {
  description = "CodeDeploy application name"
  value       = aws_codedeploy_app.nodejs_app.name
}

output "codedeploy_deployment_group" {
  description = "Deployment group name"
  value       = aws_codedeploy_deployment_group.nodejs_deployment_group.deployment_group_name
}
