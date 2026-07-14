import os, sys, shutil
from pathlib import Path
from typing import Union
from urllib import request
import argparse

LOCAL = Path.home() / ".local"
LOCAL_OPT = LOCAL / "opt"
LOCAL_BIN = LOCAL / "bin"

def reporthook(block_num, block_size, total_size):
    """ Callback function for `urlretrieve`.
    Show progress of downloading.

    Args:
        block_num: number of downaloaded blocks;
        block_size: size of every data block;
        total_size: size of downloading file.
    """
    downloaded = block_num * block_size
    progress = min(100, downloaded / total_size * 100)
    sys.stdout.write(f"\rDownload Progress: {progress:.2f}%")
    sys.stdout.flush

def download(url: str, path: str = ".") -> None:
    """ Download file from url.
    """
    filename = os.path.basename(url)
    try:
        print(f"Downloading {filename} ...")
        filename = os.path.join(path, filename)
        request.urlretrieve(url, filename, reporthook)
        print(f"\nDownloaded successfully!")
    except:
        raise

def uninstall(name: str, prefix: Union[Path, str]) -> None:
    """ Uninstall application.
    """
    # Convert str to PosixPath type
    prefix = Path(prefix)
    # Find the target directory in the given directory `prefix`
    installed_path = [
        dir for dir in prefix.iterdir()
        if dir.is_dir() and name in dir.name
    ]
    symbolic_link = shutil.which(name)
    if len(installed_path) != 0 and symbolic_link != None:
        os.remove(symbolic_link)
        print(f"{symbolic_link} has been removed")
        shutil.rmtree(installed_path[0])
        print(f"{installed_path[0]} has been removed")
        print(f"{name} has been uninstalled successfully!")

if __name__ == '__main__':
    # Get the url from CLI
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-u", "--url",
        help = "The URL of downloaded file."
    )
    args = parser.parse_args()
    download(args.url)
