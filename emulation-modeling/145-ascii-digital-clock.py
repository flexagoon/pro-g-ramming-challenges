#!/usr/bin/env python

# This script depends on pyfiglet and setuptools
# Please install it with `pip install pyfiglet setuptools`
import os, time
from pyfiglet import Figlet
from datetime import datetime

figlet = Figlet(font="roman")

while True:
    ctime = datetime.now().strftime("%H : %M")
    os.system("clear")
    print(figlet.renderText(ctime))
    time.sleep(10)
