#!/usr/bin/env python
import argparse
import os
from installer import uninstall, download, LOCAL_OPT, LOCAL_BIN
import tempfile, tarfile
from pathlib import Path

# Get the installation version from CLI
parser = argparse.ArgumentParser()
parser.add_argument(
    "-v", "--version",
    help = "Version of lua-language-server to be downloaded."
)
args = parser.parse_args()

# Architecture of OS
ARCH = ""
if os.uname().machine == "x86_64":
    ARCH = "x64"
elif os.uname().machine == "aarch64":
    ARCH = "arm64"

url = (
    "https://github.com/LuaLS/lua-language-server/releases/download/"
    f"{args.version}/lua-language-server-{args.version}-linux-{ARCH}.tar.gz"
)
filename = os.path.basename(url)

install_path = LOCAL_OPT / "lua-language-server"
# Create directories
LOCAL_OPT.mkdir(exist_ok=True)
LOCAL_BIN.mkdir(exist_ok=True)
install_path.mkdir(exist_ok=True)

# Uninstallation
uninstall("lua-language-server", LOCAL_OPT)

# Installation
with tempfile.TemporaryDirectory() as temp_dir:
    try:
        download(url, temp_dir)

        print(f"Extracting to {install_path} ...")
        with tarfile.open(Path(temp_dir) / filename, "r:gz") as tar_file:
            tar_file.extractall(install_path, filter="data")

        print("Creating symbolic link ...")
        os.symlink(
            install_path / "bin" / "lua-language-server",
            LOCAL_BIN / "lua-language-server"
        )

        print("lua-language-server installation completed successfully!")

    except Exception as e:
        print(f"\nAn error occured: {e}")
