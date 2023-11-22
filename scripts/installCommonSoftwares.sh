#!/usr/bin/env bash

# install some office softwares
sudo apt install cn.loongnix.lbrowser
# remove LibreOffice and install WPS 2019 for Linux
sudo apt remove libreoffice-common
# apt remove libreoffice-core 
sudo apt install cn.wps.wps-office
# install Baidu Netdisk
sudo apt install com.baidu.baidunetdisk
# install Tencent Wemeet
sudo apt install com.qq.wemeet

# install Visual Studio Code
sudo apt install com.visualstudio.code

# install QQ for Linux
sudo apt install linux.qq.com
# apt install com.qq.music

# remove installed games
sudo apt remove com.deepin.gomoku com.deepin.lianliankan
# install Mines and 
# apt install org.gnome.gnome-mines com.game.kpat

# clean unuseful packages
sudo apt autoremove

