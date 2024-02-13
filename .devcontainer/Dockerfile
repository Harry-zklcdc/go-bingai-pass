FROM zklcdc/go-bingai-pass:latest

RUN wget https://github.com/Harry-zklcdc/go-proxy-bingai/releases/latest/download/go-proxy-bingai-linux-amd64.tar.gz -O go-proxy-bingai-linux-amd64.tar.gz && \
    tar -zxvf go-proxy-bingai-linux-amd64.tar.gz && \
    chmod +x go-proxy-bingai

RUN wget https://github.com/Harry-zklcdc/go-bingai-pass/releases/latest/download/go-bingai-pass-linux-amd64.tar.gz -O go-bingai-pass-linux-amd64.tar.gz && \
    tar -zxvf go-bingai-pass-linux-amd64.tar.gz && \
    chmod +x go-bingai-pass

RUN rm go-bingai-pass-linux-amd64.tar.gz go-proxy-bingai-linux-amd64.tar.gz