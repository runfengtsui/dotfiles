# shutdown clash process
function shutdown_clash
    # ps - process status -e every -f full-format
    # wc -l [filename]: count filename lines
    set PID_NUM (ps -ef | grep [c]lash-linux-a | wc -l)
    # awk [action] [filename]
    set PID (ps -ef | grep [c]lash-linux-a | awk '{print $2}')

    if test $PID_NUM -ne 0
        sudo kill -9 $PID # kill a process, not allowed
        # ps -ef | grep [c]lash-linux-a | awk '{print $2}' | xargs kill -9
    end
    proxy_off
end
