#!/bin/bash

# Execute common hook

hook_common_a() {
    echo 'hook_common_a'
}

hook_common_b() {
    echo 'hook_common_b start'

    pwd

    #### default-settings
    cat <<EOF >openwrt/package/base-files/files/etc/uci-defaults/9999-default-settings
####################################
# /etc/config/network
####

# lan
uci set network.lan.proto='static'
uci set network.lan.ipaddr='10.10.1.1'
uci set network.lan.netmask='255.255.255.0'

# wan
if [ -n "\$(uci -q get network.wan)" ]; then
    uci set network.wan.proto='pppoe'
    uci set network.wan.username=''
    uci set network.wan.password=''
fi

uci commit network

####################################
# /etc/openwrt_release
# /etc/banner
####
TMP="\$(cat /etc/openwrt_release | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')"
sed -i "s/\${TMP}/\${TMP} (\$(date +"%Y-%m-%d")) By GarryShield/g" /etc/openwrt_release

cat <<EOF1 >/etc/banner
     _________
    /        /\      _    ___ ___  ___
   /  LE    /  \    | |  | __|   \| __|
  /    DE  /    \   | |__| _|| |) | _|
 /________/  LE  \  |____|___|___/|___|
 \        \   DE /
  \    LE  \    /  -------------------------------------------
   \  DE    \  /    %D %V, %C
    \________\/    -------------------------------------------

--------------------------------------------------------------
${TMP} ($(date +"%Y-%m-%d")) By GarryShield
--------------------------------------------------------------
EOF1

exit 0
EOF

    echo 'hook_common_b end'
}

hook_common_c() {
    echo 'hook_common_c'
}
