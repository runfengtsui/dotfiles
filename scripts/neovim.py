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

url = (
    "https://github.com/neovim/neovim/releases/download/"
    f"{args.version}/nvim-linux-{ARCH}.tar.gz"
)
filename = os.path.basename(url)

localpath = os.path.join(os.path.expanduser('~'), ".local")
# Create ~/.local/opt/ directory
os.makedirs(os.path.join(localpath, "opt"), exist_ok=True)
# Delete old symbolic link
if os.path.exists(os.path.join(localpath, "bin/nvim")):
    os.remove(os.path.join(localpath, "bin/nvim"))

with tempfile.TemporaryDirectory() as temp_dir:
    try:
        print(f"Downloading {filename} ...")
        filename = os.path.join(temp_dir, filename)
        urllib.request.urlretrieve(url, filename, reporthook)
        print("\nDownloaded Successfully!")

        print(f"Extracting to ~/.local/opt/ ...")
        with tarfile.open(filename, "r:gz") as tar_file:
            tar_file.extractall(os.path.join(localpath, 'opt'), filter="data")
        
        print("Creating symbolic link ...")
        os.symlink(os.path.join(localpath, f"opt/nvim-linux-{ARCH}/bin/nvim"),
                   os.path.join(localpath, "bin/nvim"))

        print("NeoVim installation completed successfully!")
    
    except urllib.error.URLError:
        print("\nDownload Error! Please check your network connection.")

    except Exception as e:
        print(f"\nAn error occured: {e}")
