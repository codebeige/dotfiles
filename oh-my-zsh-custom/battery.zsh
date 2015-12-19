_get_battery_status() {
  pmset -g batt | awk 'NR==2 { gsub(/;/,""); print $2 "\n" $3 "\n" $4 }'
}

battery_status() {
  local data=("${(f)$(_get_battery_status)}")
  case $data[2] in
    charged)     local mode="[*] ";;
    charging)    local mode= "[+] ";;
    discharging) local mode="[-] ";;
    *)           local mode=""
  esac
  local percent=$data[1]
  if [[ $data[3] =~ '[[:digit:]]{1,2}:[[:digit:]]{2}' ]]; then
    local remaining=" ($data[3])"
  fi
  echo "$mode$percent$remaining"
}
