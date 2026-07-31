function proxy
    switch $argv
        case "on"
            set -gx http_proxy http://127.0.0.1:7890
            set -gx https_proxy http://127.0.0.1:7890
            set -gx no_proxy 127.0.0.1 localhost
            set -gx HTTP_PROXY http://127.0.0.1:7890
            set -gx HTTPS_PROXY http://127.0.0.1:7890
            set -gx NO_PROXY 127.0.0.1 localhost
            echo -e "\033[32m[√] Proxy On!\033[0m"
        case "off"
            set -e http_proxy
            set -e https_proxy
            set -e no_proxy
            set -e HTTP_PROXY
            set -e HTTPS_PROXY
            set -e NO_PROXY
            echo -e "\033[31m[x] Proxy Off!\033[0m"
        case "status"
            if test -n "$http_proxy"
                echo -e "\033[32m[√] Proxy is On!\033[0m"
                echo "http_proxy: $http_proxy"
                echo "https_proxy: $https_proxy"
                echo "no_proxy: $no_proxy"
                echo "HTTP_PROXY: $HTTP_PROXY"
                echo "HTTPS_PROXY: $HTTPS_PROXY"
                echo "NO_PROXY: $NO_PROXY"
            else
                echo -e "\033[31m[x] Proxy is Off!\033[0m"
            end
        case "*"
            echo "Usage: proxy [on|off|status]"
    end
end
