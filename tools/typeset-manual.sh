#!/bin/sh
# Typeset the Eighth Edition Programmer's Manual (Volume 1) and the
# documents in /usr/doc from the troff sources in source/ with GNU groff.
#
#   tools/typeset-manual.sh [outdir]      (default: docs/typeset)
#
# Needs groff (with tbl, eqn, pic) and pdfunite (poppler-utils).
# groff is not 1985 troff: expect warnings and the odd layout difference.
set -eu

ROOT=$(cd "$(dirname "$0")/.." && pwd)
OUT=${1:-"$ROOT/docs/typeset"}
MAN="$ROOT/source/v8/usr/man"
DOC="$ROOT/source/v8/usr/doc"
BLIT="$ROOT/source/v8jerq/blit/doc"
LOG="$OUT/groff-warnings.log"

mkdir -p "$OUT"
: > "$LOG"

gr() {  # gr out.pdf groff-args...
    out=$1; shift
    echo "==> $(basename "$out")"
    echo "### $(basename "$out")" >> "$LOG"
    groff -Tpdf -P-pletter "$@" > "$out" 2>> "$LOG" || true
}

# Front matter: title page, preface, introduction
gr "$OUT/v8-vol1-00-title.pdf" -C "$MAN/man0/title.copyr"
gr "$OUT/v8-vol1-00-preface.pdf" -ms "$MAN/man0/pref"
gr "$OUT/v8-vol1-00-intro.pdf" -t -ms "$MAN/man0/intro"

# Sections 1-9 and the Writer's Workbench pages (manw); intro first
for s in 1 2 3 4 5 6 7 8 9 w; do
    d="$MAN/man$s"
    [ -d "$d" ] || continue
    files=$(cd "$d" && { ls intro.* 2>/dev/null || true; ls | grep -v '^intro\.' | LC_ALL=C sort -f; })
    (cd "$d" && gr "$OUT/v8-vol1-man$s.pdf" -t -e -p -man $files)
done

pdfunite "$OUT"/v8-vol1-00-title.pdf "$OUT"/v8-vol1-00-preface.pdf \
         "$OUT"/v8-vol1-00-intro.pdf "$OUT"/v8-vol1-man[1-9].pdf \
         "$OUT"/v8-vol1-manw.pdf "$OUT/v8-manual-volume1.pdf"
echo "==> v8-manual-volume1.pdf"

# /usr/doc papers
gr "$OUT/v8directions.pdf" -t -ms "$DOC/v8directions"
(cd "$DOC/pic" && gr "$OUT/pic-memo.pdf" -t -e -p -ms picmemo)
# awktut sources Kernighan's macros from his home directory; use the copy
# shipped with the pic memo instead.
(cd "$DOC/awk" &&
    sed 's|^\.so /usr/bwk/src/cprog.mac|.so ../pic/cprog.mac|' awktut |
    gr "$OUT/awk-tutorial.pdf" -t -e -p -ms -)

# Blit (jerq) documents
(cd "$BLIT" && gr "$OUT/blit-notes.pdf" -t -e -p -ms notes.ms)
(cd "$BLIT" && gr "$OUT/blit-owner.pdf" -t -e -p -ms owner.ms)

echo "==> Done: $OUT (warnings in $(basename "$LOG"))"
