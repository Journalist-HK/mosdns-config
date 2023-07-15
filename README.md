# mosdns-config
## 自用 OpenWrt [mosdns](https://github.com/IrineSistiana/mosdns) v5 设置

yaml 文件应放在 `/etc/mosdns/` 目录下，可配合 luci-app-mosdns 使用。如果要在公网使用，建议将 OpenWrt 自带的 uHTTPd 更换成 Nginx 并设置反代。

可以搭配 [OpenClash](https://github.com/vernesong/OpenClash) 使用。需要将 Clash 内置 DNS 指向 mosdns。使用 luci-app-mosdns 时需关闭其自带的 DNS 转发选项，开启 OpenClash 的 DNS 劫持。顺序应为：Dnsmasq &rarr; OpenClash &rarr; mosdns。

参考 Clash DNS 配置：

```yaml
dns:
  enable: true
  ipv6: true
  # default-nameserver: [] # 用不到
  enhanced-mode: fake-ip
  fake-ip-range: 198.18.0.1/16
  nameserver:
    - '127.0.0.1:5335'
```

主要的分流思路是白名单走运营商 DNS，国内和 Akamai 走 [AliDNS](https://alidns.com/)，其余域名如解析为被墙或者国外IP，采用可信 DNS。其中远程 DNS 使用 [EasyMosdns](https://apad.pro/dns-doh/)。

在此基础上，参考了
- https://github.com/XIU2/CloudflareSpeedTest/discussions/317 
- https://github.com/IrineSistiana/mosdns/discussions/489

对于使用 4 个常见 CDN 的域名进行 IP 替换。其中对于 Fastly 站点，使用美国 EDNS 重新请求。

参考：

>[使用Mosdns进行DNS分流](https://apad.pro/mosdns-client/)

>[DNS分流与泄露分析](https://apad.pro/dns-leak/)

>[pmkol/easymosdns](https://github.com/pmkol/easymosdns)

>[QiuSimons/openwrt-mos](https://github.com/QiuSimons/openwrt-mos)

>[sbwml/luci-app-mosdns](https://github.com/sbwml/luci-app-mosdns)
