#!/bin/bash

# Execute target hook

hook_target_a() {
    echo 'hook_target_a'
}

hook_target_b() {
    echo 'hook_target_b start'

    pwd

    svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash openwrt/package/luci-app-openclash
    svn co https://github.com/Lienol/openwrt-package/branches/other/luci-app-adguardhome openwrt/package/luci-app-adguardhome

    cp user/t1/.config openwrt/.config

    echo 'hook_target_b end'
}

hook_target_c() {
    echo 'hook_target_c'
}
