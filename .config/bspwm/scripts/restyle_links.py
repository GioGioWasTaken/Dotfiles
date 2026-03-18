# Takes links of form 
# [text](/Brain/my_brain/General-Subjects/replication_crisis.md) 
# which are almost absolute paths, and replaces "/Brain" with
# the dynamic result of $PROGRAMMING_DIR/Brain/
"""

nvim-obsidian plugin go to file functionality works with:
- abs paths (/home/user/etc/etc)
- relative paths
- obsidian style paths, e.g. [[filename]]

neovim filename autocompletion works with:
- obsidian style paths 
- (from marksman) paths relative to Brain

vitepress static site generator works with:
- absolute paths
- paths relative to Brain/my_brain(simply replace my_brain with /)

This script turns the marksman paths, to absolute paths.

Another solution would be to use a site generator that supports wikilinks [[]]

other solutions are too cumbersome or require too many changes.


"""

#!/usr/bin/env python3
import os
import re
from pathlib import Path

programming_dir = os.environ.get("PROGRAMMING_DIR")
if not programming_dir:
        raise RuntimeError("PROGRAMMING_DIR environment variable not set")

replacement_prefix = f"{programming_dir}/Brain"

pattern = re.compile(r'\]\(/Brain')

for path in Path(".").rglob("*.md"):
        text = path.read_text()

        new_text = pattern.sub(f']({replacement_prefix}', text)

        if new_text != text:
                path.write_text(new_text)
                print(f"updated: {path}")
