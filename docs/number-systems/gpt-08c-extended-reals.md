# Part 9 — The Extended Real Line \(\overline{\mathbb R}\)

## 0. Purpose

The extended real line adjoins two order endpoints to \(\mathbb R\). It is a complete linear order, but its arithmetic is only partially defined and it is not a field.

## 1. Construction and Order

**Definition 1.1 (Extended real line).**
Let \(-\infty\) and \(+\infty\) be two distinct objects not belonging to \(\mathbb R\). Define
\[
\overline{\mathbb R}:=\mathbb R\cup\{-\infty,+\infty\}.
\]

**Definition 1.2 (Extended order).**
Retain the usual order on \(\mathbb R\), and define
\[
-\infty<x<+\infty
\]
for every \(x\in\mathbb R\), together with \(-\infty<+\infty\).

**Theorem 1.3 (Complete linear order).**
The extended order is a strict total order on \(\overline{\mathbb R}\).

## 2. Suprema and Infima

**Definition 2.1 (Extended supremum).**
For \(A\subseteq\overline{\mathbb R}\), define:

- \(\sup\varnothing:=-\infty\);
- \(\sup A:=+\infty\) if \(+\infty\in A\) or \(A\cap\mathbb R\) is unbounded above;
- otherwise, \(\sup A\) is the real supremum of \(A\cap\mathbb R\).

**Definition 2.2 (Extended infimum).**
For \(A\subseteq\overline{\mathbb R}\), define:

- \(\inf\varnothing:=+\infty\);
- \(\inf A:=-\infty\) if \(-\infty\in A\) or \(A\cap\mathbb R\) is unbounded below;
- otherwise, \(\inf A\) is the real infimum of \(A\cap\mathbb R\).

**Theorem 2.3 (Universal existence of extended bounds).**
Every subset of \(\overline{\mathbb R}\) has a supremum and an infimum in \(\overline{\mathbb R}\).

## 3. Partial Operations

**Definition 3.1 (Partial binary operation).**
A partial binary operation on \(X\) is a function \(D\to X\) for some \(D\subseteq X\times X\).

**Definition 3.2 (Extended negation).**
Define
\[
-(+\infty):=-\infty,
\qquad
-(-\infty):=+\infty,
\]
and retain ordinary negation on \(\mathbb R\).

**Definition 3.3 (Extended addition).**
Define addition on all pairs except \((+\infty,-\infty)\) and \((-\infty,+\infty)\). For \(x\in\mathbb R\), define
\[
x+(+\infty)=+\infty=(+\infty)+x,
\]
\[
x+(-\infty)=-\infty=(-\infty)+x,
\]
\[
(+\infty)+(+\infty)=+\infty,
\]
and
\[
(-\infty)+(-\infty)=-\infty.
\]

**Definition 3.4 (Extended subtraction).**
Define \(x-y:=x+(-y)\) whenever the right-hand side is defined.

**Definition 3.5 (Extended multiplication).**
For \(x\in\mathbb R\setminus\{0\}\), define multiplication by \(\pm\infty\) according to the usual sign rules. Define
\[
(+\infty)(+\infty)=+\infty,
\]
\[
(+\infty)(-\infty)=-\infty,
\]
and
\[
(-\infty)(-\infty)=+\infty.
\]
Leave \(0(\pm\infty)\) and \((\pm\infty)0\) undefined.

**Definition 3.6 (Extended reciprocal).**
Define
\[
(+\infty)^{-1}=0,
\qquad
(-\infty)^{-1}=0,
\]
and retain ordinary reciprocals for nonzero reals. Leave \(0^{-1}\) undefined.

**Definition 3.7 (Extended division).**
Define \(x/y:=xy^{-1}\) whenever the reciprocal and product are defined.

**Normalization notes.** The measure-theoretic convention \(0\cdot(\pm\infty)=0\) must be introduced separately when needed.

## 4. Order Monotonicity and Failures

**Theorem 4.1 (Monotonicity of defined addition).**
If \(x\le y\) and both \(x+z\) and \(y+z\) are defined, then
\[
x+z\le y+z.
\]

**Remark 4.2 (Failure of strict translation invariance).**
For real \(x<y\),
\[
x+(+\infty)=+\infty=y+(+\infty).
\]

**Theorem 4.3 (Monotonicity under positive multiplication).**
If \(x\le y\), \(0<z\), and both products are defined, then
\[
xz\le yz.
\]

**Theorem 4.4 (Failure of field structure).**
The extended real line is not a group under addition, not a ring, and not a field.

## 5. Order Topology at Infinity

**Definition 5.1 (Neighborhood of \(+\infty\)).**
A set \(U\subseteq\overline{\mathbb R}\) is a neighborhood of \(+\infty\) if there exists \(M\in\mathbb R\) such that
\[
(M,+\infty]\subseteq U.
\]

**Definition 5.2 (Neighborhood of \(-\infty\)).**
A set \(U\subseteq\overline{\mathbb R}\) is a neighborhood of \(-\infty\) if there exists \(M\in\mathbb R\) such that
\[
[-\infty,M)\subseteq U.
\]

## 6. Final Structural Summary

**Theorem 6.1 (Structure of the extended real line).**
The extended real line is a complete linear order with top element \(+\infty\) and bottom element \(-\infty\). Its arithmetic is partial and does not make it an ordered field.
