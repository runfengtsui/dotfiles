#!/usr/bin/env python
import sys, os, shutil
import urllib.request, urllib.error
import tempfile
import tarfile

def reporthook(block_num, block_size, total_size):
    downloaded = block_num * block_size
    progress = downloaded / total_size * 100
    sys.stdout.write(f"\r下载进度: {progress:.2f}%")
    sys.stdout.flush()

VERSION = "1.10.10"

# uname -m in bash
ARCH = os.uname().machine
SARCH = "x64" if ARCH == "x86_64" else "aarch64"

url = (
    "https://mirrors.tuna.tsinghua.edu.cn/julia-releases/bin/linux/"
    f"{SARCH}/{VERSION.rsplit(".", 1)[0]}/julia-{VERSION}-linux-{ARCH}.tar.gz"
)
filename = os.path.basename(url)

with tempfile.TemporaryDirectory() as temp_dir:
    try:
        print(f"Downloading {filename} ...")
        filename = os.path.join(temp_dir, filename)
        urllib.request.urlretrieve(url, filename, reporthook)
        print("\nDownloaded Successfully!")

        extract_path = os.path.expanduser("~/.local/opt")
        if os.path.exists(os.path.join(extract_path, f"julia-{VERSION}")):
            shutil.rmtree(os.path.join(extract_path, f"julia-{VERSION}"))
        print(f"Extracting to {extract_path} ...")
        with tarfile.open(filename, "r:gz") as tar_file:
            tar_file.extractall(extract_path, filter="data")

        print("Creating symbolic link ...")
        binary_path = os.path.join(extract_path, f"julia-{VERSION}/bin/julia")
        os.symlink(binary_path, os.path.expanduser("~/.local/bin/julia"))

        print("Julia installation completed successfully!")

    except urllib.error.URLError:
        print("\nDownload Error! Please check your network connection and try again.")

    except Exception as e:
        print(f"\nAn error occured: {e}")

