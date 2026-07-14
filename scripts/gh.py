#!/usr/bin/env python
import os
import argparse
from pathlib import Path
from installer import uninstall, download, LOCAL_OPT, LOCAL_BIN
import tempfile, tarfile

# Get the installation version from CLI
parser = argparse.ArgumentParser()
parser.add_argument(
    "-v", "--version",
    help = "Version of gh to be downloaded."
)
args = parser.parse_args()

# Architecture of OS
ARCH = ""
if os.uname().machine == "x86_64":
    ARCH = "amd64"
elif os.uname().machine == "aarch64":
    ARCH = "arm64"

url = (
    "https://github.com/cli/cli/releases/download/"
    f"v{args.version}/gh_{args.version}_linux_{ARCH}.tar.gz"
)
filename = os.path.basename(url)

# Uninstallation
uninstall("gh", LOCAL_OPT)

# Installation
with tempfile.TemporaryDirectory() as temp_dir:
    try:
        download(url, temp_dir)

        print(f"Extracting to {LOCAL_OPT} ...")
        with tarfile.open(Path(temp_dir) / filename, "r:gz") as tar_file:
            tar_file.extractall(LOCAL_OPT, filter="data")

        print("Creating symbolic link ...")
        os.symlink(
            LOCAL_OPT / f"gh_{args.version}_linux_{ARCH}" / "bin" / "gh",
            LOCAL_BIN / "gh"
        )

        print("gh installation completed successfully!")

    except Exception as e:
        print(f"\nAn error occured: {e}")
