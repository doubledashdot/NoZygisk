#!/system/bin/sh

set -e

export TMP_PATH=/data/adb/nozygisk
rm -rf "$TMP_PATH"

# INFO: Only removes if dir is empty
rmdir /data/adb/post-fs-data.d
rmdir /data/adb/post-mount.d

exit 0
