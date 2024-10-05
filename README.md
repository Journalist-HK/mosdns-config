# mosdns-config
## [mosdns](https://github.com/IrineSistiana/mosdns) v5 配置

配置文件不考虑和之前版本的兼容性，如需更新务必拉取所有文件。

yaml 文件应放在 `/etc/mosdns/` 目录下，可配合 luci-app-mosdns 使用。如果要在公网使用，建议将 OpenWrt 自带的 uHTTPd 更换成 Nginx 并设置反代。

可以搭配各种代理工具使用。需要将代理工具内置 DNS 指向 mosdns。顺序应为：Dnsmasq &rarr; 代理工具 &rarr; mosdns 或者 代理工具 &rarr; Dnsmasq &rarr; mosdns。无论使用何种顺序，请避免回环。

示例 Clash DNS 配置：

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

主要的分流思路是白名单走运营商 DNS，国内和 Akamai 走 [AliDNS](https://alidns.com/)，其余域名如解析为被墙或者国外 IP，采用可信 DNS。其中远程 DNS 使用 [EasyMosdns](https://apad.pro/dns-doh/)。

在此基础上，对于使用常见 CDN 的域名进行 IP 替换。具体策略见 [CDN 优化策略](CDN.md)。请定期更换 IP，防止不可用。推荐以下工具：

- [CloudflareSpeedTest](https://github.com/XIU2/CloudflareSpeedTest)
- [UsbEAm Hosts Editor](https://www.dogfight360.com/blog/475/)

### 注意事项

1. 此配置在电信网络下测试，其他运营商请自行测试，更换上游 DNS、hosts 文件、black_hole 目标。

1. 如果使用 TUN 模式自动设置路由，不要劫持运营商的 DNS，或者将运营商的 DNS 去掉，只用非 53 端口的上游。[#2](https://github.com/Journalist-HK/mosdns-config/issues/2)

1. 可以通过 socks5 代理来提高境外 DNS 的联通性。建议使用单独的代理程序，避免相互依赖。

    ```yaml
      - tag: "forward_remote"
        type: "forward"
        args:
          concurrent: 1
          upstreams:
            - addr: "https://162.159.36.1/dns-query"
              enable_http3: false
              socks5: "127.0.0.1:1080" # 目前暂不支持用户名密码认证，只支持基于 TCP 的协议
            - addr: "https://162.159.46.1/dns-query"
              enable_http3: false
    ```

1. 使用 crontab 定时运行 /script/update 来更新规则。

1. 如果在 log 中观察到污染记录，可以将域名添加至 greylist，避免后续再次查询国内上游。

参考：

>[使用Mosdns进行DNS分流](https://apad.pro/mosdns-client/)

>[DNS分流与泄露分析](https://apad.pro/dns-leak/)

>[pmkol/easymosdns](https://github.com/pmkol/easymosdns)

>[QiuSimons/openwrt-mos](https://github.com/QiuSimons/openwrt-mos)

>[sbwml/luci-app-mosdns](https://github.com/sbwml/luci-app-mosdns)
