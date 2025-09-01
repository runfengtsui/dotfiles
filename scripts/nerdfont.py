#!/usr/bin/env python
import os
import sys
import urllib.request, urllib.error         # Download File
import tempfile                             # Temporary File/Directory
import zipfile                              # Extract Zip File
import subprocess                           # Run Bash Command

def reporthook(block_num, block_size, total_size):
    """ 用于显示下载进度, `urlretrieve` 回调函数.

    Args:
        block_num: 已经下载的数据块;
        block_size: 数据块的大小;
        total_size: 远程文件的大小.
    """
    downloaded = block_num * block_size
    progress = downloaded / total_size * 100
    # 不使用 `print()` 避免自动换行, `\r` 回到行首, `flush()` 立即刷新输出缓冲区.
    sys.stdout.write(f"\r下载进度：{progress:.2f}%")
    sys.stdout.flush()

VERSION = "3.4.0"
url = f"https://github.com/ryanoasis/nerd-fonts/releases/download/v{VERSION}/FiraCode.zip"
filename = os.path.basename(url)

with tempfile.TemporaryDirectory() as temp_dir:
    try:
        print(f"Downloading FiraCode-v{VERSION} ...")
        filename = os.path.join(temp_dir, filename)
        urllib.request.urlretrieve(url, filename, reporthook)
        print("\nDownload Successfully!")

        print("Extracting to ~/.local/share/fonts ...")
        # os.path.expanduser() converts `~` to home directory.
        fonts_dir = os.path.expanduser("~/.local/share/fonts/FiraCode")
        # os.makedirs() is equal to the command `mkdir -p`.
        os.makedirs(fonts_dir, exist_ok=True)
        # Extract the zip file
        with zipfile.ZipFile(filename, "r") as zip_file:
            zip_file.extractall(fonts_dir)

        # Update fonts cache
        print("Updating Fonts Cache ...")
        subprocess.run(["fc-cache", "-fv"], check=True)

        print("Fonts installation completed successfully!")

    except urllib.error.URLError as e:
        print("\nDownload Error! Please check your network connection and try again.")

    except Exception as e:
        print(f"An error occurred: {e}")
