FROM ubuntu:20.04

RUN apt-get update && apt-get install --no-install-recommends -y locales

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="en_US.UTF-8"' > /etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN yes | unminimize

RUN apt-get install --no-install-recommends -y \
  locales man-db libc6-i386 lib32stdc++6 vim less binutils ltrace strace gdb radare2

WORKDIR /target

CMD [ "/bin/bash" ]