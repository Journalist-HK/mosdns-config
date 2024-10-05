# CDN 优化策略

介绍此配置对各种 CDN 的优化思路。所有结论都是在电信网络下测试得出，其他运营商请自行测试。

## Cloudflare

如过一个域名返回了 Cloudflare 的 IP，使用 `black_hole` 对它进行替换，参考 https://github.com/XIU2/CloudflareSpeedTest/discussions/317

需要注意的是 [Cloudflare Spectrum](https://www.cloudflare.com/application-services/products/cloudflare-spectrum/) 是一种反向代理，不是普通的 Web CDN，支持自定义端口（包括游戏在内的 UDP 应用）。此类域名不能替换 IP，特征为 CNAME pacloudflare.com。

其他的情况包括 Salesforce、Crisp、GitBook 支持的自定义域名，替换会导致错误。

## CloudFront

同 Cloudflare，参考 https://github.com/XIU2/CloudflareSpeedTest/discussions/304

由于部分地区和运营商存在限速（3-4 Mbps），优化的意义可能不大，推荐走代理。

## CacheFly

同 Cloudflare，IP 段不多，通常 `205.234.175.0/24` 最快。

## Fastly

Fastly 使用 Anycast IP (151.101.0.0/22)，通常会由地理位置在日本的服务器响应。这条线路质量很差，更换成 LAX 或 SJC 的 Unicast IP 效果明显更好。

Fastly 需要按照一定规则更换 IP，不太适合使用 `black_hole`（需要写 1024 条），这个配置还是选择使用 [hosts 文件](https://github.com/Journalist-HK/Rules/blob/main/hosts_fastly.txt)，更好的方法是使用自定义的插件（WIP）。具体规则请参考 [[讨论] 实现 fastly 优选线路的方案](https://github.com/IrineSistiana/mosdns/discussions/511)。

## CDN77

比较小众，目前不清楚具体的替换规则，使用日本 ECS 进行查询。

## Akamai

分为[两类](https://github.com/IrineSistiana/mosdns/discussions/489#discussioncomment-3711162)：

### akamai.net

同 Cloudflare，使用 `black_hole` 进行替换，但判断条件不是 `resp_ip` 而是 `cname`。测速链接：https://origin-a.akamaihd.net/Origin-Client-Download/origin/live/OriginSetup.exe

电信建议韩国日本美国，移动联通建议香港。

### akamaiedge.net

规则尚不清楚，使用 [hosts 文件](https://github.com/Journalist-HK/Rules/blob/main/hosts_akamai.txt)。

## 通用规则

添加了日本和美国 EDNS 列表，可以根据个人需要添加域名。