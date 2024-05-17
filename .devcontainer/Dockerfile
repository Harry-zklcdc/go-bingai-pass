FROM ubuntu:latest

WORKDIR /app

RUN apt-get update && apt-get install -y curl && \
    curl -L https://github.com/Harry-zklcdc/go-bingai-pass/releases/latest/download/go-bingai-pass-linux-amd64.tar.gz -o go-bingai-pass-linux.tar.gz && \
    tar -zxvf go-bingai-pass-linux.tar.gz && \
    chmod +x go-bingai-pass && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm go-bingai-pass-linux.tar.gz

ENV PORT=7860

EXPOSE 7860

CMD /app/go-bingai-pass