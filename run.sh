#!/bin/sh
# Boot Research Unix Eighth Edition on the SIMH VAX-11/780.
# On first use this builds the simulator and unpacks the pristine disk
# image into run/.
#
#   ./run.sh           boot V8 (the console is this terminal; log in as root)
#   ./run.sh --reset   discard run/ and start again from the pristine image
#
# Extra logins:  telnet localhost 8888   (DZ11 serial lines tty00-tty07)
set -eu

ROOT=$(cd "$(dirname "$0")" && pwd)
RUN="$ROOT/run"

if [ "${1:-}" = "--reset" ]; then
    rm -rf "${ROOT:?}/run"
    shift
fi

[ -x "$ROOT/bin/vax780" ] || "$ROOT/build.sh"

mkdir -p "$RUN"
if [ ! -f "$RUN/rp06v8" ]; then
    echo "==> Unpacking disk image"
    xz -dc "$ROOT/system/rp06v8.xz" > "$RUN/rp06v8.tmp"
    want=$(cut -d' ' -f1 "$ROOT/system/rp06v8.sha256")
    got=$(sha256sum "$RUN/rp06v8.tmp" | cut -d' ' -f1)
    [ "$want" = "$got" ] || { echo "rp06v8 checksum mismatch" >&2; exit 1; }
    mv "$RUN/rp06v8.tmp" "$RUN/rp06v8"
fi
[ -f "$RUN/bootV8" ]   || cp "$ROOT/system/bootV8" "$RUN/"
[ -f "$RUN/run.conf" ] || cp "$ROOT/system/run.conf" "$RUN/"

cd "$RUN"
# SIMH seeds the VAX time-of-year clock from local time; V8 expects GMT.
TZ=UTC exec "$ROOT/bin/vax780" run.conf
