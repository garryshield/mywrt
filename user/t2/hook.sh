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

    #### default-settings
    cat <<EOF >openwrt/package/base-files/files/etc/uci-defaults/bb-default-settings
####################################
# /etc/sysupgrade.conf
####
cp /etc/sysupgrade.conf /etc/sysupgrade.conf.bak
cat <<EOF1 >/etc/sysupgrade.conf
## This file contains files and directories that should
## be preserved during an upgrade.

# /etc/example.conf
# /etc/openvpn/

/etc/AdGuardHome.yaml
EOF1

exit 0
EOF

    cp user/t2/.config openwrt/.config

    echo 'hook_target_b end'
}

hook_target_c() {
    echo 'hook_target_c'
}
