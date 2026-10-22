# magisk-chroot-distro-distributions
A repo that has custom made Magisk Chroot Distro Linux Distributions in which come with a configure script in the chroot environment to at least create a VNC user.

## Prerequisites
- Android device rooted with [Magisk](https://github.com/topjohnwu/magisk)
- [Magisk chroot-distro module](https://github.com/Magisk-Modules-Alt-Repo/chroot-distro/releases)
- Terminal Emulator. [Termux](https://github.com/termux/termux-app/releases/tag/v0.118.3) is recommended

## Usage

To use these linux distributions you will have to root your device with Magisk and install the latest release of chroot-distro to use these distributions. You will have to read the redme for each distro to figure out how to use them.

**[chroot-distro releases](https://github.com/Magisk-Modules-Alt-Repo/chroot-distro/releases)**


## Install chroot-distro

1. Download the latest chroot-distro module from the link above
2. Go to the Magisk app.
2. Go to "Modules" at the bottom
3. Click "Install from storage"
4. Browse for the zip file that you downloaded in Step 1 and install it.
5. Reboot

### Kill Script

You may need to script provided in the root of hte repo to kill the chroot-distro environment. Sometimes `chroot-distro unmount` gives up on /dev even with no processes holding it. The script lazy unmounts the leftover mount points, which detaches each mount even if the system thinks it's busy so the chrooted environment can be killed.

**Usage:**

```bash
# must be ran as root

su
chmod +x stop-distro.sh
./stop-distro.sh {distro-type} # distro-type: ubuntu, fedora, debian, etc
```

**[Kill Script](./stop-distro.sh)**


## Distributions

[Ubuntu/KDE/TeamViewer](./ubuntu-kde-teamviewer/README.md)


