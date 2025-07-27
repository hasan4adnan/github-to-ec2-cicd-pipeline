resource "aws_codebuild_project" "nodejs_build" {
  name          = "NodejsBuildProject"
  description   = "Build project for Node.js CI/CD"
  build_timeout = 10
  service_role  = aws_iam_role.codebuild_role.arn

  artifacts {
    type = "S3"
    location = aws_s3_bucket.artifact_bucket.bucket
    packaging = "ZIP"
    path = "build-output"
    name = "nodejs-build-artifact.zip"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:7.0" # Node.js 18 içeren imaj
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    environment_variable {
      name  = "ENV"
      value = "dev"
    }

  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/hasan4adnan/github-to-ec2-cicd-pipeline.git"
    buildspec       = "buildspec.yml"
    git_clone_depth = 1
  }

  tags = {
    Environment = "Dev"
    Project     = "GitHub to EC2"
  }
}
