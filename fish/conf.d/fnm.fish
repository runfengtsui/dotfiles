set -gx PATH "/run/user/1000/fnm_multishells/155109_1728197124630/bin" $PATH;
set -gx FNM_LOGLEVEL "info";
set -gx FNM_DIR "/home/tsui/.local/share/fnm";
set -gx FNM_VERSION_FILE_STRATEGY "local";
set -gx FNM_RESOLVE_ENGINES "false";
set -gx FNM_COREPACK_ENABLED "false";
set -gx FNM_NODE_DIST_MIRROR "https://nodejs.org/dist";
set -gx FNM_ARCH "x64";
set -gx FNM_MULTISHELL_PATH "/run/user/1000/fnm_multishells/155109_1728197124630";
function _fnm_autoload_hook --on-variable PWD --description 'Change Node version on directory change'
    status --is-command-substitution; and return
    if test -f .node-version -o -f .nvmrc
    fnm use --silent-if-unchanged
end

end

_fnm_autoload_hook

