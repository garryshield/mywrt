#!/bin/bash

# Execute target hook

hook_target_a() {
    echo 'hook_target_a'
}

hook_target_b() {
    echo 'hook_target_b start'

    pwd

    #### luci-app-advanced
    git clone https://github.com/sirpdboy/luci-app-advanced openwrt/package/t2/luci-app-advanced

    #### luci-app-openclash
    svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash openwrt/package/t2/luci-app-openclash

    #### luci-app-adguardhome
    git clone https://github.com/rufengsuixing/luci-app-adguardhome openwrt/package/t2/luci-app-adguardhome
    sed -i 's:check_if_already_running$:# check_if_already_running:g' openwrt/package/t2/luci-app-adguardhome/root/usr/share/AdGuardHome/update_core.sh
    sed -i 's:/tmp/resolv.conf.auto:/tmp/resolv.conf.d/resolv.conf.auto:g' openwrt/package/t2/luci-app-adguardhome/luasrc/controller/AdGuardHome.lua
    sed -i 's:/tmp/resolv.conf.auto:/tmp/resolv.conf.d/resolv.conf.auto:g' openwrt/package/t2/luci-app-adguardhome/luasrc/model/cbi/AdGuardHome/manual.lua
    sed -i 's:/tmp/resolv.conf.auto:/tmp/resolv.conf.d/resolv.conf.auto:g' openwrt/package/t2/luci-app-adguardhome/root/etc/init.d/AdGuardHome

    #### luci-app-oaf
    git clone https://github.com/destan19/OpenAppFilter.git openwrt/package/t2/OpenAppFilter

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

    cp user/t2/.config openwrt/.config

    echo 'hook_target_b end'
}

hook_target_c() {
    echo 'hook_target_c'
}
