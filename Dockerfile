FROM adoptopenjdk/openjdk8:alpine-slim

RUN adduser -D ofuser 
USER ofuser

ENV OF_VERSION=4.3.2
ENV OF_FILE_VERSION=4_3_2

RUN cd /home/ofuser \
    && wget https://github.com/igniterealtime/Openfire/releases/download/v${OF_VERSION}/openfire_${OF_FILE_VERSION}.tar.gz -O openfire.tar.gz\
    && tar zxf openfire.tar.gz \
    && rm -rf openfire.tar.gz

WORKDIR /home/ofuser/openfire/bin/ 

EXPOSE 5222 9090 9091

CMD [ "./openfire", "run" ]