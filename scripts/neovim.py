#!/usr/bin/env python
import argparse
from pathlib import Path
import os
from installer import uninstall, download, LOCAL_OPT, LOCAL_BIN
import tempfile, tarfile

# Get the installation version
parser = argparse.ArgumentParser()
parser.add_argument(
    "-v", "--version",
    choices=["stable", "nightly"],
    default="stable",
    help="Neovim stable version (default) or nightly version"
)
args = parser.parse_args()

# Get the system architecture
ARCH = ""
if os.uname().machine == "x86_64":
    ARCH = "x86_64"
elif os.uname().machine == "aarch64":
    ARCH = "arm64"

url = (
    "https://github.com/neovim/neovim/releases/download/"
    f"{args.version}/nvim-linux-{ARCH}.tar.gz"
)
filename = os.path.basename(url)

LOCAL_OPT.mkdir(exist_ok=True)
LOCAL_BIN.mkdir(exist_ok=True)

# Uninstallation
uninstall("nvim", LOCAL_OPT)

# Installation
with tempfile.TemporaryDirectory() as temp_dir:
    try:
        download(url, temp_dir)

        print(f"Extracting to {LOCAL_OPT} ...")
        with tarfile.open(Path(temp_dir) / filename, "r:gz") as tar_file:
            tar_file.extractall(LOCAL_OPT, filter="data")

        print("Creating symbolic link ...")
        os.symlink(
            LOCAL_OPT / f"nvim-linux-{ARCH}" / "bin" / "nvim",
            LOCAL_BIN / "nvim"
        )

        print("Neovim installation completed successfully!")

    except Exception as e:
        print(f"\nAn error occured: {e}")
