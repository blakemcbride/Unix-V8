<!-- Source: https://gunkies.org/wiki/Installing_4.1_BSD_on_SIMH  (fetched 2026-11-24; converted from MediaWiki HTML with pandoc) -->

*Saved from <https://gunkies.org/wiki/Installing_4.1_BSD_on_SIMH> on 2026-11-24 (MediaWiki render view).*

# Installing 4.1 BSD on SIMH

This is the procedure is loosely inspired from [Naoki Hamada](http://zazie.tom-yam.or.jp/starunix/4.0bsd/4.0bsd.html) to install [4.0 BSD](https://gunkies.org/wiki/4.0_BSD "4.0 BSD") onto [SIMH](https://gunkies.org/wiki/SIMH "SIMH")'s [VAX 11/780](https://gunkies.org/wiki/VAX_11/780 "VAX 11/780") emulator. I can't get the standalone programs to run on SIMH, so instead I'm using the 4.0 standalone to bootstrap 4.1. So the ini files, and initial disk prep is the same.

## Contents

- [1 Requirements](#Requirements)
- [2 Preparing for installation](#Preparing_for_installation)
  - [2.1 tboot.ini](#tboot.ini)
  - [2.2 dboot.ini](#dboot.ini)
- [3 Booting from tape](#Booting_from_tape)
- [4 Booting from disk](#Booting_from_disk)

## Requirements

- You will need a working copy of SIMH's vax780.exe for your platform.
- A modified 4.1 BSD install tape. You can download one from [sourceforge](http://sourceforge.net/projects/bsd42/files/Install%20tapes/4.1%20BSD/4.1_BSD_19810710-modified.7z/download)
- The 4.0 standalone boot program, avilable on [sourceforge](http://sourceforge.net/projects/bsd42/files/Install%20tapes/4.0%20BSD/boot/download)
- A copy of [7zip](https://gunkies.org/w/index.php?title=7zip&action=edit&redlink=1 "7zip (page does not exist)") to decompress the tape image

## Preparing for installation

The first step is to decompress the tape image with 7zip. This should be very straightforward:

    7zip x 4.1_BSD_19810710-modified.7z

  
You will need to create two ini files, one for the tape boot, and the other for the disk boot.

### tboot.ini

    set tto 7b
    set rq dis
    set lpt dis
    set rl dis
    set hk dis
    set rq dis
    set rqb dis
    set rqc dis
    set rqd dis
    set ry dis
    set ts dis
    set tq dis
    set dz lines=8
    set rp0 rp06
    at rp0 rp06.disk
    set tu0 te16
    at tu0 4.1_BSD_19810710-modified.tap
    D 50000 20009FDE
    D 50004 D0512001
    D 50008 3204A101
    D 5000C C113C08F
    D 50010 A1D40424
    D 50014 008FD00C
    D 50018 C1800000
    D 5001C 8F320800
    D 50020 10A1FE00
    D 50024 00C139D0
    D 50028 04c1d004
    D 5002C 07e15004
    D 50030 0000f750
    run 50000
    run 0

### dboot.ini

    set tto 7b
    set rq dis
    set lpt dis
    set rl dis
    set hk dis
    set rq dis
    set rqb dis
    set rqc dis
    set rqd dis
    set ry dis
    set ts dis
    set tq dis
    set dz lines=8
    set rp0 rp06
    at rp0 rp06.disk
    set tu0 te16
    load -o boot 0
    run 2

You will also need to extract the boot program. You can download it from [sourceforge](http://sourceforge.net/projects/bsd42/files/Install%20tapes/4.0%20BSD/boot/download), or [uudecode](https://gunkies.org/wiki/Uudecode "Uudecode") the following [boot](https://gunkies.org/wiki/4.0_BSD_boot "4.0 BSD boot") program that is injected into SIMH's memory.

## Booting from tape

Simply boot up from tape by invoking SIMH's VAX 11/780 with the tape boot ini as follows:


    C:\bsd40>vax780.exe tboot.ini

    VAX780 simulator V3.8-1
    RP: creating new file
    Overwrite last track? [N] y

    HALT instruction, PC: 00050033 (HALT)
    =

This will get you to the bootloader which we can then use to invoke the mkfs/restore commands. There isn't any need to lowlevel format in the emulator.

    =mkfs
    file sys size: 7942
    file system: hp(0,0)
    isize = 5072
    m/n = 3 500
    =

Now to restore the root/boot partition:

    =restor
    Tape? ht(0,1)
    Disk? hp(0,0)
    Last chance before scribbling on disk.
    End of tape
    =

Hit enter when prompted "Last chance before scribbling on disk.".

Now we can invoke the boot program to load up the kernel so we can continue the install.

    =boot

    Boot
    :

Now we can specify the disk & kernel, as follows:

    : hp(0,0)vmunix
    123060+27528+24628 start 0xF5C
    Berkeley VAX/UNIX Version 4.9  Wed Feb 17 15:27:46 PST 1982
    real mem  = 8322048
    avail mem = 7738368
    mcr0 at tr1
    mcr1 at tr2
    uba0 at tr3
    dz0 at uba0 csr 160100 vec 300, ipl 15
    mba0 at tr8
    hp0 at mba0 drive 0
    hp1 at mba0 drive 1
    hp2 at mba0 drive 2
    hp3 at mba0 drive 3
    mba1 at tr9
    ht0 at mba1 drive 0
    tu0 at ht0 slave 0
    tu1 at ht0 slave 1
    root device?

And we will be prompted for the root device, in this case it's hp0

    root device? hp0
    WARNING: preposterous time in file system -- CHECK AND RESET THE DATE!
    WARNING: should run interleaved swap with >= 2Mb
    erase ^?, kill ^U, intr ^C
    #

It is recommended that you run fsck to ensure that the 'a' partition is in good health. Run fsck as follows:

    # fsck /dev/rhp0a

    /dev/rhp0a
    File System:

    ** Checking /dev/rhp0a
    ** Phase 1 - Check Blocks and Sizes
    ** Phase 2 - Check Pathnames
    ** Phase 3 - Check Connectivity
    ** Phase 4 - Check Reference Counts
    ** Phase 5 - Check Free List
    663 files 4277 blocks 3346 free
    #

Now we format the 'g' partition which we will then mount under /usr and restore from tape. Take note that we specify the size as that isn't detected, and that mkfs lives in /etc!

    # mkfs /dev/hp0g 145673
    isize = 65488
    m/n = 3 500

Next we link the tape device to rmt:

  

    cd /dev
    MAKE ht0
    cd /

Now we mount the partition, advance the tape, and restore.

    # /etc/mount /dev/hp0g /usr
    # cd /usr
    # mt rew
    # mt fsf 2
    # tar xpb 20
    #

This will take about a minute to complete.

Next we'll install a bootblock.

    # dd if=/usr/mdec/uboot of=/dev/rhp0a bs=1b count=1
    1+0 records in
    1+0 records out
    #

No create the fstab by copying the example rp file

    cp /etc/fstab.rp06 /etc/fstab

And you can test that its working with a 'df'

    # df
    Filesystem  Mounted on  kbytes    used    free  % used
    /dev/hp0a   /             7623    4278    3345     56%
    /dev/hp0g   /usr        141578    9198  132380      6%

  
Then we fix some mount permissions, and shutdown the system.

    # cd /
    # chmod 755 / /usr
    # sync
    # sync
    # sync
    # sync
    # ^E
    Simulation stopped, PC: 80000963 (MTPR #0,#12)
    sim> q
    Goodbye

    C:\bsd40>

The operating system is now installed.

## Booting from disk

This part relies on you having extracted the 4.0 BSD boot program, as there is no console floppy in SIMH. Or I haven't figured out how to create one, so it is injected into memory and executed. Load the simulator as follows and it'll boot up to the login prompt.

  

    C:\bsd40>vax780.exe dboot.ini

    VAX780 simulator V3.8-1

    Boot
    : hp(0,0)vmunix
    123060+27528+24628 start 0xF5C
    Berkeley VAX/UNIX Version 4.9  Wed Feb 17 15:27:46 PST 1982
    real mem  = 8322048
    avail mem = 7738368
    mcr0 at tr1
    mcr1 at tr2
    uba0 at tr3
    dz0 at uba0 csr 160100 vec 300, ipl 15
    mba0 at tr8
    hp0 at mba0 drive 0
    hp1 at mba0 drive 1
    hp2 at mba0 drive 2
    hp3 at mba0 drive 3
    mba1 at tr9
    ht0 at mba1 drive 0
    tu0 at ht0 slave 0
    tu1 at ht0 slave 1
    root on hp0
    WARNING: clock lost 152 days -- CHECK AND RESET THE DATE!
    WARNING: should run interleaved swap with >= 2Mb
    Automatic reboot in progress...
    Mon Feb  2 13:31:59 GMT 1976
    /dev/hp0a: 676 files 4278 blocks 3345 free
    /dev/rhp0g: 1333 files 9198 blocks 132380 free
    Mon Feb  2 13:31:59 GMT 1976
    Mounted /usr on /dev/hp0g
    preserving editor files
    clearing /tmp
    starting daemons: update        Mon Feb  2 13:31:59 GMT 1976

     cron accounting network mail printer.
    Mon Feb  2 13:31:59 GMT 1976


    Berkeley 4.1 VAX/UNIX (Amnesia-Vax)

    login:

Now you can follow the \`Taking the system up and down' Section of [setup](https://gunkies.org/w/index.php?title=4.1_BSD_setup&action=edit&redlink=1 "4.1 BSD setup (page does not exist)") document.
