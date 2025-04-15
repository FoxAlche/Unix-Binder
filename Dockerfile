FROM ubuntu:22.04

# Install core Unix tools, nano, and Python
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
    curl \
    wget \
    vim \
    nano \
    bash \
    build-essential \
    ca-certificates \
    && apt-get clean

# Add a user and set up environment
RUN useradd -ms /bin/bash user
USER user
WORKDIR /home/user

CMD ["/bin/bash"]
