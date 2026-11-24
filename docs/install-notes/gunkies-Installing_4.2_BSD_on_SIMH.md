<!-- Source: https://gunkies.org/wiki/Installing_4.2_BSD_on_SIMH  (fetched 2026-11-24; converted from MediaWiki HTML with pandoc) -->

*Saved from <https://gunkies.org/wiki/Installing_4.2_BSD_on_SIMH> on 2026-11-24 (MediaWiki render view).*

# Installing 4.2 BSD on SIMH

This is the procedure that I have used to install [4.2 BSD](https://gunkies.org/wiki/4.2_BSD "4.2 BSD") onto [SIMH](https://gunkies.org/wiki/SIMH "SIMH")'s vax 11/780 emulator.

## Contents

- [1 Requirements](#Requirements)
- [2 Preparing for installation](#Preparing_for_installation)
- [3 Boot 1.](#Boot_1.)
  - [3.1 install.ini](#install.ini)
  - [3.2 Booting the emulator](#Booting_the_emulator)
  - [3.3 Restoring the rootdump](#Restoring_the_rootdump)
- [4 Boot 2.](#Boot_2.)
  - [4.1 boot.ini](#boot.ini)
  - [4.2 Booting the emulator](#Booting_the_emulator_2)
  - [4.3 Preparing the disk](#Preparing_the_disk)
  - [4.4 Restoring the usr slice](#Restoring_the_usr_slice)
  - [4.5 Configuring the fstab](#Configuring_the_fstab)
- [5 First Multiuser Boot](#First_Multiuser_Boot)
  - [5.1 Enabling remote users](#Enabling_remote_users)

## Requirements

You will need the following materials to put together a 4.2 BSD installation:

- A working perl interpeter to make the tape images.  
- A copy of gzip.  
- A method of extracting the boot file from either the binaries (tar/gzip) or [uudecode](https://gunkies.org/wiki/Uudecode "Uudecode") to extract it from [here](https://gunkies.org/wiki/Boot42 "Boot42"), or just [download it from sourceforge](https://sourceforge.net/projects/bsd42/files/Install%20tapes/4.2%20BSD/boot42/download).  
- A compiled binary of vax780 from [SIMH](https://gunkies.org/wiki/SIMH "SIMH"), along with the vmb.exe again from [SIMH](https://gunkies.org/wiki/SIMH "SIMH").

An alternative is to download the 4.2 BSD tape from [here](http://sourceforge.net/projects/bsd42/files/Install%20tapes/4.2%20BSD/4.2bsd.tap.bz2/download), along with the boot file [here](http://sourceforge.net/projects/bsd42/files/Install%20tapes/4.2%20BSD/boot42/download). The [bzip2](https://gunkies.org/w/index.php?title=Bzip2&action=edit&redlink=1 "Bzip2 (page does not exist)") program will be needed to decompress the tape image.

  
You will need the following files from any 4 BSD archive from the 4.2 directory. I have used the files from [tuhs.superglobalmegacorp.com](http://tuhs.superglobalmegacorp.com/4BSD/Distributions/4.2BSD/). You can use whatever method you like to download them, wget, a web browser etc..  
  

[ingres.tar.gz](http://tuhs.superglobalmegacorp.com/4BSD/Distributions/4.2BSD/ingres.tar.gz)  
[miniroot.gz](http://tuhs.superglobalmegacorp.com/4BSD/Distributions/4.2BSD/miniroot.gz)  
[new.tar.gz](http://tuhs.superglobalmegacorp.com/4BSD/Distributions/4.2BSD/new.tar.gz)  
[rootdump.gz](http://tuhs.superglobalmegacorp.com/4BSD/Distributions/4.2BSD/rootdump.gz)  
[src.tar.gz](http://tuhs.superglobalmegacorp.com/4BSD/Distributions/4.2BSD/src.tar.gz)  
[srcsys.tar.gz](http://tuhs.superglobalmegacorp.com/4BSD/Distributions/4.2BSD/srcsys.tar.gz)  
[stand.gz](http://tuhs.superglobalmegacorp.com/4BSD/Distributions/4.2BSD/stand.gz)  
[usr.tar.gz](http://tuhs.superglobalmegacorp.com/4BSD/Distributions/4.2BSD/usr.tar.gz)  
[vfont.tar.gz](http://tuhs.superglobalmegacorp.com/4BSD/Distributions/4.2BSD/vfont.tar.gz)  
  

## Preparing for installation

With the files downloaded you will need to uncompress them all and then create the tape file.

The following command will decompress the tape files.

    gzip -d *.gz

The tape needs to be created with the [mkdisttap.pl](https://gunkies.org/wiki/Mkdisttap.pl "Mkdisttap.pl") program. Simply run the program and redirect it into a file called 42.tap .

    % ./mkdisttap.pl > 42.tap
    % ls -l 42.tap
    -rw-r--r--  1 Neozeed  +SYSTEM  69943640 Feb  6 12:39 42.tap

Next you will need the boot program. I have uploaded a copy onto this wiki in uuencoded format, [and a direct download on sourceforge.net](https://sourceforge.net/projects/bsd42/files/Install%20tapes/4.2%20BSD/boot42/download). To use uudeocde to decode it, simply access the [article](https://gunkies.org/wiki/Boot42 "Boot42"), and copy the contents of the quoted text (the begin/end part INCLUDING the begin & end segments) and save it to a text file. Then you will need to run the uudecode file as follows:

    % ls -l boot42.uue
    -rw-r--r--  1 Neozeed  None_ploc  9117 Feb  6 12:09 boot42.uue
    % uudecode boot42.uue
    % ls -l boot42
    -rw-------  1 Neozeed  None_ploc  6600 Feb  6 12:28 boot42
    % file boot42
    boot42: data

## Boot 1.

We are going to use the following config file to start the first phase of the installation. Save the following configuration into a file such as 'install.ini'. Since we are going to boot directly into the miniroot the rq1 disk will hold the installation target. Since the 'normal' way to install is to install from tape onto the first disk, we will have to add a device file uppon boot for the second disk, and be sure to point the xtr program to the second disk.

### install.ini

    set rq0 ra81
    at rq0 miniroot
    set rq1 ra81
    at rq1 rq.dsk
    set rq1 dis
    set rq2 dis
    set rq3 dis
    set rp dis
    set lpt dis
    set rl dis
    set tq dis
    set tu dis
    att ts 42.tap
    set tti 7b
    set tto 7b
    load -o boot42 0
    d r10 9
    d r11 0
    run 2

### Booting the emulator

You then simply run the emulator and pass it the config file.

    C:\4.2BSD\work>vax780 install.ini

    VAX780 simulator V3.8-0
    RQ: creating new file
    1.txt> set rq1 dis
    Command not allowed
    loading ra(0,0)boot
    Boot
    : ra(0,0)vmunix
    199488+56036+51360 start 0x11a0
    4.2 BSD UNIX #9: Wed Nov 2 16:00:29 PST 1983
    real mem  = 8384512
    avail mem = 7073792
    using 102 buffers containing 835584 bytes of memory
    mcr0 at tr1
    mcr1 at tr2
    uba0 at tr3
    hk0 at uba0 csr 177440 vec 210, ipl 15
    rk0 at hk0 slave 0
    rk1 at hk0 slave 1
    uda0 at uba0 csr 172150 vec 774, ipl 15
    ra0 at uda0 slave 0
    ra1 at uda0 slave 1
    zs0 at uba0 csr 172520 vec 224, ipl 15
    ts0 at zs0 slave 0
    dz0 at uba0 csr 160100 vec 300, ipl 15
    dz1 at uba0 csr 160110 vec 310, ipl 15
    dz2 at uba0 csr 160120 vec 320, ipl 15
    dz3 at uba0 csr 160130 vec 330, ipl 15
    root on ra0
    WARNING: clock gained 94 days -- CHECK AND RESET THE DATE!
    WARNING: should run interleaved swap with >= 2Mb
    erase ^?, kill ^U, intr ^C
    #

### Restoring the rootdump

From here we are now running from the miniroot. The next steps are as follows:

    # cd /dev
    # ./MAKEDEV ra1
    # cd /
    # disk=ra1 type=ra81 tape=ts xtr

This will create a 'device' for the ra1 disk, then run the xtr program to restore the root dump.

    erase ^?, kill ^U, intr ^C
    # cd /dev
    # ./MAKEDEV ra1
    # cd /
    # disk=ra1 type=ra81 tape=ts xtr
    Build root file system
    Warning: 538 sector(s) in last cylinder unallocated
    /dev/rra1a:     15884 sectors in 23 cylinders of 14 tracks, 51 se
            8.1Mb in 2 cyl groups (16 c/g, 5.85Mb/g, 1856 i/g)
    super-block backups (for fsck -b#) at:
     32, 11520,
    Check the file system
    ** /dev/rra1a
    ** Last Mounted on
    ** Phase 1 - Check Blocks and Sizes
    ** Phase 2 - Check Pathnames
    ** Phase 3 - Check Connectivity
    ** Phase 4 - Check Reference Counts
    ** Phase 5 - Check Cyl groups
    2 files, 9 used, 7420 free (20 frags, 925 blocks)
    Rewind tape
    Restore the dump image of the root
    Warning: ./lost+found: File exists
    ** /dev/rra1a
    ** Last Mounted on /a
    ** Phase 1 - Check Blocks and Sizes
    ** Phase 2 - Check Pathnames
    ** Phase 3 - Check Connectivity
    ** Phase 4 - Check Reference Counts
    ** Phase 5 - Check Cyl groups
    313 files, 3568 used, 3861 free (21 frags, 480 blocks)
    Root filesystem extracted

    If this is a 780, update floppy
    If this is a 730, update the cassette
    #

After this stage, I just sync the disk a few times, then halt the emulator (CONTROL+E) and exit out. Now we are ready for stage two.

    If this is a 730, update the cassette
    # sync
    # sync
    # sync

    Simulation stopped, PC: 80001620 (FFS #0,#20,8003ED44,R0)
    sim> q
    Goodbye

    C:\4.2BSD\work>

  

## Boot 2.

Now that the install disk is prepared, we need to use a different config file to reflect us going back to a single disk/tape configuration. The new configuration is as follows:

### boot.ini

    set rq0 ra81
    att rq0 rq.dsk
    set rq1 dis
    set rq2 dis
    set rq3 dis
    set rp dis
    set lpt dis
    set rl dis
    set tq dis
    set tu dis
    att ts 42.tap
    set tti 7b
    set tto 7b
    load -o boot42 0
    d r10 9
    d r11 0
    run 2

### Booting the emulator

Now boot up the emulator with the boot.ini

    C:\4.2BSD\work>vax780.exe boot.ini

    VAX780 simulator V3.8-0
    TS: creating new file
    loading ra(0,0)boot
    Boot
    : ra(0,0)vmunix
    199488+56036+51360 start 0x11a0
    4.2 BSD UNIX #9: Wed Nov 2 16:00:29 PST 1983
    real mem  = 8384512
    avail mem = 7073792
    using 102 buffers containing 835584 bytes of memory
    mcr0 at tr1
    mcr1 at tr2
    uba0 at tr3
    hk0 at uba0 csr 177440 vec 210, ipl 15
    rk0 at hk0 slave 0
    rk1 at hk0 slave 1
    uda0 at uba0 csr 172150 vec 774, ipl 15
    ra0 at uda0 slave 0
    ra1 at uda0 slave 1
    zs0 at uba0 csr 172520 vec 224, ipl 15
    ts0 at zs0 slave 0
    dz0 at uba0 csr 160100 vec 300, ipl 15
    dz1 at uba0 csr 160110 vec 310, ipl 15
    dz2 at uba0 csr 160120 vec 320, ipl 15
    dz3 at uba0 csr 160130 vec 330, ipl 15
    root on ra0
    WARNING: should run interleaved swap with >= 2Mb
    Automatic reboot in progress...
    Mon Feb  6 05:05:49 PST 1984
    Can't open checklist file: /etc/fstab
    Automatic reboot failed... help!
    erase ^?, kill ^U, intr ^C
    #

### Preparing the disk

Now we have to prep the machine for both the tape, and the type of disk. Type in the following commands.

    # disk=ra
    # name=ra0h;type=ra81
    # cd /dev
    # ./MAKEDEV ts0;sync
    # cd /
    # newfs $name $type

The output will be like this:

    # disk=ra
    # name=ra0h;type=ra81
    # cd /dev
    # ./MAKEDEV ts0;sync
    # cd /
    # newfs $name $type
    Warning: 28 sector(s) in last cylinder unallocated
    /dev/rra0h:     759668 sectors in 1064 cylinders of 14 tracks, 51 sectors
            389.0Mb in 67 cyl groups (16 c/g, 5.85Mb/g, 2048 i/g)
    super-block backups (for fsck -b#) at:
     32, 11512, 22992, 34472, 45952, 57432, 68912, 80392, 91872, 103352,
     114832, 126312, 137792, 149272, 160752, 172232, 182816, 194296, 205776, 217256,
     228736, 240216, 251696, 263176, 274656, 286136, 297616, 309096, 320576, 332056,
     343536, 355016, 365600, 377080, 388560, 400040, 411520, 423000, 434480, 445960,
     457440, 468920, 480400, 491880, 503360, 514840, 526320, 537800, 548384, 559864,
     571344, 582824, 594304, 605784, 617264, 628744, 640224, 651704, 663184, 674664,
     686144, 697624, 709104, 720584, 731168, 742648, 754128,
    #

### Restoring the usr slice

The disk's /usr slice will not have been formatted. We can not go ahead and mount it, and restore the /usr files. Then we unmount the slice, and run fsck to make sure everything is ok.

    # mount /dev/$name /usr
    # cd /usr
    # mkdir sys
    # cd sys
    # mt rew
    # mt fsf 3
    # tar xpbf 20 /dev/rmt12
    # cd ..
    # mt fsf
    # tar xpbf 20 /dev/rmt12
    # cd /
    # chmod 755 / /usr /usr/sys
    # rm -rf sys
    # ln -s /usr/sys sys
    # umount /dev/$name
    # fsck /dev/r$name

Likewise, the output should be similar to this:

    # chmod 755 / /usr /usr/sys
    # rm -rf sys
    # ln -s /usr/sys sys
    # umount /dev/$name
    # fsck /dev/r$name
    ** /dev/rra0h
    ** Last Mounted on /usr
    ** Phase 1 - Check Blocks and Sizes
    ** Phase 2 - Check Pathnames
    ** Phase 3 - Check Connectivity
    ** Phase 4 - Check Reference Counts
    ** Phase 5 - Check Cyl groups
    3735 files, 25550 used, 336310 free (166 frags, 84036 blocks)
    #

### Configuring the fstab

Now we just need to create the fstab, format the 'home' slice, and then we can reboot the emulator into multiuser mode. Enter in the following commands:

    # cd /etc
    # cp fstab.ra81 fstab
    # newfs ra0g ra81
    # sync
    # reboot

And the expected output is as follows:

    # cd /etc
    # cp fstab.ra81 fstab
    # newfs ra0g ra81
    Warning: 30 sector(s) in last cylinder unallocated
    /dev/rra0g:     82080 sectors in 115 cylinders of 14 tracks, 51 sectors
            42.0Mb in 8 cyl groups (16 c/g, 5.85Mb/g, 2048 i/g)
    super-block backups (for fsck -b#) at:
     32, 11512, 22992, 34472, 45952, 57432, 68912, 80392,
    # sync
    # reboot
    syncing disks... done

    Reboot requested, PC: 80021716 (ADDL2 #8,SP)
    sim> q
    Goodbye

## First Multiuser Boot

Now we can just re-run the last command, and we should boot multiuser! By default there is no root password. Also the system will run fsck uppon boot, so depending on your host computer this could take a while.

  

    C:\4.2BSD\work>vax780.exe boot.ini

    VAX780 simulator V3.8-0
    loading ra(0,0)boot
    Boot
    : ra(0,0)vmunix
    199488+56036+51360 start 0x11a0
    4.2 BSD UNIX #9: Wed Nov 2 16:00:29 PST 1983
    real mem  = 8384512
    avail mem = 7073792
    using 102 buffers containing 835584 bytes of memory
    mcr0 at tr1
    mcr1 at tr2
    uba0 at tr3
    hk0 at uba0 csr 177440 vec 210, ipl 15
    rk0 at hk0 slave 0
    rk1 at hk0 slave 1
    uda0 at uba0 csr 172150 vec 774, ipl 15
    ra0 at uda0 slave 0
    ra1 at uda0 slave 1
    zs0 at uba0 csr 172520 vec 224, ipl 15
    ts0 at zs0 slave 0
    dz0 at uba0 csr 160100 vec 300, ipl 15
    dz1 at uba0 csr 160110 vec 310, ipl 15
    dz2 at uba0 csr 160120 vec 320, ipl 15
    dz3 at uba0 csr 160130 vec 330, ipl 15
    root on ra0
    WARNING: should run interleaved swap with >= 2Mb
    Automatic reboot in progress...
    Mon Feb  6 05:21:02 PST 1984
    /dev/ra0a: 326 files, 3569 used, 3860 free (20 frags, 480 blocks)
    /dev/rra0h: 3735 files, 25550 used, 336310 free (166 frags, 84036 blocks)
    /dev/rra0g: 2 files, 9 used, 77750 free (14 frags, 9717 blocks)
    Mon Feb  6 05:21:15 PST 1984
    check quotas: done.
    local daemons: routed telnetd ftpd talkd syslog sendmail.
    preserving editor files
    clearing /tmp
    standard daemons: update cron accounting mail    Mon Feb 6 05:21:17 PST 1984

     printer.
    starting network: rshd rexecd rlogind rwhod.
    Mon Feb  6 05:21:18 PST 1984


    4.2 BSD UNIX (myname)

    login:

  
Now we can simply logon as root.

    4.2 BSD UNIX (myname)

    login: root
    4.2 BSD UNIX #9: Wed Nov 2 16:00:29 PST 1983

    Would you like to play a game?

    You have mail.
    Don't login as root, use su
    myname#

From here you can explore the system. All of the man pages are installed, and there is enough of a base system to get going. Sadly there are bugs in how [4.2 BSD](https://gunkies.org/wiki/4.2_BSD "4.2 BSD") and how [SIMH](https://gunkies.org/wiki/SIMH "SIMH") interact with the networking, and it is not reliable. As sad as it is to be an 'island' you can however setup the dz serial interface to allow more than one user.

### Enabling remote users

You can add the following lines into the boot.ini (just make sure they are above the boot command or it'll not work correctly..). This will allow for 8 users to connect on tcp port 8888.

    set dz lines=8
    set dz 7b
    att dz -m 8888

I would also recommend to windows users, either [putty](https://gunkies.org/wiki/Putty "Putty"), or [syncterm](https://gunkies.org/wiki/Syncterm "Syncterm"). The default telnet client sucks.
