# iOS Sandbox image — Alpine 3.21 riscv64 with pre-installed tools.
#
# This image is converted to a TinyEMU RISC-V Wasm module via container2wasm.
# Network access is NOT available at runtime on iOS (WAMR networking is WIP),
# so all required packages must be installed here at build time.
#
# To rebuild the Wasm artefact:
#   cd scripts/ios-sandbox && ./build.sh
FROM riscv64/alpine:3.21

# Pre-install tools needed by the agent.
# curl/wget are included for local file operations (no outbound internet at runtime).
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
WORKDIR /root
