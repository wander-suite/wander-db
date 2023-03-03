FROM postgres

COPY ./postgres/ /docker-entrypoint-initdb.d/
EXPOSE 5432