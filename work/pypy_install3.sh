# get-pip.pyなどの一時的にしか必要ないファイルは/tmpに置くことが推奨されているので、ここで作業
cd /tmp

sudo apt update
# git : ac-library-pythonのインストールなどに使う
# wget, bzip2 : バイナリのDLと展開に必要
sudo apt install -y git wget bzip2

# pypy3.10-v7.3.12-linux64.tar.bz2をダウンロードして手動でインストール
wget https://downloads.python.org/pypy/pypy3.10-v7.3.12-linux64.tar.bz2
sudo tar xjf pypy3.10-v7.3.12-linux64.tar.bz2 -C /usr/local
sudo ln -s /usr/local/pypy3.10-v7.3.12-linux64/bin/pypy3 /usr/local/bin/pypy3

# pipを使えるようにする
wget https://bootstrap.pypa.io/get-pip.py
pypy3 get-pip.py --break-system-packages
# numpyなど各種ライブラリを入れるのに必要
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
