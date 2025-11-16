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

# os.uname().machine is equal to the command `uname -m`
ARCH = os.uname().machine
VERSION = "1.10.10"

url = f"https://julialang-s3.julialang.org/bin/linux/{ARCH}/{VERSION.rsplit(".", 1)[0]}/julia-{VERSION}-linux-{ARCH}.tar.gz"
filename = os.path.basename(url)

with tempfile.TemporaryDirectory() as temp_dir:
    try:
        print(f"Downloading {filename} ...")
        filename = os.path.join(temp_dir, filename)
        urllib.request.urlretrieve(url, filename, reporthook)
        print("\nDownloaded Successfully!")

        print("Extracting to /opt ...")
        with tarfile.open(filename, "r:gz") as tar_file:
            tar_file.extractall("/opt/", filter="data")

        print("Creating symbolic link ...")
        julia_bin_path = f"/opt/julia-{VERSION}/bin/julia"
        os.symlink(julia_bin_path, "/usr/local/bin/julia")

        print("Julia installation completed successfully!")

    except urllib.error.URLError:
        print("\nDownload Error! Please check your network connection and try again.")

    except PermissionError:
        print("Permission denied. This script requires sudo privileges for some operations.")
        print("Please run with sudo.")

    except Exception as e:
        print(f"\nAn error occured: {e}")
