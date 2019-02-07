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
RUN git clone https://github.com/dylanaraps/neofetch.git
WORKDIR /deps/neofetch
RUN make install
WORKDIR /deps

WORKDIR /

# Install nano
RUN apt install nano -y

# Copy Files
COPY ./src/taskdep-suit /src

WORKDIR /src