FROM maven:3-jdk-8

ENV HOMEDIR /chappie

WORKDIR $HOMEDIR

ADD ./entrypoint.sh /

RUN useradd -d $HOMEDIR chappie

RUN mkdir -p $HOMEDIR && chown -R chappie $HOMEDIR

USER chappie

RUN git clone https://github.com/chappie-chatbot/chappie-common.git chappie-common \
    && git clone https://github.com/chappie-chatbot/chappie-webui.git chappie-webui \
    && git clone https://github.com/chappie-chatbot/chappie-server.git chappie-server


ENTRYPOINT ["/entrypoint.sh"]

