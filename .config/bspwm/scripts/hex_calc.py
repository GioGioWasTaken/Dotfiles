#!/usr/bin/env python3

import subprocess
import re
import os

HISTORY_FILE = os.path.expanduser("/tmp/hex_calc_history")

def rofi_with_history(prompt):
    try:
        with open(HISTORY_FILE, 'r') as f:
            hist = f.read()
    except FileNotFoundError:
        hist = ""

    result = subprocess.run(
        ["rofi", "-dmenu", "-p", prompt],
        text=True,
        input=hist,
        capture_output=True
    ).stdout.strip()

    # Save new input to top of history
    if result:
        lines = [result] + [l for l in hist.splitlines() if l != result]
        with open(HISTORY_FILE, 'w') as f:
            f.write('\n'.join(lines[:50]))  # Keep only last 50 entries

    return result


def rofi(prompt):
    return subprocess.run(
        ["rofi", "-dmenu", "-p", prompt],
        text=True,
        input="",
        capture_output=True
    ).stdout.strip()

def parse_token(token):
    token = token.strip().lower()
    if re.fullmatch(r'0x[0-9a-f]+', token):
        return int(token, 16)
    elif re.fullmatch(r'\d+', token):
        return int(token)
    else:
        raise ValueError(f"Invalid token: {token}")

def main():
    expr = rofi_with_history("Enter number or expression")
    tokens = expr.replace('*', ' * ').replace('+', ' + ').replace('-', ' - ').split()

    if len(tokens) == 1:
        try:
            val = parse_token(tokens[0])
            subprocess.run(["rofi", "-e", f"{hex(val)}"])
        except:
            subprocess.run(["rofi", "-e", "Invalid input"])
        return

    if len(tokens) == 3:
        try:
            a = parse_token(tokens[0])
            op = tokens[1]
            b = parse_token(tokens[2])

            if op == '+':
                result = a + b
            elif op == '-':
                result = a - b
            elif op == '*':
                result = a * b
            else:
                raise ValueError("Invalid operator")

            subprocess.run(["rofi", "-e", f"{hex(result)}"])
        except:
            subprocess.run(["rofi", "-e", "Invalid expression"])
        return

    subprocess.run(["rofi", "-e", "Invalid format"])

if __name__ == "__main__":
    main()
