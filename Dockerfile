# ============================================================================
# Dockerfile - Reproducible build environment for the Polygeist-GVSoC toolchain
#
# Includes all system dependencies needed by setup.sh:
#   - GCC 12 (for pulp-llvm / LLVM 15)
#   - GCC 14 (for Polygeist / LLVM 18 and GVSoC)
#   - CMake, Ninja, Python 3 + pip + venv
#   - zlib, libdl, pthreads (for GVSoC)
#   - All Python packages required by GVSoC submodules
#
# Usage:
#   docker build -t polygeist-gvsoc .
#   docker run -it polygeist-gvsoc            # run setup.sh interactively
#   docker run -it -v $(pwd):/workspace polygeist-gvsoc  # mount host sources
# ============================================================================

FROM ubuntu:24.04

LABEL maintainer="kush3012"
LABEL description="Build environment for Polygeist (LLVM 18) + pulp-llvm (LLVM 15) + GVSoC toolchain"

# Prevent interactive prompts during apt installs
ENV DEBIAN_FRONTEND=noninteractive

# ============================================================================
# 1. Core build tools
# ============================================================================
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        ninja-build \
        git \
        ca-certificates \
        curl \
        wget \
    && rm -rf /var/lib/apt/lists/*

# ============================================================================
# 2. GCC 12 (required by pulp-llvm / LLVM 15) and GCC 14 (required by
#    Polygeist / LLVM 18 and GVSoC). Ubuntu 24.04 ships GCC 13 by default,
#    so we install both 12 and 14 explicitly.
# ============================================================================
RUN apt-get update && apt-get install -y --no-install-recommends \
        gcc-12 g++-12 \
        gcc-14 g++-14 \
    && rm -rf /var/lib/apt/lists/*

# ============================================================================
# 3. Python 3 + pip + venv (for GVSoC build system and its submodules)
# ============================================================================
RUN apt-get update && apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        python3-venv \
        python3-dev \
    && rm -rf /var/lib/apt/lists/*

# ============================================================================
# 4. C/C++ libraries required by GVSoC at build/link time
# ============================================================================
RUN apt-get update && apt-get install -y --no-install-recommends \
        zlib1g-dev \
        libpthread-stubs0-dev \
        ccache \
    && rm -rf /var/lib/apt/lists/*

# ============================================================================
# 5. Python packages required by GVSoC and its submodules
#    (consolidated from all requirements.txt files under gvsoc/)
# ============================================================================
RUN pip3 install --break-system-packages \
        "setuptools<70.0.0" \
        pyelftools \
        six \
        pytablewriter \
        pandas \
        matplotlib \
        hjson \
        tabulate \
        mako \
        pyyaml \
        jsonschema \
        colorlog \
        lxml \
        pyrsistent \
        networkx \
        scipy \
        argparse \
        prettytable \
        pexpect \
        lz4 \
        pycryptodome \
        ppk2_api \
        rich \
        psutil \
        pyserial \
        markdown-it-py \
        pygments \
        beautifulsoup4 \
        html2text \
        marko \
        mistune

# ============================================================================
# 6. Workspace setup
# ============================================================================
WORKDIR /workspace

# Copy project files (excluding large build dirs via .dockerignore)
COPY . .

# Make scripts executable
RUN chmod +x setup.sh toolchain.sh run_pulp.sh peStats.sh 2>/dev/null || true

# ============================================================================
# Default: drop into bash so the user can run ./setup.sh
# ============================================================================
CMD ["/bin/bash"]
