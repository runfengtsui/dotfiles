# fnm
set FNM_PATH "$XDG_DATA_HOME/fnm"

if test -d $FNM_PATH
    set PATH $FNM_PATH $PATH
    fnm env --shell fish | source
end
