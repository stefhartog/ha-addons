ARG BUILD_FROM=ghcr.io/home-assistant/base:latest

FROM ${BUILD_FROM}

# Install Python, git and build essentials
RUN apk add --no-cache \
    python3 \
    py3-pip \
    build-base \
    python3-dev \
    git

# Clone snoozefest source and install
RUN git clone https://github.com/stefhartog/snoozefest.git /app
WORKDIR /app
RUN pip install --no-cache-dir -e .

# Copy addon entry point
COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
