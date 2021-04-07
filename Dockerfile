FROM debian:bullseye-slim

RUN apt -y update && \
	apt upgrade -y && \
	apt install -y apt-transport-https wget gpg && \
	echo "deb     [arch=amd64] https://deb.torproject.org/torproject.org bullseye main" >/etc/apt/sources.list.d/tor && \
	echo "deb-src [arch=amd64] https://deb.torproject.org/torproject.org bullseye main" >/etc/apt/sources.list.d/tor && \
	wget -qO- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --import && \
	gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add -

RUN apt -y update && \
	apt -y install tor nyx

COPY torrc /etc/tor/torrc

CMD ["tor", "-f", "/etc/tor/torrc"]

