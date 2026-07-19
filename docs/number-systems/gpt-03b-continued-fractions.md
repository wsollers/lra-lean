# Companion C — Continued Fractions

## 0. Purpose

This document develops finite and infinite simple continued fractions as a bridge among Euclidean division, rational normal forms, irrational approximation, and quadratic equations.

## 1. Finite Continued Fractions

**Definition 1.1 (Finite simple continued fraction).**
Let \(a_0\in\mathbb Z\) and let \(a_1,\ldots,a_n\in\mathbb N\). Define
\[
[a_0;a_1,\ldots,a_n]
:=a_0+\cfrac{1}{a_1+\cfrac{1}{\ddots+\cfrac{1}{a_n}}}.
\]

**Definition 1.2 (Canonical finite expansion).**
A finite simple continued fraction is canonical if its last partial quotient is greater than \(1\), except in the one-term case.

**Theorem 1.3 (Every rational has a finite expansion).**
Every rational number has a finite simple continued-fraction expansion obtained from the Euclidean algorithm.

**Theorem 1.4 (Canonical uniqueness).**
Every rational number has a unique canonical finite simple continued-fraction expansion.

**Normalization note.** Without the final-partial-quotient convention, the identity
\[
[a_0;\ldots,a_n]=[a_0;\ldots,a_n-1,1]
\]
causes nonuniqueness.

## 2. Convergents

**Definition 2.1 (Convergent recurrences).**
Given partial quotients \((a_n)\), define integers \(p_n,q_n\) by
\[
p_{-2}=0,\quad p_{-1}=1,\quad p_n=a_np_{n-1}+p_{n-2},
\]
\[
q_{-2}=1,\quad q_{-1}=0,\quad q_n=a_nq_{n-1}+q_{n-2}.
\]
The rational number \(p_n/q_n\) is the \(n\)-th convergent.

**Theorem 2.2 (Convergent formula).**
For every \(n\),
\[
[a_0;a_1,\ldots,a_n]=\frac{p_n}{q_n}.
\]

**Theorem 2.3 (Determinant identity).**
For every \(n\ge0\),
\[
p_nq_{n-1}-p_{n-1}q_n=(-1)^{n-1}.
\]

**Corollary 2.4 (Reduced convergents).**
The integers \(p_n\) and \(q_n\) are relatively prime.

## 3. Infinite Continued Fractions

**Definition 3.1 (Infinite simple continued fraction).**
Let \(a_0\in\mathbb Z\) and \(a_n\in\mathbb N\) for \(n\ge1\). The infinite continued fraction \([a_0;a_1,a_2,\ldots]\) is the real limit of its convergents, provided that limit exists.

**Theorem 3.2 (Convergence).**
Every infinite simple continued fraction converges to a real number.

**Theorem 3.3 (Irrationality).**
The value of an infinite simple continued fraction is irrational.

**Theorem 3.4 (Expansion of irrational reals).**
Every irrational real number has a unique infinite simple continued-fraction expansion.

## 4. Approximation Theorems

**Theorem 4.1 (Error bound for convergents).**
If \(x=[a_0;a_1,a_2,\ldots]\), then
\[
\left|x-\frac{p_n}{q_n}\right|<\frac{1}{q_nq_{n+1}}<\frac{1}{q_n^2}.
\]

**Theorem 4.2 (Best approximation property).**
Each convergent is a best rational approximation to \(x\) among rationals with sufficiently small denominator, in the precise denominator range stated by the theorem.

**Normalization note.** State the selected best-approximation formulation explicitly; several inequivalent conventions occur in the literature.

**Theorem 4.3 (Legendre criterion).**
Let \(x\in\mathbb R\) and let \(p/q\) be a reduced rational number with \(q>0\). If
\[
\left|x-\frac pq\right|<\frac{1}{2q^2},
\]
then \(p/q\) is a convergent of the continued fraction of \(x\).

## 5. Quadratic Irrationals

**Definition 5.1 (Eventually periodic continued fraction).**
An infinite continued fraction is eventually periodic if its partial-quotient sequence is periodic after a finite initial segment.

**Theorem 5.2 (Lagrange theorem).**
A real irrational number has an eventually periodic simple continued fraction if and only if it is a quadratic irrational.

## 6. Final Structural Summary

**Theorem 6.1 (Role of continued fractions).**
Continued fractions convert Euclidean division into canonical rational expansions, converge for every irrational real, and produce quantitatively strong rational approximations whose periodicity characterizes quadratic irrationals.
