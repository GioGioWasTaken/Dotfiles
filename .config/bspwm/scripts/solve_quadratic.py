import math
import sys
from fractions import Fraction

def fmt_root(r):
    # exact fraction if it's close to rational
    frac = Fraction(r).limit_denominator()
    if abs(frac - r) < 1e-10:
        val = frac if frac.denominator != 1 else frac.numerator
    else:
        # fallback to trimmed decimal
        val = f"{r:.6g}"
    sign = '-' if val >= 0 else '+'
    return f"(x {sign} {abs(val)})"

def main():
    if len(sys.argv) != 4:
        print("Usage: a b c")
        return

    a, b, c = map(float, sys.argv[1:])
    if a == 0:
        print("Not quadratic")
        return

    d = b**2 - 4*a*c
    if d < 0:
        print("Imaginary roots")
        return

    if d == 0:
        x = -b/(2*a)
        print(f"1 real root: {x}")
        print(f"{fmt_root(x)}^2")
    else:
        sqrt_d = math.sqrt(d)
        x1 = (-b + sqrt_d)/(2*a)
        x2 = (-b - sqrt_d)/(2*a)
        print(f"2 real roots: {x1}, {x2}")
        print(f"{fmt_root(x1)} {fmt_root(x2)}")

if __name__ == "__main__":
    main()
