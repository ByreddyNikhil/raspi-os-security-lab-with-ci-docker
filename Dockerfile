FROM debian:bullseye

ENV container docker

RUN apt-get update &&         apt-get install -y systemd systemd-sysv debootstrap build-essential         git udev &&         apt-get clean &&         rm -rf /var/lib/apt/lists/*

VOLUME [ "/sys/fs/cgroup" ]
CMD ["/sbin/init"]
