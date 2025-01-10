export UWSM_USE_SESSION_SLICE=true
#export XCURSOR_SIZE=10
#export QT_QPA_PLATFORMTHEME=qt5ct

if uwsm check may-start && uwsm select; then
    exec systemd-cat -t uwsm_start uwsm start -S default 
fi
