
#!/bin/bash

cd src

make distclean

export LIBS="${LIBS} -lm"

./configure --prefix=/usr/include/gsl --disable-shared

make

make install

make distclean

cd ..
