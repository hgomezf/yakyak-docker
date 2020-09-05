FROM debian:latest
ARG VER 
ARG UID
ARG GID
RUN groupadd -g ${GID} user &&\
    useradd -u ${UID} -g ${GID} -ms /bin/bash user &&\
    usermod -G audio user  &&\
    apt-get update && apt-get install -y wget\
                                         apt\
                                         alsa-utils\
                                         libx11-xcb1\
                                         libx11-6\
                                         libglib2.0-0\
                                         libxcb-dri3-0\
                                         libxcomposite1\
                                         libxcursor1\
                                         libxdamage1\
                                         libxext6\
                                         libxi6\
                                         libxtst6\
                                         libnss3\
                                         libatk1.0-0\
                                         libatk-bridge2.0-0\
                                         libgdk-pixbuf2.0-0\
                                         libgtk-3-0\
                                         libdrm2\
                                         libgbm1\
                                         libxss1\
                                         libasound2\
                                         chromium\
                                         sudo &&\
    apt-get clean &&\
    wget -cv https://github.com/yakyak/yakyak/releases/download/v${VER}/yakyak-${VER}-linux-amd64.deb &&\
    dpkg -i ./yakyak-${VER}-linux-amd64.deb && chmod 4755 /opt/yakyak/chrome-sandbox &&\
    rm ./yakyak-${VER}-linux-amd64.deb
USER user
ENTRYPOINT ["yakyak"]
