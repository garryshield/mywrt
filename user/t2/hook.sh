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

    #### luci-app-oaf
    git clone https://github.com/destan19/OpenAppFilter.git openwrt/package/t2/OpenAppFilter

    cp user/t2/.config openwrt/.config

    echo 'hook_target_b end'
}

hook_target_c() {
    echo 'hook_target_c'
}
