#!/usr/bin/env bash

if [[ -n "$mpi" && "$mpi" != "nompi" ]]; then
  export CC=mpicc
  export CXX=mpicxx
fi

./configure --prefix=$PREFIX

make
make check
make install