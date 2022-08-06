# mosdns-config
自用 OpenWrt [mosdns](https://github.com/IrineSistiana/mosdns) 设置

可以搭配 [passwall](https://github.com/xiaorouji/openwrt-passwall/tree/luci) 黑名单模式透明代理使用。可以不修改 [passwall](https://github.com/xiaorouji/openwrt-passwall/tree/luci) 的 DNS 设置，只有直连才经过 [mosdns](https://github.com/IrineSistiana/mosdns)。其中远程 DNS 使用 https://apad.pro/dns-doh/ 和 [iQDNS](https://iqdns.xyz/all.html)。

需要修改 [passwall](https://github.com/xiaorouji/openwrt-passwall/tree/luci) 的 gfwlist 为以下 3 个文件：

- https://ghproxy.com/https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/gfw.txt
- https://ghproxy.com/https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/greatfire.txt
- https://ghproxy.com/https://raw.githubusercontent.com/Loukky/gfwlist-by-loukky/master/gfwlist.txt

主要的分流思路是国内走电信 DNS，akamai 等 CDN 域名走 [AliDNS](https://alidns.com/)，其余域名如解析为被墙或者国外IP，采用可信 DNS。

参考：

>[pmkol/easymosdns](https://github.com/pmkol/easymosdns)

>[QiuSimons/openwrt-mos](https://github.com/QiuSimons/openwrt-mos)

>[sbwml/luci-app-mosdns](https://github.com/sbwml/luci-app-mosdns)
