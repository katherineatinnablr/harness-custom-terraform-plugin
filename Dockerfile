FROM plugins/harness_terraform_vm:0.94.0
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
RUN aws --version
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
RUN chmod +x kubectl
RUN mkdir -p ~/.local/bin
RUN mv ./kubectl ~/.local/bin/kubectl
RUN curl -LO "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv5.3.0/kustomize_v5.3.0_linux_amd64.tar.gz" \
    && tar xzf kustomize_v5.3.0_linux_amd64.tar.gz \
    && mv kustomize /usr/local/bin/kustomize \
    && rm kustomize_v5.3.0_linux_amd64.tar.gz
RUN curl "https://releases.hashicorp.com/terraform/0.12.31/terraform_0.12.31_linux_amd64.zip" -o "tf012.zip"
RUN unzip tf012.zip
RUN install -o root -g root -m 0755 terraform /usr/local/bin/terraform
RUN terraform version