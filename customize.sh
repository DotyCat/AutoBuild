#!/bin/bash

sed -i 's/192.168.1.1/192.168.1.1/g' package/base-files/files/bin/config_generate
sed -i "s/hostname='.*'/hostname='DOTYWRT'/g" package/base-files/files/bin/config_generate

./scripts/feeds update -a

rm -rf feeds/luci/applications/luci-app-argon-config
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/luci/applications/luci-app-openclash
rm -rf feeds/packages/net/{xray-core,v2ray-geodata,sing-box,chinadns-ng,dns2socks,hysteria,ipt2socks,microsocks,naiveproxy,shadowsocks-libev,shadowsocks-rust,shadowsocksr-libev,simple-obfs,tcping,trojan-plus,tuic-client,v2ray-plugin,xray-plugin,geoview,shadow-tls}

git clone --depth=1 https://github.com/Openwrt-Passwall/openwrt-passwall-packages package/passwall-packages
git clone --depth=1 https://github.com/Openwrt-Passwall/openwrt-passwall package/luci-app-passwall
git clone --depth=1 https://github.com/Openwrt-Passwall/openwrt-passwall2 package/luci-app-passwall2
git clone --depth=1 https://github.com/vernesong/OpenClash package/luci-app-openclash

git clone --depth=1 https://github.com/DotyCat/luci-theme-argon.git feeds/luci/themes/luci-theme-argon
git clone --depth=1 https://github.com/DotyCat/luci-app-argon-config.git feeds/luci/applications/luci-app-argon-config
git clone --depth=1 https://github.com/DotyCat/QModem.git package/qmodem
git clone --depth=1 https://github.com/DotyCat/luci-app-modeminfo.git package/luci-app-modeminfo
git clone --depth=1 https://github.com/DotyCat/luci-app-netstat.git package/luci-app-netstat
git clone --depth=1 https://github.com/DotyCat/luci-app-xraycustom.git package/luci-app-xraycustom
git clone --depth=1 https://github.com/DotyCat/luci-app-aw1k-led.git package/luci-app-aw1k-led

echo "baidu.com"  > package/luci-app-passwall/luci-app-passwall/root/usr/share/passwall/rules/chnlist

./scripts/feeds install -a
