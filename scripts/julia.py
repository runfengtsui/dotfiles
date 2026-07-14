#!/usr/bin/env python
import os
import argparse
from installer import uninstall, download, LOCAL_OPT, LOCAL_BIN
import tempfile, tarfile
from pathlib import Path

parser = argparse.ArgumentParser()
parser.add_argument(
    "-v", "--version",
    help = "Version of Julia to be downloaded."
)
args = parser.parse_args()

ARCH = os.uname().machine
SARCH = "x64" if ARCH == "x86_64" else "aarch64"

url = (
    "https://mirrors.tuna.tsinghua.edu.cn/julia-releases/bin/linux/"
    f"{SARCH}/{args.version.rsplit(".", 1)[0]}/"
    f"julia-{args.version}-linux-{ARCH}.tar.gz"
)
filename = os.path.basename(url)

# Uninstallation
uninstall("julia", LOCAL_OPT)

# Installation
with tempfile.TemporaryDirectory() as temp_dir:
    try:
        download(url, temp_dir)

        print(f"Extracting to {LOCAL_OPT} ...")
        with tarfile.open(Path(temp_dir) / filename, "r:gz") as tar_file:
            tar_file.extractall(LOCAL_OPT, filter="data")

        print("Creating symbolic link ...")
        os.symlink(
            LOCAL_OPT / f"julia-{args.version}" / "bin" / "julia",
            LOCAL_BIN / "julia"
        )

        print("Julia installation completed successfully!")

    except Exception as e:
        print(f"\nAn error occured: {e}")
