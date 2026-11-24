# Research Unix Eighth Edition (V8): documentation archive

Documentation for Research Unix Eighth Edition (Bell Labs, 1985, VAX), collected
from public sources on 2026-11-24. V8 itself was released by Nokia/Alcatel-Lucent
for non-commercial use only (see `../licenses/NOKIA-STATEMENT-2017-03-07.pdf`).
Third-party documents (books, terminal manuals, papers) remain the property of
their owners and are kept here as historical reference copies, each with its source.

Start here:

- Manual pages: `v8-manual/txt/` (plain text, readable on GitHub) or
  `v8-manual/html/index.html` (browsable offline).
- Typeset Volume 1: `typeset/v8-manual-volume1.pdf` or
  `archive.org/UNIX_Programmers_Manual_Eighth_Edition_Vol1_1985_retypeset.pdf`.
- Installing: `install-notes/v8directions.txt` (the original 1985 V8 installation
  instructions), then `install-notes/9legacy-simh-v8.txt` (SIMH procedure).

## Index

| Path | What it is | Source |
|------|------------|--------|
| `v8-manual/txt/manN/*.txt` | All 515 V8 manual pages (sections 1-9 and `manw`, Writer's Workbench), rendered to plain text with groff `-man` | Troff sources in `../source/v8/usr/man/` (from `v8.tar.bz2`, https://www.tuhs.org/Archive/Distributions/Research/Dan_Cross_v8/) |
| `v8-manual/html/` | The same pages as HTML, with a section index, NAME lines, cross-reference links, and links to each troff source. Stands in for the man.cat-v.org mirror (see below) | Same as above |
| `v8-manual/intro-to-volume1.txt` | "Introduction to Volume 1" from the manual's front matter | `../source/v8/usr/man/man0/intro` |
| `typeset/` | Typeset PDFs of Volume 1 (whole and per section), `v8directions`, the PIC memo, the awk tutorial, and the Blit notes and owner information. **Made by `../tools/typeset-manual.sh`, not by this collection**; see `typeset/README.md` | `../source/` |
| `archive.org/UNIX_Programmers_Manual_Eighth_Edition_Vol1_1985_retypeset.pdf` | "UNIX Time-Sharing System Programmer's Manual, Research Version, Eighth Edition, Volume 1, February 1985" (697 pp.). A third party re-typeset it from the tape sources (2022 revision), with the original front matter and McIlroy's preface | https://archive.org/details/unixtimesharingsystemprogrammersmanualeighthedition |
| `install-notes/v8directions.txt` | "Eighth Edition Installation Instructions" (`/usr/doc/v8directions`, Aug 1985), as text. The PDF is `typeset/v8directions.pdf` | `../source/v8/usr/doc/v8directions` |
| `install-notes/9legacy-simh-v8.txt` | David du Colombier's notes for installing V8 on SIMH vax780 (via 4.1BSD) | http://9legacy.org/9legacy/doc/simh/v8 |
| `install-notes/gunkies-Setting_up_the_Fourth_Berkeley_Software_Tape.{html,md,wiki}` | "Setting up the Fourth Berkeley Software Tape" (4.0/4.1BSD install guide) | https://gunkies.org/wiki/Setting_up_(BSD_4.0)_the_Fourth_Berkeley_Software_Tape |
| `install-notes/gunkies-Installing_4.1_BSD_on_SIMH.*` | Installing 4.1BSD on SIMH (the first stage of the V8 build) | https://gunkies.org/wiki/Installing_4.1_BSD_on_SIMH |
| `install-notes/gunkies-Installing_4.2_BSD_on_SIMH.*` | Installing 4.2BSD on SIMH (SIMH notes cited by myv8) | https://gunkies.org/wiki/Installing_4.2_BSD_on_SIMH |
| `install-notes/blit-README.md`, `blit-screenshot.png` | Tim Newsham's notes for running the Blit emulator against V8 (plan9port) | https://github.com/timnewsham/blit (commit e9d7c77) |
| (not copied) | myv8 README and install transcript: already in the repo as `../install/README-myv8.md` and `../install/transcript.txt` | https://github.com/timnewsham/myv8 |
| `blit-jerq/blit-programmers-manual.pdf` | Rob Pike, "The Blit Programmer's Manual (TTY Edition)" (Bell Labs CSTR #121, Oct 1985), with the library appendix. Rendered with groff | `../source/v8jerq/blit/doc/{mac,manual,manpages}` |
| `blit-jerq/blit-man-pages.pdf` | Manual pages for the Blit tape (68ld, cip, jim, jx, mpx, mux, proof, ...). Rendered with groff | `../source/v8jerq/blit/doc/*.[1-9]*` |
| `blit-jerq/jerq-jj.pdf` | "A Library of Goo for the 5620" (libjj) | `../source/v8jerq/jerq/src/lib/jj/jj.ms` |
| `blit-jerq/jerq-proof.pdf` | Andrew Hume, "Proof" (troff previewer for the Blit/5620) | `../source/v8jerq/jerq/src/proof/doc/proof.mm` |
| `papers/ritchie/stream-io-system-bltj1984.pdf`, `st.html` | D. M. Ritchie, "A Stream Input-Output System", AT&T BLTJ 63(8), Oct 1984 (V8 streams) | Dennis Ritchie's Bell Labs page, http://cm.bell-labs.com/cm/cs/who/dmr/st.html via the Wayback Machine (now https://www.nokia.com/bell-labs/about/dennis-m-ritchie/st.html) |
| `papers/ritchie/ipc-ninth-edition-spe1990.pdf`, `ipcpaper.html` | Presotto & Ritchie, "Interprocess Communication in the Ninth Edition Unix System", SP&E 1990. A later version of the V8 IPC paper in `tuhs/` | Same, `.../dmr/ipcpaper.html` and `spe.pdf` |
| `papers/bell-labs-cs-doc/Pike-The_Blit_A_Multiplexed_Graphics_Terminal-1983.{pdf,ps.gz}` | R. Pike, "The Blit: A Multiplexed Graphics Terminal" | http://cm.bell-labs.com/cm/cs/doc/83/mpx.ps.gz (Wayback) |
| `papers/bell-labs-cs-doc/Pike-Graphics_in_Overlapping_Bitmap_Layers-1983.*` | R. Pike, "Graphics in Overlapping Bitmap Layers" (the layers used by mpx/mux) | `.../cm/cs/doc/83/1-a.ps.gz` (Wayback) |
| `papers/bell-labs-cs-doc/Pike-Weinberger-The_Hideous_Name-1985.*` | Pike & Weinberger, "The Hideous Name" (naming in V8: Datakit, netb remote files, /n) | `.../cm/cs/doc/85/1-05.ps.gz` (Wayback) |
| `papers/bell-labs-cs-doc/Pike-Presotto-Face_the_Nation-1985.*` | Pike & Presotto, "Face the Nation" (the face server and vismon; see face(9), faced(9)) | `.../cm/cs/doc/85/face.ps.gz` (Wayback) |
| `papers/bell-labs-cs-doc/Presotto-Upas_A_Simpler_Approach_to_Network_Mail-1985.*` | D. L. Presotto, "Upas: a simpler approach to network mail" ("the mail interface for the Eighth Edition") | http://cm.bell-labs.com/cm/cs/who/presotto/upas.ps (Wayback) |
| `papers/bell-labs-cs-doc/Pike-Window_Systems_Should_Be_Transparent-1988.*` | R. Pike, "Window Systems Should Be Transparent" (mux; 1988, after V8) | `.../cm/cs/doc/88/1-07.ps.gz` (Wayback) |
| `papers/bell-labs-cs-doc/Pike-The_Text_Editor_sam-1987.*` | R. Pike, "The Text Editor sam" (1987; sam came after V8, whose 5620 editor was jim) | `.../cm/cs/doc/87/1-05.ps.gz` (Wayback) |
| `papers/Killian-Processes_as_Files-USENIX1984.pdf` | T. J. Killian, "Processes as Files", USENIX Summer 1984 (V8 /proc). Scanned, no text layer | https://lucasvr.gobolinux.org/etc/Killian84-Procfs-USENIX.pdf |
| `papers/McIlroy-A_Research_UNIX_Reader-1971-1986.pdf` | M. D. McIlroy, "A Research UNIX Reader: Annotated Excerpts from the Programmer's Manual, 1971-1986" (text version, without the facsimile pages) | https://mcilroy.cs.dartmouth.edu/reader.pdf |
| `tuhs/Interprocess_Communications_in_the_8th_Edition_Unix_Ritchie+Presotto_USENIX_SUMMER_19850612.pdf` | Presotto & Ritchie, "Interprocess Communication in the Eighth Edition Unix System", USENIX Summer 1985 (scan) | https://www.tuhs.org/Archive/Documentation/Papers/ |
| `tuhs/CSTR-114-GRAP-Bentley-Kernighan-1984.pdf` | CSTR #114, "GRAP: A Language for Typesetting Graphs". The same memo as V8 `/usr/doc/grap`, which groff can't typeset | https://www.tuhs.org/Archive/Documentation/TechReports/Bell_Labs/CSTRs/114.pdf |
| `tuhs/CSTR-116-PIC-Kernighan-1984.pdf` | CSTR #116, "PIC: A Graphics Language for Typesetting, Revised User Manual" (Dec 1984). The same document as V8 `/usr/doc/pic/picmemo` | https://www.tuhs.org/Archive/Documentation/TechReports/Bell_Labs/CSTRs/116.pdf |
| `tuhs/dmr-wkt-1999-V8s_roots-excerpt.txt` | Dennis Ritchie's 1999 emails on V8's origins (BSD 4.1c base, streams, file system switch) and licensing | https://www.tuhs.org/Archive/Documentation/Emails/dmr_wkt |
| (not copied) | TUHS `Dan_Cross_v8/README`, `statement_regarding_Unix_3-7-17.pdf`, `v8.tar.bz2`, `v8jerq.tar.bz2`: already in the repo under `../dist/tuhs/` and `../licenses/` | https://www.tuhs.org/Archive/Distributions/Research/Dan_Cross_v8/ |
| `bitsavers/UNIX_System_Readings_and_Applications_Volume_2_1987.pdf` | Book reprint of the AT&T Bell Labs Technical Journal Oct 1984 UNIX issue: Pike, "The Blit"; Cargill, "Debugging C Programs with the Blit"; Ritchie, "A Stream Input-Output System"; and others (338 pp., scan) | http://bitsavers.trailing-edge.com/pdf/att/unix/ (mirror of bitsavers.org/pdf/att/unix/) |
| `bitsavers/5620_logic.pdf`, `5620_kbd.pdf`, `5620_monitor_pwrsupply.pdf` | Teletype DMD 5620 schematics: logic board, keyboard, monitor and power supply | http://bitsavers.trailing-edge.com/pdf/att/5620/schematic/ |
| `misc/5620/vtda/999-300-127IS_Terminal_Users_Guide.pdf` | AT&T "Terminal User's Guide: 5620 Dot Mapped Display Terminal", 999-300-127IS, Issue 1, Aug 1985 | https://vtda.org/docs/computing/AT&T/5620/ |
| `misc/5620/vtda/306-140_5620_Dot-Mapped_Display_Release_2-0_User_Guide.pdf` | "5620 Dot-Mapped Display Release 2.0 User Guide" (Core Utilities Package) | same |
| `misc/5620/vtda/Mouse_pinouts.txt` | 5620 mouse pinout note | same |
| `misc/5620/loomcom-archive/AT_T_5620_FAQ.html` | "AT&T 5620 (and Related Terminals) Frequently Asked Questions" (history of the Blit, 5620, and layers) | https://archive.decromancer.ca/archives.loomcom.com/3b2/software/UNSORTED/terminals/ |
| `misc/5620/loomcom-archive/att5620_eng.pdf` | Teletype engineering drawing package (WDP 0632) for the 5620AAA101 Dot Mapped Display Terminal (95 pp., scan) | same |
| `wiki/gunkies-Unix_Eighth_Edition.*`, `wiki/images/` | Computer History Wiki article on V8 (HTML, Markdown, raw wikitext) | https://gunkies.org/wiki/Unix_Eighth_Edition |
| `wiki/gunkies-4.1_BSD.*` | Computer History Wiki article on 4.1BSD, the host system for the V8 install | https://gunkies.org/wiki/4.1_BSD |
| `wiki/wikipedia-Research_Unix.*`, `wiki/wikipedia-Blit_computer_terminal.*` | Wikipedia articles (CC BY-SA 4.0) | https://en.wikipedia.org/wiki/Research_Unix, https://en.wikipedia.org/wiki/Blit_(computer_terminal) |

Files named `*.md` that came from wiki pages were converted from HTML with pandoc. Infobox tables
appear there as `[TABLE]`; the `.html` copy is complete.

## Not collected

| Source | Reason |
|--------|--------|
| http://man.cat-v.org/unix_8th/ (V8 man pages) | Its `robots.txt` disallows the Claude-Code and Claude-User agents and sets `Crawl-delay: 120` for everyone, so it was not mirrored. `v8-manual/` is rendered from the same troff sources instead. To mirror it yourself at that delay (~1,000 pages, more than a day): `wget -m -k -E -np --wait=120 http://man.cat-v.org/unix_8th/` |
| https://doc.cat-v.org/unix/v8/ (`v8directions.pdf`, `awktut.pdf`, `grap.pdf`, `picmemo.pdf`) | Same robots.txt. All four are typesettings of `/usr/doc` from the V8 tape. Substitutes: `typeset/`, `install-notes/v8directions.txt`, and `tuhs/CSTR-114/116` |
| https://doc.cat-v.org/unix/proc/ (Killian "Processes as Files" page scans and `proc-usenix84.tbz`), https://doc.cat-v.org/unix/unix-reader/, and the V8-era papers under https://doc.cat-v.org/bell_labs/ (blit, the_hideous_name, upas_mail_system, face_the_nation, transparent_wsys, squeak, sam_lang_tutorial, structural_regexps, concurrent_window_system) | Same robots.txt. Most of these papers were taken from the original Bell Labs sites listed above. Not obtained: Cardelli & Pike "Squeak", the sam tutorial, "Structural Regular Expressions", and "A Concurrent Window System" (all later than V8 or only loosely related) |
| https://www.nokia.com/bell-labs/about/dennis-m-ritchie/ | Returns HTTP 403 to non-browser clients. The same files were taken from Wayback copies of cm.bell-labs.com |
| https://github.com/Alhadis/Research-Unix-v8 | Nothing to take: its tree is exactly `v8.tar.bz2` and `v8jerq.tar.bz2` unpacked, plus the TUHS README and the Nokia statement (as `COPYING.pdf`). So `docs/alhadis/` was not created |
| https://archive.org/details/blitterminal1982 | 1982 Bell Labs Blit promotional video (mp4, 10 MB). It is a video rather than a document, so it was linked, not copied |
| https://archive.org/details/a_research_unix_reader | Full scan of the McIlroy Reader with the facsimile manual pages (PDF, 44 MB). The text version is in `papers/` |
| https://archive.org/details/unix-v10-vol2 | Tenth Edition Volume 2 papers (about 1.4 GB). It holds later versions of several V8-era papers (streams, /proc, Blit), but it is V10 and too large |
| P. J. Weinberger, "The Version 8 Network File System" (USENIX 1984; only an abstract was published) | No public copy found |
| Datakit papers (Fraser; Luderer, Che & Marshall, "A distributed Unix system based on a virtual circuit switch") | IEEE/ACM paywall only |
| T. A. Cargill, pi debugger papers ("The Feel of Pi", USENIX 1986; OOPSLA 1986) | Paywall only. Cargill's 1984 Blit debugging paper is in the bitsavers Readings Vol. 2 |
| Pike, Locanthi & Reiser, "Hardware/Software Tradeoffs for Bitmap Graphics on the Blit" (http://cm.bell-labs.com/cm/cs/doc/83/archtr.ps.gz) | Not captured by the Wayback Machine |
| Bill Joy, "Installing and Operating 4.1bsd" (1981) | No online copy found. The TUHS 4.1BSD reconstruction tape has no `/usr/doc` |
| "An Overview of Eighth Edition Unix" (1986) | Only a bibliographic record at nokia.com |
| http://bitsavers.org/pdf/att/5620/56K341AAN_keyboard/ | Photographs of a keyboard, not documentation |
| http://9legacy.org/download/unix/v8-simh.tar.bz2 | A disk image, not documentation |

Browsable V8 source with man pages and docs, online: https://www.tuhs.org/cgi-bin/utree.pl?file=V8
