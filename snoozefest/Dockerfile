ARG BUILD_FROM=ghcr.io/home-assistant/base:latest

FROM ${BUILD_FROM}

# Install Python, git and build essentials
RUN apk add --no-cache \
    python3 \
    py3-pip \
    build-base \
    python3-dev \
    git

# Cache-bust source clone when add-on version changes in config.yaml.
COPY config.yaml /tmp/addon-config.yaml

# Clone snoozefest source and install
RUN git clone https://github.com/stefhartog/snoozefest.git /app \
    && git -C /app rev-parse HEAD
WORKDIR /app
RUN pip install --no-cache-dir --break-system-packages .

# Copy addon entry point
COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
