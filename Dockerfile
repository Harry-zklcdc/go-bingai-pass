FROM ubuntu:latest

ARG TARGETARCH

ENV GBP_USER ${GBP_USER:-ubuntu}
ENV GBP_USER_ID ${GBP_USER_ID:-1000}

WORKDIR /app

USER root

RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates

RUN curl -L https://github.com/Harry-zklcdc/go-bingai-pass/releases/latest/download/go-bingai-pass-linux-${TARGETARCH}.tar.gz -o go-bingai-pass-linux.tar.gz && \
    tar -zxvf go-bingai-pass-linux.tar.gz && \
    chmod +x go-bingai-pass

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm go-bingai-pass-linux.tar.gz

USER $GBP_USER

ENV PORT=7860

EXPOSE 7860

CMD /app/go-bingai-pass