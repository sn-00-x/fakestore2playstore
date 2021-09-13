ui_print "Downloading patched PlayStore..."

mkdir -p $MODPATH/system/priv-app/Phonesky
WGET_OUTPUT=$(wget -O "$MODPATH/system/priv-app/Phonesky/Phonesky.apk" https://nanolx.org/fdroid/repo/Phonesky_132.apk)

if [ $? -ne 0 ] ; then
    ui_print $WGET_OUTPUT
    abort "Download FAILED"
fi

REPLACE="
/system/priv-app/FakeStore
"

# disable play protect
settings put global package_verifier_user_consent -1
