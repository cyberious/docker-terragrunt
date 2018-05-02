FROM alpine:latest
MAINTAINER "cyberious"

ENV TERRAFORM_VERSION=0.11.2
ENV TERRAFORM_SHA256SUM=f728fa73ff2a4c4235a28de4019802531758c7c090b6ca4c024d48063ab8537b

RUN apk add --update --no-cache git curl openssh bash jq && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    sha256sum -cs terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin && \
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip
RUN curl -sL https://github.com/gruntwork-io/terragrunt/releases/download/v0.13.24/terragrunt_linux_amd64 -o /bin/terragrunt && \
    chmod +x /bin/terragrunt
