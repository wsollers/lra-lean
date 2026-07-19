# Companion E — Characteristic and Cardinality

## 0. Purpose

This document records two invariants that distinguish and compare the number systems: algebraic characteristic and set-theoretic cardinality.

## 1. Characteristic

**Definition 1.1 (Characteristic of a unital ring).**
Let \(R\) be a ring with unity \(1_R\). The characteristic of \(R\) is the least positive integer \(n\), if one exists, such that
\[
n1_R=0_R.
\]
If no such positive integer exists, the characteristic is \(0\).

**Theorem 1.2 (Characteristic-zero criterion).**
A unital ring has characteristic zero if and only if the canonical homomorphism
\[
\mathbb Z\to R,
\qquad
n\mapsto n1_R,
\]
is injective.

**Theorem 1.3 (Characteristic of the classical infinite systems).**
The rings and fields \(\mathbb Z\), \(\mathbb Q\), \(\mathbb R\), and \(\mathbb C\) have characteristic zero.

**Theorem 1.4 (Prime characteristic of a field).**
The characteristic of a field is either zero or a prime number.

## 2. Finite and Countable Systems

**Definition 2.1 (Countable set).**
A set is countable if it is finite or admits an injection into \(\mathbb N\).

**Theorem 2.2 (Countability of the discrete and rational systems).**
The sets \(\mathbb N\), \(\mathbb W\), \(\mathbb Z\), and \(\mathbb Q\) are countably infinite.

**Proof obligations.** Provide explicit enumerations or canonical injections and prove infinitude separately.

**Theorem 2.3 (Countability of algebraic numbers).**
The set of complex numbers algebraic over \(\mathbb Q\) is countable.

## 3. Uncountability of the Reals

**Theorem 3.1 (Cantor diagonal theorem for binary sequences).**
The set \(\{0,1\}^{\mathbb N}\) of infinite binary sequences is uncountable.

**Theorem 3.2 (Uncountability of \(\mathbb R\)).**
The real numbers are uncountable.

**Recommended proof variants.** Register both a Cantor diagonal proof and a nested-interval proof.

**Theorem 3.3 (Cardinality of an interval).**
Every nondegenerate real interval has the same cardinality as \(\mathbb R\).

## 4. Cardinality of the Complex Numbers

**Theorem 4.1 (Plane-line cardinality equivalence).**
There exists a bijection
\[
\mathbb R^2\to\mathbb R.
\]

**Corollary 4.2 (Cardinality of \(\mathbb C\)).**
Since \(\mathbb C=\mathbb R^2\) as a set,
\[
|\mathbb C|=|\mathbb R|.
\]

## 5. Algebraic and Transcendental Numbers

**Definition 5.1 (Algebraic number).**
A complex number is algebraic over \(\mathbb Q\) if it is a root of a nonzero polynomial in \(\mathbb Q[x]\).

**Definition 5.2 (Transcendental number).**
A complex number is transcendental over \(\mathbb Q\) if it is not algebraic over \(\mathbb Q\).

**Theorem 5.3 (Existence of transcendental reals).**
The set of transcendental real numbers is uncountable.

**Proof obligation.** Combine countability of algebraic numbers with uncountability of \(\mathbb R\).

## 6. Computable Cardinality Contrast

**Theorem 6.1 (Computable reals are countable).**
The set of computable real numbers is countable.

**Corollary 6.2 (Noncomputable reals are uncountable).**
The complement \(\mathbb R\setminus\mathbb R_{\mathrm{comp}}\) is uncountable.

## 7. Final Structural Summary

**Theorem 7.1 (Characteristic and cardinality ledger).**
The classical rings and fields in the canonical chain have characteristic zero; the systems through \(\mathbb Q\) are countable, while \(\mathbb R\) and \(\mathbb C\) have the cardinality of the continuum.
