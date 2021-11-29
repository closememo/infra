FROM centos:7.9.2009

RUN useradd deployer

USER deployer

WORKDIR /home/deployer

RUN mkdir /home/deployer/apps

RUN cd /home/deployer/apps \
 && curl -L -O https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.13%2B8/OpenJDK11U-jdk_x64_linux_hotspot_11.0.13_8.tar.gz \
 && tar -xf OpenJDK11U-jdk_x64_linux_hotspot_11.0.13_8.tar.gz \
 && ln -s jdk-11.0.13+8 jdk

ENV JAVA_HOME="/home/deployer/apps/jdk"
ENV PATH="${JAVA_HOME}/bin:${PATH}"

ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime
