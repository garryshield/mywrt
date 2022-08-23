#!/bin/bash

# Execute target hook

hook_target_a() {
    echo 'hook_target_a'
}

hook_target_b() {
    echo 'hook_target_b start'

    pwd

    #### luci-app-advanced
    git clone https://github.com/sirpdboy/luci-app-advanced openwrt/package/luci-app-advanced

    #### luci-app-openclash
    svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash openwrt/package/luci-app-openclash

    #### luci-app-adguardhome
    git clone https://github.com/rufengsuixing/luci-app-adguardhome openwrt/package/luci-app-adguardhome

    #### appfilter
    git clone https://github.com/destan19/OpenAppFilter.git openwrt/package/OpenAppFilter

    cp user/t1/.config openwrt/.config

    echo 'hook_target_b end'
}

hook_target_c() {
    echo 'hook_target_c'
}
