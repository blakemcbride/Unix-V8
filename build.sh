#!/bin/sh
# Build the Open SIMH VAX-11/780 simulator from the vendored source into
# bin/vax780.  Needs a C compiler and GNU make.  Optional libraries
# (pcre2, libedit, libpng, libpcap) are used when the makefile finds them.
set -eu

ROOT=$(cd "$(dirname "$0")" && pwd)
SRC="$ROOT/simulator/open-simh"
MAKE=${MAKE:-make}
command -v gmake >/dev/null 2>&1 && MAKE=gmake

mkdir -p "$ROOT/bin"
echo "==> Building vax780"
# DONT_USE_ROMS: the 780 needs no internal ROM images (only the VAX ROM
# sources the 780 uses are vendored).  TESTS=0: the SIMH test suites are
# not vendored.
(cd "$SRC" && $MAKE DONT_USE_ROMS=1 TESTS=0 vax780)
cp "$SRC/BIN/vax780" "$ROOT/bin/vax780"
echo "==> Built: $ROOT/bin/vax780"
