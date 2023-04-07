FROM ubuntu:22.04

RUN apt update && apt install openssh-server python3 wget cmake build-essential -y

RUN ln /usr/bin/python3 /usr/bin/python
RUN mkdir -p /opt/mooshak
WORKDIR /opt/mooshak


# BadVPN
RUN wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/badvpn/badvpn-1.999.128.tar.bz2 && \
        tar xf badvpn-1.999.128.tar.bz2 && \
	cd badvpn-1.999.128/ && \
	mkdir -p build && cd build && \
	cmake .. -DCMAKE_INSTALL_PREFIX=out -DBUILD_NOTHING_BY_DEFAULT=1 -DBUILD_UDPGW=1 && \
	make install && \
	chmod +x out/bin/badvpn-udpgw &&\
	mv out/bin/badvpn-udpgw /usr/bin/

COPY files/run-udpgw.sh /opt/mooshak/
ENV UDPG_MAX_CLIENTS=20

# Setting up SSH related details
EXPOSE 22
COPY files/entrypoint.sh /opt/mooshak/
COPY files/ssh.sh /opt/mooshak/
COPY files/adduser.sh /opt/mooshak/
COPY files/deleteuser.sh /opt/mooshak/
COPY files/sshd_config /etc/ssh/sshd_config
COPY files/banner /etc/motd

# Updating ownership and setting enterypoint
RUN chmod 750 / && chown -R root /opt/mooshak && chmod 755 /opt/mooshak
RUN systemd-tmpfiles --create && service ssh stop && mkdir /var/run/sshd
CMD ["/opt/mooshak/entrypoint.sh"]

