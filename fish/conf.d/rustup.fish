# The path of rust/cargo
set prefix $HOME/.cargo

if test -e $prefix/env.fish
    # If the env.fish file exists, source it
    source $prefix/env.fish
else
    # If not, add the cargo bin directory to the PATH
    set -x PATH $prefix/bin $PATH
end
