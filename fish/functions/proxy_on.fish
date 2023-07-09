# 开启系统代理
function proxy_on
    set -gx http_proxy http://127.0.0.1:****
    set -gx https_proxy http://127.0.0.1:****
    set -gx no_proxy 127.0.0.1 localhost
    set -gx HTTP_PROXY http://127.0.0.1:****
    set -gx HTTPS_PROXY http://127.0.0.1:****
    set -gx NO_PROXY 127.0.0.1 localhost
    echo -e "\033[32m[√] 已开启代理\033[0m"
end

