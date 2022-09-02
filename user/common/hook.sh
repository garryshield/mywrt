#!/bin/bash

# Execute common hook

hook_common_a() {
    echo 'hook_common_a'

    env

    echo $REPO_URL
}

hook_common_b() {
    echo 'hook_common_b start'

    pwd

    #### default-settings
    cat <<EOF >openwrt/package/base-files/files/etc/uci-defaults/aa-default-settings
####################################
# /etc/config/network
####
cp /etc/config/network /etc/config/network.bak

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
# DISTRIB_REVISION='R22.8.2'
# DISTRIB_REVISION='R22.8.2 (20220826) Compiled By GarryShield'
cp /etc/openwrt_release /etc/openwrt_release.bak
TMP_OLD="\$(cat /etc/openwrt_release | grep DISTRIB_REVISION= | awk -F "'" '{print \$2}')"
TMP_NEW="\${TMP_OLD} (\$(date +"%Y%m%d")) Compiled By GarryShield"
sed -i "s:\${TMP_OLD}:\${TMP_NEW}:g" /etc/openwrt_release

cp /etc/banner /etc/banner.bak
TMP_D="\$(cat /etc/os-release | grep ^NAME= | awk -F "\"" '{print \$2}')"
TMP_V="\$(cat /etc/os-release | grep ^VERSION= | awk -F "\"" '{print \$2}')"
TMP_C="\$(cat /etc/openwrt_version)"
cat <<EOF1 >/etc/banner
     _________
    /        /\      _    ___ ___  ___
   /  LE    /  \    | |  | __|   \| __|
  /    DE  /    \   | |__| _|| |) | _|
 /________/  LE  \  |____|___|___/|___|
 \        \   DE /
  \    LE  \    /  -------------------------------------------
   \  DE    \  /    \${TMP_D} \${TMP_V}, \${TMP_C}
    \________\/    -------------------------------------------

--------------------------------------------------------------
\${TMP_D} \${TMP_NEW}
--------------------------------------------------------------
EOF1

exit 0
EOF

    echo 'hook_common_b end'
}

hook_common_c() {
    echo 'hook_common_c'
}
