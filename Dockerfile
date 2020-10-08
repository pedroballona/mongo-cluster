FROM mongo:latest
WORKDIR /app
RUN mkdir -p /var/data/db1
RUN mkdir -p /var/data/db2
RUN mkdir -p /var/data/db3
COPY run.sh .
EXPOSE 27017
EXPOSE 27018
EXPOSE 27019
ENTRYPOINT [ "./run.sh" ]
