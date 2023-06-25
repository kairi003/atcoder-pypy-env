# AtCoder PyPy Env

6/19版のエラーを再現するため、dockerfileで予めPython3とpipをインストールして競合を発生させています。

- pypy_install.sh: 3.9現行版
- pypy_install2.sh: 3.10更新版
- pypy_install3.sh: 3.10更新版(コメントアウト削減)
- check_libs.py: ライブラリの動作テスト用スクリプト


