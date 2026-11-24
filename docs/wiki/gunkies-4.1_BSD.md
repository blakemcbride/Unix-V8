<!-- Source: https://gunkies.org/wiki/4.1_BSD  (fetched 2026-11-24; converted from MediaWiki HTML with pandoc) -->

*Saved from <https://gunkies.org/wiki/4.1_BSD> on 2026-11-24 (MediaWiki render view).*

# 4.1 BSD

  

[TABLE]

  
This version of [BSD](https://gunkies.org/wiki/BSD "BSD") addressed many of the performance shortcomings in [4.0 BSD](https://gunkies.org/wiki/4.0_BSD "4.0 BSD") that were brought up in a VMS vs BSD paper. Many of the changes are outlined in [Bug fixes and changes in 4.1bsd](https://gunkies.org/wiki/Bug_fixes_and_changes_in_4.1bsd "Bug fixes and changes in 4.1bsd"). One of the big points of 4.1 is that it supported the [VAX-11/750](https://gunkies.org/wiki/VAX-11/750 "VAX-11/750"), which became a workhorse favorite of the DoD, which in turn led to DARPA grants to the [CSRG](https://gunkies.org/wiki/CSRG "CSRG") to continue developing BSD. The 4.1 BSD [kernel](https://gunkies.org/wiki/Kernel "Kernel") was systematically tuned up by Bill Joy until it could perform as well as [VMS](https://gunkies.org/wiki/VMS "VMS") on several benchmarks.

The release would have been called 5BSD, but after objections from AT&T the name was changed; AT&T feared confusion with [AT&T's UNIX System V](https://gunkies.org/wiki/Unix_SYSV "Unix SYSV").

Other features included:

- job control
- automatic kernel config
- vfork()

4.1 BSD, June 1981 4BSD was upgraded to include many performance improvements, support for a new VAX model and autoconfiguration.

Once DARPA was funding the development of BSD, it lead to 2 big improvements from 4.1 to 4.2: the adddition of [TCP/IP](https://gunkies.org/wiki/TCP/IP "TCP/IP"), and the new [BSD Fast File System](https://gunkies.org/wiki/BSD_Fast_File_System "BSD Fast File System"). These were beta-released in three intermediate versions: 4.1a included [BBN](https://gunkies.org/wiki/BBN "BBN")'s preliminary [TCP/IP](https://gunkies.org/wiki/TCP/IP "TCP/IP") implementation; 4.1b included the new FFS; and 4.1c was an interim release of what became [4.2 BSD](https://gunkies.org/wiki/4.2_BSD "4.2 BSD"), during the last few months of its development.

Apparently 4.1a includes the BBN TCP/IP stack, but on a 750, it only can perform at 56kb on Ethernet, and maximizes the CPU to 100%, whereas Bill Joy's TCP/IP could get upwards of 700k/sec.

## Contents

- [1 Getting this to run](#Getting_this_to_run)
  - [1.1 4.1](#4.1)
  - [1.2 4.1c](#4.1c)
- [2 Games](#Games)
- [3 Documents](#Documents)
- [4 Post 4.1 releases](#Post_4.1_releases)

## Getting this to run

### 4.1

A tape image for 4.1 has surfaced on [bitsavers](https://gunkies.org/wiki/Bitsavers "Bitsavers"), named [4.1_BSD_19810710.zip](http://bitsavers.trailing-edge.com/bits/UCB_CSRG/4.1_BSD_19810710.zip) The bootblock programs do not run under SIMH using the [4.0 BSD](https://gunkies.org/wiki/4.0_BSD "4.0 BSD") strategy, however it is possible to swap tapes when restoring the root slice, and then restoring the tars. Using this modified tape, I've created an installation guide [Installing 4.1 BSD on SIMH](https://gunkies.org/wiki/Installing_4.1_BSD_on_SIMH "Installing 4.1 BSD on SIMH").

### 4.1c

There is two tape images on bitsavers [4.1C BSD 1 of 2](http://bitsavers.trailing-edge.com/bits/UCB_CSRG/4.1C_BSD_1of2.zip), and [4.1C BSD 2 of 2](http://bitsavers.trailing-edge.com/bits/UCB_CSRG/4.1C_BSD_2of2.zip). A much needed to revise guide is available [Installing 4.1c BSD on SIMH](https://gunkies.org/wiki/Installing_4.1c_BSD_on_SIMH "Installing 4.1c BSD on SIMH").

## Games

These are what is available on the 1981 tape:

    aardvark    banner      ching       lib         snake
    adventure   bcd         cribbage    mille       snscore
    advfiles    bogdict     fish        monop       trek
    arithmetic  boggle      fortune     number      wump
    backgammon  chess       hangman     quiz        zork

## Documents

[Bug fixes and changes in 4.1 BSD](https://gunkies.org/wiki/Bug_fixes_and_changes_in_4.1_BSD "Bug fixes and changes in 4.1 BSD")

## Post 4.1 releases

4.1a This was a test release including TCP/IP and the socket interface. It saw a wide release, although it seems to have disappeared.

4.1b This was a test release, used only a Berkley and it includes the new Fast File System, using clustering for much improved performance, and contained the netw networking code.

4.1c 1982/1983 The third test release between 4.1BSD and 4.2BSD, it was distributed to about 100 sites and includes most 4.2 features except for the new signal facility. There is a detailed paper [UNIX\* System V and 4.1C BSD](https://gunkies.org/wiki/UNIX*_System_V_and_4.1C_BSD "UNIX* System V and 4.1C BSD") written by John Chambers & John Quarterman, that details 4.1c BSD.

  

[TABLE]

[TABLE]
