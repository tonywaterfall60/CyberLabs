FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y --no-install-recommends openssh-server curl iproute2 && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /run/sshd && useradd -m -s /bin/bash trainee && echo 'trainee:training-only' | chpasswd
RUN printf '\nAllowTcpForwarding yes\nPasswordAuthentication yes\nPermitRootLogin no\n' >> /etc/ssh/sshd_config
CMD ["/usr/sbin/sshd","-D","-e"]
