# 关闭系统代理
function proxy_off
    set -e http_proxy
    set -e https_proxy
    set -e no_proxy
    set -e HTTP_PROXY
    set -e HTTPS_PROXY
    set -e NO_PROXY
    echo -e "\033[31m[x] 已关闭代理\033[0m"
end
