# The path of rust/cargo env file
set cargoenv "$HOME/.cargo/env.fish"

# If the env file exists, source it.
if test -f $cargoenv
    source $cargoenv
end
