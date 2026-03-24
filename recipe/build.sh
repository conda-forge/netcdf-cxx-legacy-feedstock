#!/usr/bin/env bash

set -ex

cd "${SRC_DIR}/netcdf-cxx-${PKG_VERSION}"

if [[ -n "$mpi" && "$mpi" != "nompi" ]]; then
  export CC="${PREFIX}/bin/mpicc"
  export CXX="${PREFIX}/bin/mpicxx"
fi

./configure \
  --prefix="$PREFIX" \
  CPPFLAGS="${CPPFLAGS} -I${PREFIX}/include" \
  LDFLAGS="${LDFLAGS} -L${PREFIX}/lib"

make
make check
make install
