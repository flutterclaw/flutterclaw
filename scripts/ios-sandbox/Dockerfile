# iOS Sandbox image — Alpine 3.21 riscv64 with pre-installed tools.
#
# This image is converted to a TinyEMU RISC-V Wasm module via container2wasm.
# Network access is provided at runtime by gvisor-tap-vsock (virtual subnet
# 192.168.127.0/24, gateway at .1, guest at .3).
#
# DNS is configured at runtime via /etc/resolv.conf (Google + Cloudflare).
#
# To rebuild the Wasm artefact:
#   cd scripts/ios-sandbox && ./build.sh
FROM riscv64/alpine:3.21

# Pre-install tools needed by the agent.
# Additional packages can be installed at runtime via `apk add`.
RUN apk add --no-cache \
    python3 \
    py3-pip \
    git \
    curl \
    wget \
    jq \
    bash \
    file

# Working directory for the agent.
RUN mkdir -p /root && echo 'export PS1="[\u@ios-sandbox \W]\$ "' >> /root/.bashrc

# DNS configuration (runtime) — use Google DNS (8.8.8.8) + Cloudflare (1.1.1.1).
# Alpine's /etc/resolv.conf is writable at runtime (not during build).
RUN echo '#!/bin/sh' > /usr/local/bin/init-dns && \
    echo 'if [ ! -s /etc/resolv.conf ] || ! grep -q "8.8.8.8" /etc/resolv.conf; then' >> /usr/local/bin/init-dns && \
    echo '  echo "nameserver 8.8.8.8" > /etc/resolv.conf' >> /usr/local/bin/init-dns && \
    echo '  echo "nameserver 1.1.1.1" >> /etc/resolv.conf' >> /usr/local/bin/init-dns && \
    echo 'fi' >> /usr/local/bin/init-dns && \
    chmod +x /usr/local/bin/init-dns && \
    echo '/usr/local/bin/init-dns 2>/dev/null || true' >> /root/.bashrc

WORKDIR /root
