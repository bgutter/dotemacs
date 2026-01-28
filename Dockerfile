# Dockerfile for Brandon's Emacs Configuration
# Provides a consistent development environment with all prerequisites

FROM silex/emacs:29.4-ci-cask

# Install system dependencies
RUN apt-get update && apt-get install -y \
    imagemagick \
    silversearcher-ag \
    sane-utils \
    python3 \
    python3-pip \
    python3-venv \
    git \
    curl \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Set up working directory
WORKDIR /root/.emacs.d

# Create emacs-config directory
RUN mkdir -p /root/.emacs.d/emacs-config

# Copy configuration files
COPY . /root/.emacs.d/emacs-config/

# Copy init files to the correct location
COPY example-init.el /root/.emacs.d/init.el
COPY early-init.el /root/.emacs.d/early-init.el
COPY custom.el /root/.emacs.d/emacs-config/custom.el

# Set up Python virtual environment with required packages
RUN python3 -m venv /root/.emacs.d/emacs-venv && \
    /root/.emacs.d/emacs-venv/bin/pip install --upgrade pip && \
    /root/.emacs.d/emacs-venv/bin/pip install -r /root/.emacs.d/emacs-config/emacs-python-venv-requirements.txt

# Create directory for persistent data
RUN mkdir -p /root/.emacs.d/elpa

# Set environment variables
ENV TERM=xterm-256color
ENV LANG=en_US.UTF-8

# Pre-install Emacs packages (this will happen on first run but we can cache it)
# Note: This may take a while and some packages might fail without X11, which is okay
RUN emacs --batch --eval "(message \"Emacs Docker image ready\")" || true

# Expose any ports if needed (for example, if using emacs server)
EXPOSE 80

# Default command - start Emacs in terminal mode
# Users can override this to run in daemon mode or GUI mode with X11 forwarding
CMD ["emacs", "-nw"]
