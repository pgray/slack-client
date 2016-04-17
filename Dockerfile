FROM ubuntu

ENV DEV slacker

ENV HOME /home/$DEV
ENV XAUTHORITY /home/$DEV/.Xauthority

RUN apt-get update && apt-get install xauth wget -yy && wget https://downloads.slack-edge.com/linux_releases/slack-desktop-2.0.3-amd64.deb

RUN dpkg -i *.deb || apt-get install -f -yy && dpkg -i *.deb

RUN export uid=1000 gid=1000 \
	&& mkdir -p /home/$DEV \
	&& echo "$DEV:x:${uid}:${gid}:Developer,,,:/home/$DEV:/bin/bash" >> /etc/passwd && \
	echo "$DEV:x:${uid}:" >> /etc/group && \
	echo "$DEV ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$DEV && \
	chmod 0440 /etc/sudoers.d/$DEV && \
	chown ${uid}:${gid} -R /home/$DEV

USER $DEV

VOLUME /home/$DEV

ENTRYPOINT cd && echo "$(xauth add $xauthcookie)" && slack
