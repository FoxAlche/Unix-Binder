FROM ubuntu:22.04

# Avoid interactive prompts and set timezone to Kuala Lumpur
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kuala_Lumpur

# Install core Unix tools, nano, Python, and R
RUN apt-get update && apt-get install -y \
    tzdata \
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
    software-properties-common \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    r-base \
    && apt-get clean

# Install IRkernel for Jupyter R support
RUN R -e "install.packages('IRkernel', repos='http://cran.us.r-project.org'); IRkernel::installspec(user = FALSE)"

# Add a user and set up environment
RUN useradd -ms /bin/bash user
USER user
WORKDIR /home/user

CMD ["/bin/bash"]
