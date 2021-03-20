FROM kalilinux/kali-rolling
RUN apt-get -y update
RUN apt-get install -y sudo
RUN apt-get install -y man-db exploitdb
RUN apt-get install -y tcpdump iputils-ping
RUN apt-get install -y tshark
RUN apt-get install -y hping3
ARG username
RUN useradd -rm -d /home/$username -s /bin/bash -g root -G sudo -u 1001 $username
# remove the user password
RUN passwd -d $username
USER $username
WORKDIR /home/$username
CMD ["/bin/bash"]
