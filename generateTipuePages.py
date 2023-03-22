#!/usr/bin/env python3

import argparse
import os


parser = argparse.ArgumentParser()
parser.add_argument("path", help="Where the site is")
args = parser.parse_args()

tipuesearch_pages = "var tipuesearch_pages = "

paths = []
for root, dirs, files in os.walk(args.path):
    for f in files:
        if f == "index.html":
            paths.append(os.path.join("/", os.path.relpath(root, "public")))

tipuesearch_pages += str(paths).replace("'", "\"") + ";"

output = ""
outputfile = "static/tipuesearch/tipuesearch_set.js"
for l in open(outputfile):
    if l.find("tipuesearch_pages") >= 0:
        output += tipuesearch_pages
    else:
        output += l

f = open(outputfile, "w")
f.write(output)
