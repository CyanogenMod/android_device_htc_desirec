#!/system/bin/sh

# Initialize lights at boot to enable trackball notifications - conap
echo 3 > sys/class/leds/jogball-backlight/brightness

sleep 3

echo 0 > sys/class/leds/jogball-backlight/brightness

insmod system/lib/modules/loop.ko
insmod system/lib/modules/cryptoloop.ko

# Undead Call Fix by bftb0
_APK='/system/app/DMPortRead.apk'
_DIR='/data/data/com.android.dmportread'
_HIST="$_DIR"'/history'

if [ -f $_APK ] ; then
  # basically, do nothing. Don't fix what aint broke. 
  :
else
  if [ ! -d $_DIR ]; then
    mkdir $_DIR
    chown radio:radio $_DIR
    chmod 755 $_DIR
  fi

  # if the history file is there just clobber it
  cp /dev/null $_HIST
  chown radio:radio $_HIST
  chmod 666 $_HIST

fi
