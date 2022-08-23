#!/bin/bash

# Execute target hook

hook_target_a() {
    echo 'hook_target_a'
}

hook_target_b() {
    echo 'hook_target_b start'

    pwd

    #### luci-app-openclash
    svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash openwrt/package/luci-app-openclash

    #### luci-app-adguardhome
    # svn co https://github.com/Lienol/openwrt-package/branches/other/luci-app-adguardhome openwrt/package/luci-app-adguardhome
    git clone https://github.com/rufengsuixing/luci-app-adguardhome openwrt/package/luci-app-adguardhome
    # resolv.conf.auto
    # check_if_already_running

    #### luci-app-onliner
    git clone https://github.com/rufengsuixing/luci-app-onliner openwrt/package/luci-app-onliner

    #### luci-app-advanced
    git clone https://github.com/sirpdboy/luci-app-advanced openwrt/package/luci-app-advanced

    #### luci-app-filebrowser
    git clone https://github.com/giaulo/luci-app-filebrowser openwrt/package/luci-app-filebrowser

    #### luci-app-poweroff
    git clone https://github.com/esirplayground/luci-app-poweroff openwrt/package/luci-app-poweroff

    cp user/t1/.config openwrt/.config

    echo 'hook_target_b end'
}

hook_target_c() {
    echo 'hook_target_c'
}
