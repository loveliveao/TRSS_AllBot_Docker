# 使用menci/archlinuxarm:latest作为底包
FROM menci/archlinuxarm:latest

ENV LANG=zh_CN.UTF-8 TERM=xterm-256color
RUN echo "LANG=zh_CN.UTF-8">/etc/locale.conf\
 && echo "zh_CN.UTF-8 UTF-8">/etc/locale.gen\
 && locale-gen

RUN pacman -Syu --noconfirm git

# 克隆仓库
RUN git clone https://gitee.com/TimeRainStarSky/TRSS_AllBot.git

# 进入仓库目录并执行Install.sh文件
WORKDIR /TRSS_AllBot
RUN chmod +x Install.sh\
 && ./Install.sh

# 保持容器运行
ENTRYPOINT ["tail", "-f", "/dev/null"]
