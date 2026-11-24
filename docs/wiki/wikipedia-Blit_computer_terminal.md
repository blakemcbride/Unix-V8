<!-- Source: https://en.wikipedia.org/wiki/Blit_(computer_terminal) (fetched 2026-11-24 via REST API; text CC BY-SA 4.0, see page history for authors; converted with pandoc) -->

Electronic device

[![](//thumb.wikimedia.org/wikipedia/commons/thumb/9/9d/Teletype_DMD_5620.jpg/250px-Teletype_DMD_5620.jpg?utm_source=en.wikipedia.org&utm_campaign=parser&utm_content=thumbnail)](//en.wikipedia.org/wiki/File:Teletype_DMD_5620.jpg)

A Teletype DMD 5620 connected to the [SDF Public Access Unix System](//en.wikipedia.org/wiki/SDF_Public_Access_Unix_System "SDF Public Access Unix System")

**Blit** is a programmable [raster graphics](//en.wikipedia.org/wiki/Raster_graphics "Raster graphics") [computer terminal](//en.wikipedia.org/wiki/Computer_terminal "Computer terminal") designed by [Rob Pike](//en.wikipedia.org/wiki/Rob_Pike "Rob Pike") and [Bart N. Locanthi](//en.wikipedia.org/wiki/Bart_N._Locanthi "Bart N. Locanthi") of [Bell Labs](//en.wikipedia.org/wiki/Bell_Labs "Bell Labs") and released in 1982.

## History

The Blit programmable [bitmap](//en.wikipedia.org/wiki/Bitmap "Bitmap") [graphics](//en.wikipedia.org/wiki/Computer_graphics "Computer graphics") [terminal](//en.wikipedia.org/wiki/Computer_terminal "Computer terminal") was designed by [Rob Pike](//en.wikipedia.org/wiki/Rob_Pike "Rob Pike") and Bart Locanthi Jr. of [Bell Labs](//en.wikipedia.org/wiki/Bell_Labs "Bell Labs") in 1982. The Blit technology was commercialized by [AT&T](//en.wikipedia.org/wiki/AT&T_Corporation "AT&T Corporation") and [Teletype](//en.wikipedia.org/wiki/Teletype_Corporation "Teletype Corporation"). In 1984, the **DMD** (dot-mapped display) **5620** was released,^([\[1\]](//en.wikipedia.org/wiki/Blit_(computer_terminal)#cite_note-1)) followed by models **630 MTG** (multi-tasking graphics) in 1987 and **730 MTG** in 1989. The 5620 used a [Western Electric](//en.wikipedia.org/wiki/Western_Electric "Western Electric") 32100 processor (a.k.a. [Bellmac 32](//en.wikipedia.org/wiki/Bellmac_32 "Bellmac 32")) and had a 15 inches (38.1 cm) green phosphor display with 800×1024×1 resolution (66×88 characters in the initial text mode) interlaced at 30 Hz. The 630 and 730 had [Motorola 68000](//en.wikipedia.org/wiki/Motorola_68000 "Motorola 68000") processors and a 1024×1024×1 monochrome display at 60 Hz (most had amber displays, but some had white or green displays).

The [folk etymology](//en.wikipedia.org/wiki/Folk_etymology "Folk etymology") for the *Blit* name is that it stands for *Bell Labs Intelligent Terminal*, and its creators have also joked that it actually stood for *Bacon, Lettuce, and Interactive Tomato*. However, Rob Pike's paper on the Blit explains that it was named after the second syllable of *[bit blit](//en.wikipedia.org/wiki/Bit_blit "Bit blit")*, a common name for the bit-block transfer operation that is fundamental to the terminal's graphics.^([\[2\]](//en.wikipedia.org/wiki/Blit_(computer_terminal)#cite_note-2)) Its original nickname was *Jerq*, inspired by a joke used during a demo of a Three Rivers' [PERQ](//en.wikipedia.org/wiki/PERQ "PERQ") graphic workstation and used with permission.^([\[3\]](//en.wikipedia.org/wiki/Blit_(computer_terminal)#cite_note-3))

## Functionality

When initially switched on, the Blit looked like an ordinary textual ["dumb" terminal](//en.wikipedia.org/wiki/Dumb_terminal "Dumb terminal"), although taller than usual. However, after logging into a [Unix](//en.wikipedia.org/wiki/Unix "Unix") host (connected to the terminal through a [serial port](//en.wikipedia.org/wiki/Serial_port "Serial port")), the host could (via special escape sequences) load software to be executed by the processor of the terminal. This software could make use of the terminal's full graphics capabilities and attached peripherals such as a [computer mouse](//en.wikipedia.org/wiki/Computer_mouse "Computer mouse"). Normally, users would load the window systems *mpx* (or its successor *mux*), which replaced the terminal's [user interface](//en.wikipedia.org/wiki/User_interface "User interface") by a mouse-driven windowing interface, with multiple terminal windows all multiplexed over the single available serial-line connection to the host.

Each window initially ran a simple [terminal emulator](//en.wikipedia.org/wiki/Terminal_emulator "Terminal emulator"), which could be replaced by a downloaded interactive graphical application, for example, a more advanced terminal emulator, an editor, or a clock application. The resulting properties were similar to those of a modern Unix windowing system; however, to avoid having user interaction slowed by the serial connection, the interactive interface and the host application ran on separate systems—an early implementation of [distributed computing](//en.wikipedia.org/wiki/Distributed_computing "Distributed computing").

## Window systems

Pike wrote two window systems for the Blit, *mpx* for [8th Edition Unix](//en.wikipedia.org/wiki/Research_Unix#Versions "Research Unix") and *mux* for 9th Edition, both sporting a minimalistic design. The design of these influenced the later [Plan 9](//en.wikipedia.org/wiki/Plan_9_from_Bell_Labs "Plan 9 from Bell Labs") window systems [8½](./8½_(Plan_9) "8½ (Plan 9)") and [rio](//en.wikipedia.org/wiki/Rio_(windowing_system) "Rio (windowing system)"). When the Blit was commercialized as the DMD 5620, a variant of mpx called "layers" was added to [SVR3](//en.wikipedia.org/wiki/UNIX_System_V#SVR3 "UNIX System V").^([\[4\]](//en.wikipedia.org/wiki/Blit_(computer_terminal)#cite_note-4))

9front (a Plan 9 fork) contains a Blit emulator that runs its original firmware,^([\[5\]](//en.wikipedia.org/wiki/Blit_(computer_terminal)#cite_note-5)) which can be used with mux (available in recently released [Research Unix](//en.wikipedia.org/wiki/Research_Unix "Research Unix") v8^([\[6\]](//en.wikipedia.org/wiki/Blit_(computer_terminal)#cite_note-6))).

## See also

- [3B series computers](//en.wikipedia.org/wiki/3B_series_computers "3B series computers"), some of which also used the WECO 32000 processor, were often used with DMD 5620s
- [rio](//en.wikipedia.org/wiki/Rio_(windowing_system) "Rio (windowing system)")
- [Thin client](//en.wikipedia.org/wiki/Thin_client "Thin client")
- [X terminal](//en.wikipedia.org/wiki/X_terminal "X terminal")

## References

1.  [↑](//en.wikipedia.org/wiki/Blit_(computer_terminal)#cite_ref-1) [AT&T/Teletype 5620 Dot Mapped Display Terminal](http://www.brouhaha.com/~eric/retrocomputing/att/5620/)
2.  [↑](//en.wikipedia.org/wiki/Blit_(computer_terminal)#cite_ref-2) [Pike, Rob](//en.wikipedia.org/wiki/Rob_Pike "Rob Pike") (1984). ["The Blit: A Multiplexed Graphics Terminal"](http://doc.cat-v.org/bell_labs/blit/). *AT&T Bell Laboratories Technical Journal*. **63** (8): 1607–1631. [doi](//en.wikipedia.org/wiki/Doi_(identifier) "Doi (identifier)"):[10.1002/j.1538-7305.1984.tb00056.x](https://doi.org/10.1002%2Fj.1538-7305.1984.tb00056.x). [S2CID](//en.wikipedia.org/wiki/S2CID_(identifier) "S2CID (identifier)") [34062559](https://api.semanticscholar.org/CorpusID:34062559).
3.  [↑](//en.wikipedia.org/wiki/Blit_(computer_terminal)#cite_ref-3) Pike, Rob (19 December 2019). ["Re: \[TUHS\] Blit source"](https://inbox.vuxu.org/tuhs/CAKzdPgz37wwYfmHJ_7kZx_T=-zwNJ50PhS7r0kCpuf_F1mDkww@mail.gmail.com/). TUHS. Retrieved 29 October 2020. “The name, originally coined for a fun demo of the Three Rivers Perq by folks at Lucasfilm, was borrowed with permission by us”
4.  [↑](//en.wikipedia.org/wiki/Blit_(computer_terminal)#cite_ref-4) Eric Smith (25 August 2005). ["AT&T 5620 (and Related Terminals) Frequently Asked Questions"](http://www.brouhaha.com/~eric/retrocomputing/att/5620/5620_faq.html).
5.  [↑](//en.wikipedia.org/wiki/Blit_(computer_terminal)#cite_ref-5) ["Blit emulator source code"](http://git.9front.org/plan9front/plan9front/HEAD/sys/src/games/blit/f.html).
6.  [↑](//en.wikipedia.org/wiki/Blit_(computer_terminal)#cite_ref-6) ["\[TUHS\] 8th Edition Research Unix on SIMH"](https://web.archive.org/web/20170730032618/http://minnie.tuhs.org/pipermail/tuhs/2017-March/009440.html). Archived from [the original](http://minnie.tuhs.org/pipermail/tuhs/2017-March/009440.html) on 2017-07-30. Retrieved 2017-12-20.

Notes  
*This article is based in part on the [Jargon File](//en.wikipedia.org/wiki/Jargon_File "Jargon File"), which is in the public domain.*

- Holwerda, Thom (August 29, 2012), ["Blit: a multitasking, windowed UNIX GUI from 1982"](http://www.osnews.com/story/26315/Blit_a_multitasking_windowed_UNIX_GUI_from_1982), *[OSNews](//en.wikipedia.org/wiki/OSNews "OSNews")*, retrieved September 15, 2012

## External links

- Bart Locanthi, Rob Pike: [Blit (MPEG)](https://web.archive.org/web/20070928060025/http://herpolhode.com/rob/movies/blit.mpg) [(YouTube)](https://www.youtube.com/watch?v=Pr1XXvSaVUQ), the classic animated short about the windowing terminal project (it was necessary to explain how mice worked back then; this was 1982, two years before the [Mac](//en.wikipedia.org/wiki/Macintosh "Macintosh")) ([MPEG](//en.wikipedia.org/wiki/MPEG "MPEG"))
- Source code (contains proprietary code) [5620](http://www.brouhaha.com/~eric/retrocomputing/att/5620/software/)

[TABLE]
