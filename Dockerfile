FROM hashicorp/terraform
MAINTAINER "cyberious"

RUN apk add --update --no-cache git curl openssh bash jq

RUN TG_VERSION=`curl -sL  https://api.github.com/repos/gruntwork-io/terragrunt/releases/latest | jq -r .tag_name` && \
    echo "Building with Terragrunt Version ${TG_VERSION}" && \
    curl -sL https://github.com/gruntwork-io/terragrunt/releases/download/${TG_VERSION}/terragrunt_linux_amd64 -o /bin/terragrunt && \
    chmod +x /bin/terragrunt

ENTRYPOINT []
