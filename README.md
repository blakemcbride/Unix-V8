# Research Unix Eighth Edition (V8)

A complete, runnable [Research Unix Eighth Edition](https://gunkies.org/wiki/Unix_Eighth_Edition)
system (Bell Labs, 1985) for the VAX-11/780: the Open SIMH simulator
source, a ready-to-boot V8 disk, the original distribution tapes, the full
source tree, the install scripts used to build the disk from tape, and a
documentation archive, all in one repository.

## Quick start

Requirements: a C compiler, GNU make, `xz`, and (optionally) a telnet client.

    ./run.sh

The first run builds the simulator (`bin/vax780`), unpacks the pristine
disk image into `run/`, and boots V8. The terminal becomes the system
console. At `login:` type `root` (no password).

More users can log in over the eight DZ11 serial lines:

    telnet localhost 8888

### Shutting down

As root at the console `#` prompt:

    sync; sync; /etc/halt

When the simulator stops at `sim>`, type `exit`.

If you can't get to a root shell, press Ctrl-E at the console to get the
`sim>` prompt (`cont` resumes), then type `exit`. Skipping `/etc/halt` may
leave the file systems unclean; the next boot runs `fsck`, which normally
repairs them.

`./run.sh --reset` throws away `run/` and starts again from the pristine
image.

## What's on the system

The disk is a 176 MB RP06 with `/` on `rp0a` and `/usr` on `rp0g`. It
holds the complete V8 distribution, including the full source in
`/usr/src` and `/usr/sys`, the manual pages (`man`), and the jerq/Blit
terminal software in `/usr/blit` and `/usr/jerq`. The kernel is
`/unix`, built during installation from `/usr/sys/alice` with the
Internet protocols (`inet`, `tcp`, `udp`) configured in; the network
commands in `/usr/inet` were rebuilt as well. The C compiler, `make`
and `man` work (the kernel and network commands were compiled on the
system itself).

V8 was the first Unix with streams, `/proc`, the `/dev/fd` file
descriptor devices, and the Blit/jerq bitmap terminal with `mux`. For the
graphical terminal, see Tim Newsham's Blit emulator,
<https://github.com/timnewsham/blit>.

## Layout

| Path | Contents |
|------|----------|
| `run.sh`, `build.sh` | Boot the system; build the simulator |
| `rebuild.sh` | Rebuild the disk image from the original tapes (needs `expect`) |
| `system/` | The pristine bootable disk (`rp06v8.xz`), the boot block (`bootV8`), the simulator configuration (`run.conf`) |
| `simulator/open-simh/` | Open SIMH source, trimmed to what the VAX-11/780 simulator needs |
| `install/` | Tim Newsham's [myv8](https://github.com/timnewsham/myv8) install scripts and tape images (4.1BSD, V8, V8 jerq), with a reference transcript |
| `dist/tuhs/` | The original V8 archives from TUHS (`v8.tar.bz2`, `v8jerq.tar.bz2`) and the Nokia statement |
| `source/v8/`, `source/v8jerq/` | The two archives unpacked, for browsing (a few names differ only in case; on macOS or Windows use the tarballs) |
| `docs/` | Documentation archive (manuals, papers, Blit/5620 terminal docs, install notes); see `docs/README.md` |
| `docs/v8-manual/` | All 515 V8 manual pages as plain text and browsable HTML |
| `docs/typeset/` | The V8 Programmer's Manual (Volume 1) and the `/usr/doc` papers, typeset from the troff sources in `source/` by `tools/typeset-manual.sh` |
| `tools/` | `typeset-manual.sh` (regenerate `docs/typeset/`), `smoke-test.sh` (boot a scratch copy, log in, compile and run a C program, halt; needs `expect`) |
| `licenses/` | License texts and statements |

## How the disk was built

V8 was never distributed as a bootable image. The install, scripted by
Tim Newsham in [myv8](https://github.com/timnewsham/myv8) after notes by
David du Colombier, goes:

1. Boot the 4.1BSD tape, make file systems on an RP06, restore 4.1BSD.
2. Boot 4.1BSD with a second disk, wipe it, extract the V8 and V8 jerq
   tapes onto it, chroot into it with V8's own `v8` command and build a V8
   kernel (`/usr/sys/alice`, with networking).
3. Boot V8, let its `fsck` convert the 4.1BSD file systems to V8 format,
   write `/etc/fstab`, recreate `/dev`, enable the serial lines, and build
   and install the network commands.

4. (`install/finishV8`, added here) Patch `date(1)` so two-digit years
   00-69 mean 20xx, and set the clock from the host.

`./rebuild.sh` repeats all of this from the tapes in `install/` in about
ten minutes. Changes made to myv8 for current Open SIMH: the
"Overwrite last track?" prompt SIMH no longer prints is not waited for,
`set noasync` avoids V8 disk I/O errors with asynchronous I/O, and the
simulator runs with `TZ=UTC`.

## The clock

The VAX time-of-year register (TODR) holds only the time within the year;
V8 takes the year from the file system. SIMH seeds the TODR from the host
clock in local time, so `run.sh` runs it with `TZ=UTC`, and the image was
built with its clock set, so the date comes up right. V8 shows US Eastern
time (the kernel was configured at Bell Labs with `TIMEZONE=300`). If the
date ever drifts, for example when the disk sits unused across a new
year, set it as root: `date -u yymmddhhmm` (UTC) or `date yymmddhhmm`
(Eastern).

## Sources

- V8 distribution: Dan Cross, via The Unix Heritage Society,
  <https://www.tuhs.org/Archive/Distributions/Research/Dan_Cross_v8/>
- Install scripts and SIMH tape images: Tim Newsham,
  <https://github.com/timnewsham/myv8> (commit 7931955, 2017)
- Simulator: Open SIMH, <https://github.com/open-simh/simh>
  (commit 87eb7d5, July 2026)
- Browsable source elsewhere: <https://github.com/Alhadis/Research-Unix-v8>
- Documentation: see `docs/README.md`

## Licenses

- Research Unix V8: Nokia Bell Labs' 2017 statement that it will not
  assert copyright over non-commercial use of Research Unix Editions 8, 9
  and 10 (`licenses/NOKIA-STATEMENT-2017-03-07.pdf`).
- 4.1BSD (used only as the install vehicle) derives from 32V, covered by
  the Caldera license of January 23, 2002 (`licenses/Caldera-license.pdf`).
- Open SIMH: MIT-style license (`licenses/OPEN-SIMH-LICENSE.txt`).
- myv8 scripts: published by Tim Newsham without a license statement.
- Documentation under `docs/` is archived here for preservation and
  remains the property of its respective authors and publishers. Rights
  holders who want something removed can open an issue.
