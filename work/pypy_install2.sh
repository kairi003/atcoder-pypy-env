# get-pip.pyなどの一時的にしか必要ないファイルは/tmpに置くことが推奨されているので、ここで作業
cd /tmp

sudo apt update
# software-properties-common : add-apt-repository用
# git : ac-library-pythonのインストールなどに使う
# sudo apt-get install -y software-properties-common git wget bzip2
# [06/25] ppaは不要だがwget,bzip2が必要
sudo apt-get install -y git wget bzip2

# [06/25] pypy3.10-v7.3.12-linux64.tar.bz2をダウンロードして手動でインストール
wget https://downloads.python.org/pypy/pypy3.10-v7.3.12-linux64.tar.bz2
sudo tar -xvf pypy3.10-v7.3.12-linux64.tar.bz2 -C /usr/local
sudo ln -s /usr/local/pypy3.10-v7.3.12-linux64/bin/pypy3 /usr/local/bin/pypy3

# [06/25] pypy3.10-v7.3.12へ変更するためコメントアウト
# 普通にsudo apt install pypyでインストールすると7.3.1がインストールされるので
# 下記のようにインストール
# PPA https://launchpad.net/~pypy/+archive/ubuntu/ppa
# 7.3.11+dfsg-1~ppa1~ubuntu22.10が入る
# sudo add-apt-repository -y ppa:pypy/ppa
# sudo apt update
# sudo apt install -y pypy3

# pipを使えるようにする
wget https://bootstrap.pypa.io/get-pip.py
pypy3 get-pip.py --break-system-packages
# numpyなど各種ライブラリを入れるのに必要
# [06/25] pypy3.10-v7.3.12へ変更したためコメントアウト
# sudo apt install -y pypy3-dev
sudo apt install -y gcc g++ gfortran libopenblas-dev liblapack-dev pkg-config libgeos-dev

pypy3 -mpip install --break-system-packages \
    numpy==1.24.1 \
    scipy==1.10.1 \
    networkx==3.0 \
    sympy==1.11.1 \
    sortedcontainers==2.4.0  \
    more-itertools==9.0.0 \
    shapely==2.0.0 \
    bitarray==2.6.2 \
    PuLP==2.7.0 \
    mpmath==1.2.1 \
    pandas==1.5.2 \
    z3-solver==4.12.1.0 \
    scikit-learn==1.2.0 \
    typing-extensions==4.4.0 \
    cppyy==2.4.1 \
    git+https://github.com/not522/ac-library-python
