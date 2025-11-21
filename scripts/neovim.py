#!/usr/bin/env python
import argparse
import os
import sys
import urllib.request, urllib.error
import tempfile
import tarfile

# 获取安装版本
parser = argparse.ArgumentParser()
parser.add_argument(
    "-v", "--version",
    choices=["stable", "nightly"],
    default="stable",
    help="NeoVim 稳定版本 (stable, 默认) 或开发版本 (nightly)"
)
args = parser.parse_args()

# 下载进度条函数
def reporthook(block_num, block_size, total_size):
    downloaded = block_num * block_size
    progress = downloaded / total_size * 100
    sys.stdout.write(f"\r下载进度: {progress:.2f}%")
    sys.stdout.flush()

# 获取系统架构
ARCH = ""
if os.uname().machine == "x86_64":
    ARCH = "x86_64"
elif os.uname().machine == "aarch64":
    ARCH = "arm64"

url = f"https://github.com/neovim/neovim/releases/download/{args.version}/nvim-linux-{ARCH}.tar.gz"
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

        if os.path.exists("/usr/local/bin/nvim"):
            os.remove("/usr/local/bin/nvim")
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
