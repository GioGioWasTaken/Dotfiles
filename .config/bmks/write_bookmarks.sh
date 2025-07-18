#!/bin/bash

python parse_firefox_bookmarks.py >urls


# "#cyber" is interpreted as a comment. switch it for //cyber//
sed -i 's/#cyber/\/\/cyber\/\//g' urls
