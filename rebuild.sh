#!/bin/sh
# Rebuild the V8 disk image from the original tapes, using Tim Newsham's
# myv8 expect scripts in install/: install 4.1BSD from tape, extract the V8
# tapes over it, build a V8 kernel, convert the file systems and populate
# /dev.  Takes about 10 minutes.  Needs expect (Fedora/Ubuntu: "expect").
#
#   ./rebuild.sh      result: build/rp06v8 (build/setup.log has the transcript)
#
# The shipped image system/rp06v8.xz was made this way.  To boot a rebuilt
# image:  ./run.sh --reset; then cp build/rp06v8 run/rp06v8; ./run.sh
set -eu

ROOT=$(cd "$(dirname "$0")" && pwd)
command -v expect >/dev/null 2>&1 || { echo "rebuild.sh needs expect" >&2; exit 1; }
[ -x "$ROOT/bin/vax780" ] || "$ROOT/build.sh"

rm -rf "${ROOT:?}/build"
mkdir -p "$ROOT/build"
cp -p "$ROOT"/install/* "$ROOT/build/"
cd "$ROOT/build"
PATH="$ROOT/bin:$PATH" ./setup 2>&1 | tee setup.log
rm -f rp06bsd rp06work rp06v8_prep ./*.tap
echo "==> Built: $ROOT/build/rp06v8"
