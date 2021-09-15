#!/bin/bash

mkdir /home/penelope/tools
cd /home/penelope/tools || { echo "Failure in cd command"; exit 1; }

## yarGen
git clone https://github.com/Neo23x0/yarGen
cd yarGen || { echo "Failure in cd command"; exit 1; }
pip install -r requirements.txt
python yarGen.py --update
cd /home/penelope/tools || { echo "Failure in cd command"; exit 1; }

## r2dec
r2pm init
r2pm install r2dec

## karton
pip3 install karton-core

## volatility2.6
mkdir volatility2
cd volatility2 || { echo "Failure in cd command"; exit 1; }
wget http://downloads.volatilityfoundation.org/releases/2.6/volatility_2.6_lin64_standalone.zip
unzip volatility_2.6_lin64_standalone.zip
cp volatility_2.6_lin64_standalone/volatility_2.6_lin64_standalone /home/penelope/PATH/vol2
cd /home/penelope/tools || { echo "Failure in cd command"; exit 1; }

# exiftool
cd /home/penelope/PATH || { echo "Failure in cd command"; exit 1; }
wget  https://exiftool.org/Image-ExifTool-12.30.tar.gz
tar -xvf Image-ExifTool-12.30.tar.gz
chmod +x exiftool
ln -s Image-ExifTool-12.30/exiftool /home/penelope/PATH
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }

## GRANTING 755 PERMISSIONS ON ALL FILES IN PATH
chmod -R 755 /home/penelope/PATH
