FROM plugins/harness_terraform
RUN apk --no-cache add aws-cli
RUN aws --version
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
RUN chmod +x kubectl
RUN mkdir -p ~/.local/bin
RUN mv ./kubectl ~/.local/bin/kubectl