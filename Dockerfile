FROM adoptopenjdk/openjdk11

ENV OPENFIRE_VERSION=4.3.0 \
    OPENFIRE_VERSION_=4_3_0

RUN adduser --disabled-login openfire
USER openfire

RUN apt-get update && cd /opt \
    && curl -OL https://github.com/igniterealtime/Openfire/releases/download/v${OPENFIRE_VERSION}/openfire_${OPENFIRE_VERSION_}.tar.gz \
    && tar -xzvf openfire_${OPENFIRE_VERSION_}.tar.gz \
    && rm -rf openfire_${OPENFIRE_VERSION_}.tar.gz

WORKDIR /opt/openfire/bin

EXPOSE 3478/tcp 3479/tcp 5222/tcp 5223/tcp 5229/tcp 5275/tcp 5276/tcp 5262/tcp 5263/tcp 7070/tcp 7443/tcp 7777/tcp 9090/tcp 9091/tcp

CMD [ "./openfire", "run" ]