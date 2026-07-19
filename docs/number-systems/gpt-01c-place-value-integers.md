# Part 3 — Place-Value Representation

## 0. Purpose

This document develops finite base-\(b\) representations of whole numbers. The theorem depends on Euclidean division, so its final proof must be placed after the division algorithm has been proved or must cite that theorem explicitly.

## 1. Bases, Digits, and Numerals

**Definition 1.1 (Valid base).**
A valid base is a natural number \(b\in\mathbb N\) satisfying \(2\le b\).

**Definition 1.2 (Base-\(b\) digit).**
Let \(b\) be a valid base. A base-\(b\) digit is a whole number \(d\in\mathbb W\) satisfying
\[
0\le d<b.
\]

**Definition 1.3 (Finite base-\(b\) digit sequence).**
A finite base-\(b\) digit sequence is a tuple
\[
(d_k,d_{k-1},\ldots,d_1,d_0)
\]
where \(k\in\mathbb W\) and each \(d_j\) is a base-\(b\) digit.

**Definition 1.4 (Value of a digit sequence).**
The value of a finite base-\(b\) digit sequence \((d_k,\ldots,d_0)\) is
\[
\operatorname{val}_b(d_k,\ldots,d_0):=\sum_{j=0}^{k}d_jb^j.
\]

**Dependencies.** Finite sums and whole-number exponentiation.

**Definition 1.5 (Canonical base-\(b\) numeral).**
A finite base-\(b\) digit sequence is canonical if either it is the one-digit sequence \((0)\), or its leading digit \(d_k\) is nonzero.

## 2. Representation Theorems

**Theorem 2.1 (Existence of base-\(b\) representation).**
Let \(b\ge2\) be a valid base. For every \(n\in\mathbb W\), there exists a canonical finite base-\(b\) digit sequence \((d_k,\ldots,d_0)\) such that
\[
n=\sum_{j=0}^{k}d_jb^j.
\]

**Dependencies.** Euclidean division by \(b\), induction or strong induction on \(n\).

**Proof obligations.** Repeatedly divide by \(b\), recording remainders. Prove termination using strict decrease of successive quotients.

**Theorem 2.2 (Uniqueness of canonical base-\(b\) representation).**
Let \(b\ge2\). If
\[
n=\sum_{j=0}^{k}d_jb^j=\sum_{j=0}^{\ell}e_jb^j
\]
are two canonical base-\(b\) representations of the same whole number, then \(k=\ell\) and \(d_j=e_j\) for every \(0\le j\le k\).

**Dependencies.** Uniqueness in Euclidean division.

**Proof obligations.** Compare both sides modulo \(b\) to obtain \(d_0=e_0\), subtract, divide by \(b\), and iterate.

**Corollary 2.3 (Base-\(b\) representation theorem).**
For every valid base \(b\) and every whole number \(n\), there exists a unique canonical finite base-\(b\) numeral representing \(n\).

## 3. Positional Consequences

**Theorem 3.1 (Place-value bounds).**
Let \((d_k,\ldots,d_0)\) be a canonical base-\(b\) numeral with \(d_k\ne0\). Then
\[
b^k\le \operatorname{val}_b(d_k,\ldots,d_0)<b^{k+1}.
\]

**Corollary 3.2 (Number of digits).**
A positive whole number \(n\) has exactly \(k+1\) base-\(b\) digits if and only if
\[
b^k\le n<b^{k+1}.
\]

**Definition 3.3 (Decimal, binary, and hexadecimal numerals).**
Decimal, binary, and hexadecimal numerals are canonical numerals in bases \(10\), \(2\), and \(16\), respectively.

## 4. Normalization Requirements

- Distinguish a digit sequence from its numerical value.
- State uniqueness only for canonical representations; leading zeros otherwise destroy uniqueness.
- Treat zero separately as the one-digit numeral \((0)\).
- Do not use ellipses as a substitute for the finite-sum formula in the formal theorem statement.
