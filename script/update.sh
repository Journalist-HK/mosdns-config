#!/bin/sh
# Powered by Apad.pro
# https://apad.pro/easymosdns
#
mosdns_working_dir="/etc/mosdns"
mkdir -p /tmp/easymosdns \
&& curl https://ghproxy.cc/https://raw.githubusercontent.com/Journalist-HK/Rules/main/akamai_domain_list.txt > /tmp/easymosdns/akamai_domain_list.txt \
&& curl https://ghproxy.cc/https://raw.githubusercontent.com/Journalist-HK/Rules/main/block_list.txt > /tmp/easymosdns/block_list.txt \
&& curl https://ghproxy.cc/https://raw.githubusercontent.com/Journalist-HK/Rules/main/china_domain_list_mini.txt > /tmp/easymosdns/china_domain_list_mini.txt \
&& curl https://ghproxy.cc/https://raw.githubusercontent.com/Journalist-HK/Rules/main/cloudfront.txt > /tmp/easymosdns/cloudfront.txt \
&& curl https://ghproxy.cc/https://raw.githubusercontent.com/Journalist-HK/Rules/main/cloudfront_ipv6.txt > /tmp/easymosdns/cloudfront_ipv6.txt \
&& curl https://ghproxy.cc/https://raw.githubusercontent.com/Journalist-HK/Rules/main/custom_list.txt > /tmp/easymosdns/custom_list.txt \
&& curl https://ghproxy.cc/https://raw.githubusercontent.com/Journalist-HK/Rules/main/gfw_ip_list.txt > /tmp/easymosdns/gfw_ip_list.txt \
&& curl https://ghproxy.cc/https://raw.githubusercontent.com/Journalist-HK/Rules/main/grey_list.txt > /tmp/easymosdns/grey_list.txt \
&& curl https://ghproxy.cc/https://raw.githubusercontent.com/Journalist-HK/Rules/main/hosts_akamai.txt > /tmp/easymosdns/hosts_akamai.txt \
&& curl https://ghproxy.cc/https://raw.githubusercontent.com/Journalist-HK/Rules/main/hosts_fastly.txt > /tmp/easymosdns/hosts_fastly.txt \
&& curl https://ghproxy.cc/https://raw.githubusercontent.com/Journalist-HK/Rules/main/original_domain_list.txt > /tmp/easymosdns/original_domain_list.txt \
&& curl https://ghproxy.cc/https://raw.githubusercontent.com/Journalist-HK/Rules/main/ipv6_domain_list.txt > /tmp/easymosdns/ipv6_domain_list.txt \
&& curl https://ghproxy.cc/https://raw.githubusercontent.com/Journalist-HK/Rules/main/private.txt > /tmp/easymosdns/private.txt \
&& curl https://ghproxy.cc/https://raw.githubusercontent.com/Journalist-HK/Rules/main/white_list.txt > /tmp/easymosdns/white_list.txt \
&& curl https://ghproxy.cc/https://raw.githubusercontent.com/Loyalsoldier/geoip/release/text/facebook.txt > /tmp/easymosdns/facebook.txt \
&& curl https://ghproxy.cc/https://raw.githubusercontent.com/Loyalsoldier/geoip/release/text/fastly.txt > /tmp/easymosdns/fastly.txt \
&& curl https://ghproxy.cc/https://raw.githubusercontent.com/Loyalsoldier/geoip/release/text/telegram.txt > /tmp/easymosdns/telegram.txt \
&& curl https://ghproxy.cc/https://raw.githubusercontent.com/Loyalsoldier/geoip/release/text/twitter.txt > /tmp/easymosdns/twitter.txt \
&& curl https://ghproxy.cc/https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/gfw.txt > /tmp/easymosdns/gfw.txt \
&& curl https://ghproxy.cc/https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/greatfire.txt > /tmp/easymosdns/greatfire.txt \
&& curl https://ghproxy.cc/https://raw.githubusercontent.com/pmkol/easymosdns/rules/ad_domain_list.txt > /tmp/easymosdns/ad_domain_list.txt \
&& curl https://ghproxy.cc/https://raw.githubusercontent.com/pmkol/easymosdns/rules/cdn_domain_list.txt > /tmp/easymosdns/cdn_domain_list.txt \
&& curl https://ghproxy.cc/https://raw.githubusercontent.com/pmkol/easymosdns/rules/china_domain_list.txt > /tmp/easymosdns/china_domain_list.txt \
&& curl https://ghproxy.cc/https://raw.githubusercontent.com/pmkol/easymosdns/rules/china_ip_list.txt > /tmp/easymosdns/china_ip_list.txt \
&& curl https://ghproxy.cc/https://raw.githubusercontent.com/XIU2/CloudflareSpeedTest/master/ip.txt > /tmp/easymosdns/ip.txt \
&& curl https://ghproxy.cc/https://raw.githubusercontent.com/XIU2/CloudflareSpeedTest/master/ipv6.txt > /tmp/easymosdns/ipv6.txt \
&& cp -rf /tmp/easymosdns/*.txt $mosdns_working_dir/rule \
&& rm -rf /tmp/easymosdns/* \
&& echo 'update successful'