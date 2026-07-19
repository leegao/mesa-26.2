adb pull "$(adb shell ls /sdcard/Winlator/logs/* -t | head -1)" winlator_log.txt
