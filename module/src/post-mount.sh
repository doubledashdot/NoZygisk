#!/system/bin/sh

set -e

# INFO: Runs after the module has been mounted.
#         Restores module.prop to its default state so any temporary
#         modifications from the previous boot are removed.

MODDIR=/data/adb/modules/nozygisk

# INFO: Restore the original module.prop saved during installation.
cp "$MODDIR/module.prop.bak" "$MODDIR/module.prop"

exit 0
