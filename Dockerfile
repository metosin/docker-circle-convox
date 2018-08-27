FROM alpine:latest

RUN apk add --update curl && \
    rm -rf /var/cache/apk/*

# https://www.musl-libc.org/faq.html (glibc and musl only partially binary compatible)
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

RUN curl -L https://convox.com/cli/linux/convox -o /tmp/convox
RUN mv /tmp/convox /usr/local/bin/convox
RUN chmod 755 /usr/local/bin/convox
