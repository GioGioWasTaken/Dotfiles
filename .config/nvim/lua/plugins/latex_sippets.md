### Environments & Document Structure

| Trigger | Output | Notes |
|---|---|---|
| `beg` | `\begin{} ... \end{}` | Auto-mirrors env name in `\end` |
| `enum` | `\begin{enumerate} \item` | |
| `item` | `\begin{itemize} \item` | |
| `desc` | `\begin{description}` | |
| `ali` | `\begin{align*}` | |
| `table` | Full table environment | |
| `fig` | Full figure environment | |

---

### Math Mode

| Trigger | Output |
|---|---|
| `mk` | `$...$` (inline math, smart spacing) |
| `dm` | `\[ ... \]` (display math) |

---

### Fractions

| Trigger | Output |
|---|---|
| `//` | `\frac{}{}` |
| `3/` | `\frac{3}{}` |
| `4\pi^2/` | `\frac{4\pi^2}{}` |
| `(1 + 2)/` | `\frac{1 + 2}{}` |

---

### Super/Subscripts

| Trigger | Output |
|---|---|
| `a1` | `a_1` (auto subscript) |
| `a12` | `a_{12}` |
| `sr` | `^2` |
| `cb` | `^3` |
| `td` | `^{...}` (general superscript) |
| `__` | `_{...}` (manual subscript) |

---

### Common Math Symbols

| Trigger | Output |
|---|---|
| `ooo` | `\infty` |
| `sum` | `\sum_{n=1}^{\infty}` |
| `lim` | `\lim_{n \to \infty}` |
| `prod` | `\prod_{...}^{...}` |
| `part` | `\frac{\partial V}{\partial x}` |
| `dint` | `\int_{-\infty}^{\infty}` |
| `->` | `\to` |
| `!>` | `\mapsto` |
| `<->` | `\leftrightarrow` |
| `=>` | `\implies` |
| `=<` | `\impliedby` |
| `iff` | `\iff` |
| `xx` | `\times` |
| `**` | `\cdot` |
| `~~` | `\sim` |
| `!=` | `\neq` |
| `<=` | `\le` |
| `>=` | `\ge` |

---

### Sets & Logic

| Trigger | Output |
|---|---|
| `EE` | `\exists` |
| `AA` | `\forall` |
| `inn` | `\in` |
| `notin` | `\not\in` |
| `cc` | `\subset` |
| `Nn` | `\cap` |
| `UU` | `\cup` |
| `OO` | `\emptyset` |
| `RR` | `\R` |
| `ZZ` | `\Z` |
| `QQ` | `\Q` |
| `set` | `\{...\}` |

---

### Decorators (postfix)

| Trigger | Output |
|---|---|
| `xbar` or `bar` | `\overline{x}` |
| `xhat` or `hat` | `\hat{x}` |
| `sq` | `\sqrt{}` |
| `norm` | `\|...\|` |
| `conj` | `\overline{}` |

---

### Brackets

| Trigger | Output |
|---|---|
| `lr(` | `\left( ... \right)` |
| `lr[` | `\left[ ... \right]` |
| `lr{` | `\left\{ ... \right\}` |
| `lr\|` | `\left\| ... \right\|` |
| `lra` | `\left< ... \right>` |
| `ceil` | `\left\lceil ... \right\rceil` |
| `floor` | `\left\lfloor ... \right\rfloor` |

---

### Matrices

| Trigger | Output |
|---|---|
| `pmat` | `\begin{pmatrix}` |
| `bmat` | `\begin{bmatrix}` |

---

### Text in Math

| Trigger | Output |
|---|---|
| `tt` | `\text{}` |
| `mcal` | `\mathcal{}` |
| `case` | `\begin{cases}` |

