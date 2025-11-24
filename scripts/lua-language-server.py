#!/usr/bin/env python
import os, sys, shutil
import urllib.request, urllib.error
import tempfile
import tarfile

# 下载进度条函数
def reporthook(block_num, block_size, total_size):
    downloaded = block_num * block_size
    progress = downloaded / total_size * 100
    sys.stdout.write(f"\r下载进度: {progress:.2f}%")
    sys.stdout.flush()

# Get architecture of OS
ARCH = ""
if os.uname().machine == "x86_64":
    ARCH = "x64"
elif os.uname().machine == "aarch64":
    ARCH = "arm64"

# Set version installed
VERSION = "3.15.0"

url = (
    "https://github.com/LuaLS/lua-language-server/releases/download/"
    f"{VERSION}/lua-language-server-{VERSION}-linux-{ARCH}.tar.gz"
)
filename = os.path.basename(url)

with tempfile.TemporaryDirectory() as temp_dir:
    try:
        print(f"Downloading {filename} ...")
        filename = os.path.join(temp_dir, filename)
        urllib.request.urlretrieve(url, filename, reporthook)
        print(f"\nDownloaded Successfully!")

        # Set extract path
        extract_path = os.path.expanduser("~/.local/opt/lua-language-server")
        if os.path.exists(extract_path):
            shutil.rmtree(extract_path)
        os.makedirs(extract_path)
        print(f"Extracting to {extract_path} ...")
        with tarfile.open(filename, "r:gz") as tar_file:
            tar_file.extractall(extract_path, filter="data")

        binary_path = os.path.join(extract_path, "bin/lua-language-server")
        symlink_path = os.path.expanduser("~/.local/bin/lua-language-server")
        if os.path.exists(symlink_path):
            os.remove(symlink_path)
        print("Creating symbolic link ...")
        os.symlink(binary_path, symlink_path)

        print("lua-language-server installation completed successfully!")
    
    except urllib.error.URLError:
        print("\nDownload Error! Please check your network connection and try again.")

    except PermissionError:
        print("Permission denied. This script requires sudo privileges for some operations.")
        print("Please run with sudo.")

    except Exception as e:
        print(f"\nAn error occured: {e}")
