#!/bin/sh
# Boot a scratch copy of the pristine disk, log in as root, run a few
# commands (including compiling and running a C program), and halt.
# Leaves run/ alone.  Needs expect.
#
#   tools/smoke-test.sh [disk-image]    (default: system/rp06v8.xz)
set -eu

ROOT=$(cd "$(dirname "$0")/.." && pwd)
IMG=${1:-"$ROOT/system/rp06v8.xz"}
command -v expect >/dev/null 2>&1 || { echo "smoke-test.sh needs expect" >&2; exit 1; }
[ -x "$ROOT/bin/vax780" ] || "$ROOT/build.sh"

T=$(mktemp -d)
trap 'rm -rf "${T:?}"' EXIT
case "$IMG" in
    *.xz) xz -dc "$IMG" > "$T/rp06v8" ;;
    *)    cp "$IMG" "$T/rp06v8" ;;
esac
cp "$ROOT/system/bootV8" "$T/"
grep -v '^att dz' "$ROOT/system/run.conf" > "$T/run.conf"

cat > "$T/smoke.exp" <<'EOF'
set timeout 180
spawn vax780 run.conf
expect {
    "login: " { send "root\r" }
    timeout   { puts "\nSMOKE: no login prompt"; exit 1 }
}
expect "# "
foreach c {
    "date"
    "df"
    "ps ax"
    "echo 'main(){printf(\"hello from V8\\n\");}' >/tmp/h.c; cc -o /tmp/h /tmp/h.c && /tmp/h; rm -f /tmp/h /tmp/h.c"
} {
    send "$c\r"
    expect {
        "# "    {}
        timeout { puts "\nSMOKE: timeout on: $c"; exit 1 }
    }
}
send "sync; sync; /etc/halt\r"
expect "HALT"
expect "sim>"
send "exit\r"
expect eof
EOF

cd "$T"
TZ=UTC PATH="$ROOT/bin:$PATH" expect smoke.exp | tr -d '\r' | tee smoke.log
grep -q '^hello from V8' smoke.log && echo "SMOKE: PASS" || { echo "SMOKE: FAIL"; exit 1; }
