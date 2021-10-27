#### Get the plan on PR using Github actions (check .github/workflows/deploy.yml)

![alt text](https://github.com/vivekyad4v/terraform-github-actions-cicd-skeleton/blob/main/terraform-github-actions-cicd-skeleton.png?raw=true)

#### Check github actions workflow 
URL - https://github.com/vivekyad4v/terraform-github-actions-cicd-skeleton/blob/main/.github/workflows/deploy.yml

## Run Terraform on local

#### Setup Auth 
```
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export AWS_SESSION_TOKEN=""
export AWS_DEFAULT_REGION=ap-southeast-1
export ACCOUNT_ID=xxxxx
export ENVIRON=stg
```

#### Github repo secrets to be populated for each environment (not required for local setup)
```
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
ASSUME_ROLE_ARN
AWS_ACCOUNT_ID
ENVIRON
```

#### Setup required application/TF environment variables
```
export TF_VAR_region="$AWS_DEFAULT_REGION" \
       PROJECT=$(basename $PWD) \
       TF_VAR_environ="$ENVIRON" \
       TF_VAR_project="$PROJECT" \
       TF_VAR_s3_bucket_name="vorg-$ENVIRON-tf-rss-$ACCOUNT_ID-$AWS_DEFAULT_REGION" \
       TF_VAR_dynamodb_table_name="vorg-$ENVIRON-tf-rslt-$AWS_DEFAULT_REGION"
```

#### Runtime CLIs
```
./terraform init \
     -backend-config "bucket=${TF_VAR_s3_bucket_name}" \
     -backend-config "dynamodb_table=${TF_VAR_dynamodb_table_name}" \
     -backend-config "region=${TF_VAR_region}" \
     -backend-config "key=${TF_VAR_project}/${TF_VAR_environ}.tfstate" \
     -backend=true
```

#### Push changes to the environment 
- Create a new branch with name `stg-$JIRA_ID-$FEATURE`.
- Create a PR against `stg` branch.
- PR will automatically get the `Terraform plan` output in the comment.
- If the plan output looks good, merge it with `stg` branch.
- To push in Production, create a PR from `stg` to `main` branch.
- Review the output in the PR comment. If it looks good, merge the PR.
