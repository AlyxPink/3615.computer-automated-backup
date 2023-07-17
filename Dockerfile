FROM restic/restic:0.15.2

RUN apk add --no-cache \
    postgresql

COPY backup.sh backup.sh

ENTRYPOINT [ "./backup.sh" ]
