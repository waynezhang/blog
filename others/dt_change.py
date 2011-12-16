#!/usr/bin/python

from dateutil import parser
from dateutil import tz
from datetime import tzinfo
from datetime import datetime
import sys

string = sys.stdin.readlines()
print parser.parse(string[0]).astimezone(tz.tzlocal()).strftime("%Y-%m-%d %H:%M:%S")
