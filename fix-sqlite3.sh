#! /bin/sh

set -e

V=sqlite-amalgamation-3080500

wget http://www.sqlite.org/2014/${V}.zip
unzip $V
cd $V

patch -p0 < ../sqlite3-csv-crlf.patch
gcc -O3 sqlite3.c shell.c -o ../sqlite3-csv-crlf -ldl -pthread 
upx ../sqlite3-csv-crlf

echo '[DONE]'


