FROM ubuntu:22.10

# ジャッジサーバーに既に入ってるらしいパッケージをインストール
# python3 python3-pip で競合を発生させる
RUN apt-get update && \
    apt-get install -y python3 python3-pip wget sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 一般ユーザーを作成
ARG USERNAME=runner
ARG GROUPNAME=user
ARG UID=1000
ARG GID=1000
ARG PASSWORD=password
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID -G sudo $USERNAME && \
    echo $USERNAME:$PASSWORD | chpasswd && \
    echo "$USERNAME   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $USERNAME
WORKDIR /home/$USERNAME/

# 環境変数の設定
ENV HOME=/home/runner
ENV LANG=C.UTF-8
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV ATCODER=1

