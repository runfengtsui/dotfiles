#!/usr/bin/env python
import os
import argparse
import tempfile, zipfile
from installer import download, LOCAL
from pathlib import Path
import subprocess

parser = argparse.ArgumentParser()
parser.add_argument(
    "-v", "--version",
    help = "Version of Nerd Fonts to be downloaded."
)
args = parser.parse_args()

url = (
    "https://github.com/ryanoasis/nerd-fonts/"
    f"releases/download/v{args.version}/FiraCode.zip"
)
filename = os.path.basename(url)

fonts_dir = LOCAL / "share" / "fonts" / "FiraCode"
fonts_dir.mkdir(parents=True, exist_ok=True)

with tempfile.TemporaryDirectory() as temp_dir:
    try:
        download(url, temp_dir)

        print("Extracting to ~/.local/share/fonts ...")
        # Extract the zip file
        with zipfile.ZipFile(Path(temp_dir) / filename, "r") as zip_file:
            zip_file.extractall(fonts_dir)

        # Update fonts cache
        print("Updating Fonts Cache ...")
        subprocess.run(["fc-cache", "-fv"], check=True)

        print("Fonts installation completed successfully!")

    except Exception as e:
        print(f"An error occurred: {e}")
