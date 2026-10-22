#!/bin/sh
U=$(cat /etc/desktop-user)
R=$(cat /etc/desktop-res)
tvinfo=$(su - "$U" -c "teamviewer info 2>/dev/null | grep -qi \"TeamViewer ID\"")

/opt/teamviewer/tv_bin/teamviewerd -d

su - "$U" -c "vncserver :${1:-"1"} -geometry $R"

if $tvinfo; then
  sleep 5
  su - "$U" -c "DISPLAY=:${1:-"1"} teamviewer >/dev/null 2>&1 &"
fi
root@localhost:~# exit
logout
:/data/data/com.termux/files/home #
:/data/data/com.termux/files/home # exit
~ $ cat umount-distro.sh
#!/system/bin/sh
if [ -z "$1" ]; then
  echo "Usage: $0 <distro>   (e.g. ubuntu, debian, fedora)"
  exit 1
fi

R=/data/local/chroot-distro/$1
[ -d "$R" ] || { echo "No such distro: $R"; exit 1; }

# 1. Stop anything running inside the distro
for s in TERM KILL; do
  for p in /proc/[0-9]*; do
    [ "$(readlink "$p/root")" = "$R" ] && kill -$s "${p#/proc/}" 2>/dev/null
  done
  sleep 1
done

# 2. Try the normal unmount quietly
chroot-distro unmount "$1" >/dev/null 2>&1

# 3. Lazily detach whatever is left, deepest paths first
for i in 1 2 3; do
  grep -q " $R/" /proc/mounts || break
  awk -v r="$R/" 'index($2, r) == 1 {print $2}' /proc/mounts | sort -r |
    while read -r m; do umount -l "$m" 2>/dev/null; done
done

# 4. Report
if grep -q " $R/" /proc/mounts; then
  echo "Still mounted:"; grep " $R/" /proc/mounts; exit 1
fi
echo "$1 is shut down and unmounted."