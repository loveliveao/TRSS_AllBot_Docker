FROM menci/archlinuxarm:latest
ENV LANG=zh_CN.UTF-8 TERM=xterm-256color
WORKDIR /root
RUN ln -vsf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "LANG=zh_CN.UTF-8">/etc/locale.conf
RUN echo "zh_CN.UTF-8 UTF-8">/etc/locale.gen
RUN locale-gen
RUN pacman -Sy --noconfirm git
RUN git clone https://gitee.com/TimeRainStarSky/TRSS_AllBot.git /root/TRSS_AllBot
WORKDIR /root/TRSS_AllBot
RUN bash Install.sh
RUN tsab

CMD ["bash", "-c", "tsab"]

EXPOSE 2536 8080-8081 8088 13579 50831 54980
