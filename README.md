<div align="center">

<img src="https://raw.githubusercontent.com/harilvfs/nitch/refs/heads/main/preview.png">

# `NiTch`

<h3>
  incredibly fast system fetch written in <code>nim👑</code>
</h3>
<br>

![Maintenance](https://shields.io/maintenance/yes/2022?style=for-the-badge)
![License](https://shields.io/github/license/unxsh/nitch?style=for-the-badge)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/harilvfs/nitch?style=for-the-badge)

</div>

> [!NOTE]
> this is just a fork of [nitch](https://github.com/ssleert/nitch) official repo to meet some of my needs. btw remember this has been abandoned years ago so no extra feature is here, you can just find the latest compiled binary in the release section. if you wanna contribute anyway and if you understand the code base you are welcome to contribute or fix anything.  
> also this is not a fork repo to maintain it onward, this is just to meet my needs, that's it.

# Description 📖

`nitch` is a small and incredibly fast system fetch written fully in `nim👑` without any dependencies, on my pc
it executes in around 1.70 miliseconds.

The source code of `nitch` is highly documented and I hope it will act as a learning resource for nim
and linux systems architecture

If anything in the source code is unclear or is lacking in its explanation, open an issue. Sometimes you get too close to something and you fail to see the "bigger picture"!


btw written in `nim👑`

why `nim👑`? because it's fast and simple

<br>

# Installation ☁️
```fish
wget https://raw.githubusercontent.com/harilvfs/nitch/main/setup.sh && sh setup.sh
```

# Usage 🪨
```
nitch
```

flags:
```
 -f --fetch   | return fetch about system
 -h --help    | return help message
 -v --version | return version of program
```

<br>

# Configuration ⚙️
### `nitch` is configured by changing the source code
### `src/funcs/drawing.nim` - config file
```nim
import std/terminal       # import standard terminal lib
import getDistroId        # import to get distro id through /etc/os-release
#import ../assets/logos   # uncomment if you use your own logo
import ../nitches/[getUser, getHostname,
                   getDistro, getKernel,
                   getUptime, getShell,
                   getPkgs, getRam,
                   getLogo, getLogoColor]  # import nitches to get info about user system

# the main function for drawing fetch
proc drawInfo*() =
  let  # distro id (arch, manjaro, debian)
    distroId: string = getDistroId()

  let  # logo and it color
    logoColor: ForegroundColor = getLogoColor(distroId)  # color for logo
    defaultLogo: string  = getLogo(distroId)             # default logo from nitch/src/assets/logos

  const  # icons before cotegores
    userIcon: string   = " "  # recomended: " " or "|>"
    hnameIcon: string  = " "  # recomended: " " or "|>"
    distroIcon: string = "󰻀 "  # recomended: "󰻀 " or "|>"
    kernelIcon: string = "󰌢 "  # recomended: "󰌢 " or "|>"
    uptimeIcon: string = " "  # recomended: " " or "|>"
    shellIcon: string  = " "  # recomended: " " or "|>"
    pkgsIcon: string   = "󰏖 "  # recomended: "󰏖 " or "|>"
    ramIcon: string    = "󰍛 "  # recomended: "󰍛 " or "|>"
    colorsIcon: string = "󰏘 "  # recomended: "󰏘 " or "->"
    # please insert any char after the icon
    # to avoid the bug with cropping the edge of the icon

    dotIcon: string = ""  # recomended: "" or "■"
    # icon for demonstrate colors

  const  # categories
    userCat: string   = " user   │ "  # recomended: " user   │ "
    hnameCat: string  = " hname  │ "  # recomended: " hname  │ "
    distroCat: string = " distro │ "  # recomended: " distro │ "
    kernelCat: string = " kernel │ "  # recomended: " kernel │ "-
    uptimeCat: string = " uptime │ "  # recomended: " uptime │ "
    shellCat: string  = " shell  │ "  # recomended: " shell  │ "
    pkgsCat: string   = " pkgs   │ "  # recomended: " pkgs   │ "
    ramCat: string    = " memory │ "  # recomended: " memory │ "
    colorsCat: string = " colors │ "  # recomended: " colors │ "

  let  # all info about system
    userInfo: string     = getUser()          # get user through $USER env variable
    hostnameInfo: string = getHostname()      # get Hostname hostname through /etc/hostname
    distroInfo: string   = getDistro()        # get distro through /etc/os-release
    kernelInfo: string   = getKernel()        # get kernel through /proc/version
    uptimeInfo: string   = getUptime()        # get Uptime through /proc/uptime file
    shellInfo: string    = getShell()         # get shell through $SHELL env variable
    pkgsInfo: string     = getPkgs(distroId)  # get amount of packages in distro
    ramInfo: string      = getRam()           # get ram through /proc/meminfo

  const  # aliases for colors
    color1: ForegroundColor = fgRed
    color2: ForegroundColor = fgYellow
    color3: ForegroundColor = fgGreen
    color4: ForegroundColor = fgCyan
    color5: ForegroundColor = fgBlue
    color6: ForegroundColor = fgMagenta
    color7: ForegroundColor = fgWhite
    color8: ForegroundColor = fgBlack
    color0: ForegroundColor = fgDefault

  # colored out
  stdout.styledWrite(styleBright, logoColor, defaultLogo)
  stdout.styledWrite(styleBright, "  ╭───────────╮\n")
  stdout.styledWrite(styleBright, "  │ ", color1, userIcon, color0, userCat, color1, userInfo, "\n")
  stdout.styledWrite(styleBright, "  │ ", color2, hnameIcon, color0, hnameCat, color2, hostnameInfo, "\n")
  stdout.styledWrite(styleBright, "  │ ", color3, distroIcon, color0, distroCat, color3, distroInfo, "\n")
  stdout.styledWrite(styleBright, "  │ ", color4, kernelIcon, color0, kernelCat, color4, kernelInfo, "\n")
  stdout.styledWrite(styleBright, "  │ ", color5, uptimeIcon, color0, uptimeCat, color5, uptimeInfo, "\n")
  stdout.styledWrite(styleBright, "  │ ", color6, shellIcon, color0, shellCat, color6, shellInfo, "\n")
  stdout.styledWrite(styleBright, "  │ ", color1, pkgsIcon, color0, pkgsCat, color1, pkgsInfo, "\n")
  stdout.styledWrite(styleBright, "  │ ", color2, ramIcon, color0, ramCat, fgYellow, ramInfo, "\n")
  stdout.styledWrite(styleBright, "  ├───────────┤\n")
  stdout.styledWrite(styleBright, "  │ ", color7, colorsIcon, color0, colorsCat, color7, dotIcon, " ", color1, dotIcon, " ", color2, dotIcon, " ", color3, dotIcon, " ", color4, dotIcon, " ", color5, dotIcon, " ", color6, dotIcon, " ", color8, dotIcon, "\n")
  stdout.styledWrite(styleBright, "  ╰───────────╯\n\n")
```

# Building 📦
### 0) install [nim](https://nim-lang.org/)

### 1) clone repo
```fish
git clone https://github.com/unxsh/nitch.git
```
### 2) change dir to `nitch`
```fish
cd nitch/
```

### 3) build program with `nimble`
```fish
nimble build
```
After that you will get a ready-made binary file in the root directory of the project.

<br>

# File architecture 📁
```fish
nitch
  ├── LICENSE
  ├── nitch.nimble
  ├── README.md
  ├── src
  │   ├── assets
  │   │   ├── assets.nim
  │   │   └── logos.nim
  │   ├── flags
  │   │   └── argParser.nim
  │   ├── funcs
  │   │   ├── drawing.nim
  │   │   ├── packages
  │   │   │   └── getPacmanPkgs.nim
  │   │   └── perform.nim
  │   ├── nitches
  │   │   ├── getDistro.nim
  │   │   ├── getHostname.nim
  │   │   ├── getKernel.nim
  │   │   ├── getPkgs.nim
  │   │   ├── getRam.nim
  │   │   ├── getShell.nim
  │   │   ├── getUptime.nim
  │   │   └── getUser.nim
  │   ├── nitch.nim
  │   └── nitch.nim.cfg
  └── templates
      ├── cfgParser
      ├── cfgParser.nim
      ├── data.dat
      ├── listFiles.nim
      ├── readLine.nim
      ├── refTest.nim
      ├── shellCheck.nim
      ├── test.cfg
      ├── testFile
      └── testProc.nim

  7 directories, 30 files
```

# Thanks for ideas & examples 💬
- [pfetch](https://github.com/dylanaraps/pfetch/)
- [neofetch](https://github.com/dylanaraps/neofetch)
- [paleofetch](https://github.com/ss7m/paleofetch)
- [rxfetch](https://github.com/Mangeshrex/rxfetch)
- [nerdfetch](https://github.com/ThatOneCalculator/NerdFetch)
