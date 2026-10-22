# magisk-chroot-distro-distributions
A repo that has custom made Magisk Chroot Distro Linux Distributions with a configure script in the chroot environment.

## Useage

To use these linux distributions you will have to root your device with Magisk and install the latest release of chroot-distro to use these distributions.

**[chroot-distro releases](https://github.com/Magisk-Modules-Alt-Repo/chroot-distro/releases)**

### Install chroot-distro

1. Download the latest chroot-distro module from the link above
2. Go to the Magisk app.
2. Go to "Modules" at the bottom
3. Click "Install from storage"
4. Browse for the zip file that you downloaded in Step 1 and install it.
5. Reboot

### Use Linux Distributions

**Prerequisites**
- Terminal Emulator. I use Termux

**Note**
- *distro-type* refers to the type of distribution that you downloaded (eg. ubuntu, fedora, debian, etc)

1. Download a distribution from the release page of this repo.
2. Open your terminal emulator.
3. Extract:
   ```bash
   su
   chroot-distro restore <distro-type> /path/to/downloaded/distro.tar.gz
   ```
4. Run configure script: (run each command individually)
   ```bash
   su

   # This script will create a new user with a password and add desktop startup script that can be called at any time
   # to start teamviewer and the vnc server
   # The vnc password will be the same as the user's password. 
   chroot-distro command <distro-type> "setup-linux"

   # ...Follow Instructions
   ```

#### Startup Script

You can run the startup script after you have run the configure script to start the VNC server and TeamViewer (if you have it configured with an account or TeamViewer ID) in your terminal emulator:

```bash
# display-number defaults to 1
su -c chroot-distro command <distro-type> "desktop-start [display-number]"
```

#### VNC Port

The VNC ports start at 5900. They are configured with the display number. So if you pass 2 to the startup script the port will be 5902.

**Default:** *5901*

#### TeamViewer

You can use TeamViewer on these distros instead of VNC. You first have to login to with the user that you created with the configure script over a VNC session, pull up a terminal, and run the following command:

```bash
teamviewer
```

You can configure it for temporary remote access or you can login to an account. If you configure TeamViewer it will start automatically with the startup script. You will now be able to login to your chrooted session through TeamViewer.

TeamViewer has smoother and better graphics than VNC.



