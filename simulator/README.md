# Open SIMH, trimmed for the VAX-11/780

`open-simh/` is Open SIMH (<https://github.com/open-simh/simh>) at commit
`87eb7d5e96f9ce0ee6ac183e20160e5c486b0712`, cut down to what the
`vax780` simulator needs:

- kept: the SCP core (`scp.*`, `sim_*`), `VAX/`, `PDP11/` (the 780 uses
  the PDP-11 Unibus and Massbus device code), `slirp/`, `slirp_glue/`,
  `display/`, the `makefile`, the license and readmes, and the SIMH, VAX
  and VAX-11/780 manuals in `doc/`
- removed: every other simulator, the VAX ROM images for other models
  (`VAX/*_bin.h`), the test suites, and the build files for other
  platforms

`.git-commit-id` records the upstream commit so the makefile can stamp the
version. `../build.sh` builds with `DONT_USE_ROMS=1 TESTS=0 vax780`.
