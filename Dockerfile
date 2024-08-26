FROM restic/restic:0.17.0

RUN apk add --no-cache \
    postgresql

COPY backup.sh backup.sh

ENTRYPOINT [ "./backup.sh" ]
