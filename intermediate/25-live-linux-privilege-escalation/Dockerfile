FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends openssh-server sudo findutils ca-certificates && rm -rf /var/lib/apt/lists/*
RUN useradd -m -s /bin/bash student && echo 'student:cyberlabs' | chpasswd \
 && mkdir -p /run/sshd /opt/training \
 && printf 'student ALL=(root) NOPASSWD: /usr/bin/find\n' > /etc/sudoers.d/cyberlabs-training \
 && chmod 0440 /etc/sudoers.d/cyberlabs-training \
 && printf 'Welcome to the CyberLabs training workstation.\n' > /opt/training/notice.txt \
 && chmod 755 /opt/training && chmod 644 /opt/training/notice.txt \
 && ssh-keygen -A
RUN printf 'PasswordAuthentication yes\nPermitRootLogin no\nAllowUsers student\nUsePAM yes\n' > /etc/ssh/sshd_config.d/99-cyberlabs.conf
COPY entrypoint.sh /usr/local/bin/lab-entrypoint
RUN chmod 755 /usr/local/bin/lab-entrypoint
EXPOSE 22
ENTRYPOINT ["/usr/local/bin/lab-entrypoint"]
