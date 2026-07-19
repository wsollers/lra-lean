# Later Sequel — \(p\)-Adic Number Systems

## 0. Placement and Purpose

This document is a roadmap for a later sequel. It should follow the development of absolute values, metrics, Cauchy completion, modular arithmetic, prime factorization, and quotient rings.

Its central lesson is that completing \(\mathbb Q\) depends on the chosen absolute value:
\[
(\mathbb Q,|\cdot|)\longrightarrow\mathbb R,
\qquad
(\mathbb Q,|\cdot|_p)\longrightarrow\mathbb Q_p.
\]

## 1. \(p\)-Adic Valuation and Absolute Value

**Definition 1.1 (Prime-adic valuation on integers).**
Fix a prime \(p\). For nonzero \(n\in\mathbb Z\), define \(v_p(n)\) to be the unique whole number \(k\) such that
\[
p^k\mid n
\quad\text{and}\quad
p^{k+1}\nmid n.
\]
Set \(v_p(0)=+\infty\).

**Definition 1.2 (Valuation on rationals).**
For nonzero \(a/b\in\mathbb Q\), define
\[
v_p(a/b)=v_p(a)-v_p(b).
\]

**Theorem 1.3 (Well-definedness).**
The rational \(p\)-adic valuation is independent of the chosen fraction representation.

**Definition 1.4 (\(p\)-adic absolute value).**
Define
\[
|x|_p=p^{-v_p(x)}
\]
for \(x\ne0\), and set \(|0|_p=0\).

**Theorem 1.5 (Ultrametric inequality).**
For all \(x,y\in\mathbb Q\),
\[
|x+y|_p\le\max\{|x|_p,|y|_p\}.
\]

## 2. The Field \(\mathbb Q_p\)

**Definition 2.1 (\(p\)-adic Cauchy sequence).**
A rational sequence is \(p\)-adic Cauchy if it is Cauchy under the metric
\[
d_p(x,y)=|x-y|_p.
\]

**Definition 2.2 (\(p\)-adic numbers).**
Define \(\mathbb Q_p\) as the quotient of \(p\)-adic Cauchy sequences by the relation of having difference converging to zero in \(|\cdot|_p\).

**Theorem 2.3 (Complete valued field).**
The quotient \(\mathbb Q_p\) is a complete field containing a dense canonical copy of \(\mathbb Q\).

## 3. The Ring \(\mathbb Z_p\)

**Definition 3.1 (\(p\)-adic integers).**
Define
\[
\mathbb Z_p:=\{x\in\mathbb Q_p:|x|_p\le1\}.
\]

**Theorem 3.2 (Compact open subring).**
The set \(\mathbb Z_p\) is a compact open subring of \(\mathbb Q_p\).

**Definition 3.3 (Inverse-limit presentation).**
Define the inverse system
\[
\cdots\to\mathbb Z/p^3\mathbb Z\to\mathbb Z/p^2\mathbb Z\to\mathbb Z/p\mathbb Z.
\]

**Theorem 3.4 (Inverse-limit construction).**
There is a canonical ring isomorphism
\[
\mathbb Z_p\cong\varprojlim_n\mathbb Z/p^n\mathbb Z.
\]

## 4. Expansions and Arithmetic

**Theorem 4.1 (Canonical \(p\)-adic expansion).**
Every \(x\in\mathbb Z_p\) has a unique expansion
\[
x=\sum_{n=0}^{\infty}a_np^n,
\qquad
0\le a_n<p.
\]

**Interpretation.** Unlike ordinary real positional expansions, higher powers of \(p\) become smaller in the \(p\)-adic metric.

## 5. Hensel Lifting

**Theorem 5.1 (Hensel lemma, basic form).**
State and prove a selected form of Hensel's lemma giving conditions under which a solution of a polynomial congruence modulo \(p\) lifts uniquely to a root in \(\mathbb Z_p\).

## 6. Comparison with the Real Completion

**Theorem 6.1 (Topological contrast).**
The real field is connected and Archimedean, whereas every \(p\)-adic field is totally disconnected, non-Archimedean, and ultrametric.

**Theorem 6.2 (Ostrowski classification, later capstone).**
Every nontrivial absolute value on \(\mathbb Q\) is equivalent either to the usual absolute value or to a \(p\)-adic absolute value for a unique prime \(p\).

## 7. Suggested Prerequisite Order

1. modular arithmetic and quotient rings;
2. prime factorization and valuations;
3. absolute values and metrics;
4. Cauchy completion;
5. compactness and inverse limits;
6. Hensel lifting;
7. Ostrowski's theorem.
