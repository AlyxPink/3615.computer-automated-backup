FROM restic/restic:0.16.4

RUN apk add --no-cache \
    postgresql

COPY backup.sh backup.sh

ENTRYPOINT [ "./backup.sh" ]
