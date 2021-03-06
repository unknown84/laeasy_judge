FROM ubuntu:16.04

ENV WDIR /laeasy_judge
ENV RDIR /laeasy_judge
COPY laeasy_judge $WDIR/

RUN sed -i "s/http:\/\/archive.ubuntu.com/http:\/\/kr.archive.ubuntu.com/g" /etc/apt/sources.list

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y python2.7 python-pip
RUN pip install flask
RUN echo "flag is HCAMP{flag in real server, this is not flag}" > /flag
# Easy to Hack
# RUN chmod 400 /flag

RUN chmod 1733 /tmp /var/tmp /dev/shm
RUN chmod 1733 /proc
RUN chmod 600 $WDIR
RUN chmod +x $WDIR/start.sh

CMD ["/laeasy_judge/start.sh"]

EXPOSE 2222