# Get OMPSs
FROM bscpm/ompss:latest

# Install Rust
RUN curl https://sh.rustup.rs -sSf > rustup.sh
RUN sh rustup.sh -y
ENV PATH="/root/.cargo/bin:$PATH"

# Clone Repos
RUN mkdir /deps
WORKDIR /deps

# Install bench
RUN apt update
RUN apt install libssl-dev -y
RUN git clone https://github.com/elUrso/bench.git
WORKDIR /deps/bench
RUN cargo install
WORKDIR /deps

WORKDIR /

# Copy Files
COPY . /src
