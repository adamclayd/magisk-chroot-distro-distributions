# Ubuntu 22.04 Kde TeamViewer 



1. Download the latest ubuntu-kde-teamviewer distribution from the release page of this repo.
2. Open your terminal emulator.
3. Extract:
   ```bash
   su
   chroot-distro restore ubuntu /path/to/downloaded/distro.tar.gz
   ```
4. Run configure script: (run each command individually)
   ```bash
   su

   # This script will create a new user with a password and add desktop startup script that can be called at any time
   # to start teamviewer and the vnc server
   # The vnc password will be the same as the user's password. 
   chroot-distro command ubuntu "setup-linux"

   # ...Follow Instructions
   ```

#### Startup Script

You can run the startup script after you have run the configure script to start the VNC server and TeamViewer (if you have it configured with an account or TeamViewer ID) in your terminal emulator:

```bash
# display-number defaults to 1
su -c chroot-distro command ubuntu "desktop-start [display-number]"
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



