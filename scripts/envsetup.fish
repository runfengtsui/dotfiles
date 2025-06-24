#! /usr/bin/env fish

# Define variable $script_name locally
set -l script_name (status current-filename)
# Get the absolute path of the script.
# If you have installed `coreutils`, you can use `realpath` command.
# For Deepin/Ubuntu, you can install the dependency `coreutils` by
# apt install coreutils
if command -q realpath
    set script_dir (dirname (realpath -- "$script_name"))
else
    set script_dir (dirname (python -c "import os; print(os.path.realpath('$script_name'))"))
end
set -e script_name

# Define environment variable (x) globally (g)
set -gx CANGJIE_HOME $script_dir
set -e script_dir

# Get the architecture information of the system.
set -l hw_arch (arch)
# Set Cangjie environment variables
set -gx PATH $CANGJIE_HOME/bin $PATH
set -gx PATH $CANGJIE_HOME/tools/bin $PATH $HOME/.cjpm/bin
set -gx LD_LIBRARY_PATH $CANGJIE_HOME/runtime/lib/linux_{$hw_arch}_llvm
set -gx LD_LIBRARY_PATH $CANGJIE_HOME/tools/lib $LD_LIBRARY_PATH
set -e hw_arch

