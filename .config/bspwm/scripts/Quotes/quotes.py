import json
import time
import os
import random
from datetime import date

CURRDIR = os.path.dirname(os.path.realpath(__file__))

def loadQuotes():
    with open (f'{CURRDIR}/quotes.json') as f:
        # Reading from file
        data = json.load(f)
        return data

quotes = loadQuotes().get("quotes")

curr_date = date.today()


random.seed(time.time_ns()) # change to 1 in order to get a random quote each day
# position in shuffled array
position = curr_date.day + curr_date.month * 31 + curr_date.year * 365
# shuffle the quotes
random.shuffle(quotes)

randomQuote = quotes[position % len(quotes)]


# parse quote (add enters)
arr = randomQuote.get("text").split(" ");
out_str = "";
char_count = 0;
for i in range(len(arr)):
    sub_str = arr[i] + " "
    char_count += len(sub_str)
    if char_count > 40:
        out_str += "\n" + sub_str
        char_count = len(sub_str)
    else:
        out_str += sub_str
        

# ANSI color codes
bold = "\033[1m"
color_reset = "\033[0m"
color_pinkish = "\033[38;5;210m"
color_cyan = "\033[38;5;51m"

# Print quote with colors
print(f"{bold}{color_pinkish}{out_str}{color_reset}")
print(f"{color_cyan}~ {randomQuote.get('author')}{color_reset}")
