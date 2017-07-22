if [ -d /usr/local/opt/android-sdk ]; then
  export ANDROID_HOME=/usr/local/opt/android-sdk
  path+=($ANDROID_HOME/tools $ANDROID_HOME/platform-tools)
fi
