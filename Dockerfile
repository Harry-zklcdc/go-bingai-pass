FROM selenium/node-edge

ENV GBP_USER ${GBP_USER:-gbp}
ENV GBP_USER_ID ${GBP_USER_ID:-1000}

WORKDIR /app

USER root

RUN apt-get update && apt-get install -y curl wget && \
    curl -L $(curl -s  https://api.github.com/repos/Harry-zklcdc/go-bingai-pass/releases/latest | grep /go-bingai-pass-linux-amd64.tar.gz | cut -d '"' -f 4) -o go-bingai-pass-linux-amd64.tar.gz && \
    tar -zxvf go-bingai-pass-linux-amd64.tar.gz && \
    chmod +x go-bingai-pass

RUN apt-get remove -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm go-bingai-pass-linux-amd64.tar.gz

COPY supervisor.conf /etc/supervisor/conf.d/selenium.conf

RUN groupadd -g $GBP_USER_ID $GBP_USER
RUN useradd -rm -G sudo -u $GBP_USER_ID -g $GBP_USER_ID $GBP_USER

RUN mkdir -p /tmp/edge
RUN chown "${GBP_USER_ID}:${GBP_USER_ID}" /var/run/supervisor /var/log/supervisor
RUN chown -R "${GBP_USER_ID}:${GBP_USER_ID}" /app /tmp/edge
RUN chmod 777 /tmp

USER $GBP_USER

ENV PORT=7860
ENV BROWSER_BINARY=/usr/bin/microsoft-edge
# ENV PASS_TIMEOUT=10
# ENV CHROME_PATH=/opt/google/chrome
ENV XDG_CONFIG_HOME=/tmp/edge
ENV XDG_CACHE_HOME=/tmp/edge

EXPOSE 7860