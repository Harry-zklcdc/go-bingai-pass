FROM ubuntu:22.04

WORKDIR /app

RUN apt-get update && apt-get install -y wget curl && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt install -y ./google-chrome-stable_current_amd64.deb && \
    curl -L $(curl -s  https://api.github.com/repos/Harry-zklcdc/go-bingai-pass/releases/latest | grep /go-bingai-pass-linux-amd64.tar.gz | cut -d '"' -f 4) -o go-bingai-pass-linux-amd64.tar.gz && \
    tar -zxvf go-bingai-pass-linux-amd64.tar.gz && \
    chmod +x go-bingai-pass && \
    rm google-chrome-stable_current_amd64.deb go-bingai-pass-linux-amd64.tar.gz && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

ENV PORT=8080
ENV BROWSER_BINARY=/opt/google/chrome/google-chrome
ENV PASS_TIMEOUT=10

EXPOSE 8080

CMD ["/app/go-bingai-pass"]