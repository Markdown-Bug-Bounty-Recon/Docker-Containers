#!/bin/bash

mkdir /home/penelope/tools
cd /home/penelope/tools || { echo "Failure in cd command"; exit 1; }

## yarGen
git clone https://github.com/Neo23x0/yarGen
cd yarGen || { echo "Failure in cd command"; exit 1; }
pip install -r requirements.txt
python yarGen.py --update
## GRANTING 755 PERMISSIONS ON ALL FILES IN PATH
chmod -R 755 /home/penelope/PATH
