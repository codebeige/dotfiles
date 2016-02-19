if which /usr/libexec/java_home > /dev/null 2>&1; then
  export JAVA_HOME="$(/usr/libexec/java_home)"
fi
