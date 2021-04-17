FROM frolvlad/alpine-glibc

RUN apk update \
 && mkdir /root/Downloads \
 && cd /root/Downloads \
 && apk add curl groff less \
 && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
 && unzip awscliv2.zip \
 && ./aws/install \
 && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
 && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

RUN cd / \
 && rm -Rf /root/Downloads

ENTRYPOINT ["kubectl"]
