#!/usr/bin/env python
import os
import sys
import urllib.request, urllib.error
import tempfile
import tarfile

def reporthook(block_num, block_size, total_size):
    downloaded = block_num * block_size
    progress = downloaded / total_size * 100
    sys.stdout.write(f"\r下载进度: {progress:.2f}%")
    sys.stdout.flush()

ARCH = ""
if os.uname().machine == "x86_64":
    ARCH = "x86_64"
elif os.uname().machine == "aarch64":
    ARCH = "arm64"

url = f"https://github.com/neovim/neovim/releases/download/stable/nvim-linux-{ARCH}.tar.gz"
filename = os.path.basename(url)

with tempfile.TemporaryDirectory() as temp_dir:
    try:
        print(f"Downloading {filename} ...")
        filename = os.path.join(temp_dir, filename)
        urllib.request.urlretrieve(url, filename, reporthook)
        print(f"\nDownloaded Successfully!")

        print("Extracting to /opt ...")
        with tarfile.open(filename, "r:gz") as tar_file:
            tar_file.extractall("/opt/", filter="data")

        print("Creating symbolic link ...")
        nvim_bin_path = f"/opt/nvim-linux-{ARCH}/bin/nvim"
        os.symlink(nvim_bin_path, "/usr/local/bin/nvim")

        print("NeoVim installation completed successfully!")
    
    except urllib.error.URLError:
        print("\nDownload Error! Please check your network connection and try again.")

    except PermissionError:
        print("Permission denied. This script requires sudo privileges for some operations.")
        print("Please run with sudo.")

    except Exception as e:
        print(f"\nAn error occured: {e}")
