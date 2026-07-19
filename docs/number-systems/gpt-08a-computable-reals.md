# Companion D — Computable Real Numbers

## 0. Purpose

This document isolates the effectively describable part of \(\mathbb R\). Computable reals form a countable ordered subfield of \(\mathbb R\), not a replacement for the full real field.

## 1. Effective Rational Approximation

**Definition 1.1 (Fast Cauchy name).**
A fast Cauchy name is a sequence \((q_n)_{n\in\mathbb N}\) of rational numbers satisfying
\[
|q_m-q_n|\le2^{-n}
\]
whenever \(m\ge n\).

**Definition 1.2 (Computable rational sequence).**
A rational sequence \((q_n)\) is computable if an algorithm, given \(n\), returns the numerator and positive denominator of \(q_n\).

**Definition 1.3 (Computable real).**
A real number \(x\) is computable if there exists a computable rational sequence \((q_n)\) such that
\[
|x-q_n|\le2^{-n}
\]
for every \(n\).

**Theorem 1.4 (Equivalent moduli).**
Replacing \(2^{-n}\) by any computable positive error sequence converging effectively to zero yields the same class of computable reals, provided an effective modulus of convergence is supplied.

## 2. Representation Independence

**Definition 2.1 (Equivalence of computable names).**
Two computable fast Cauchy names \((q_n)\) and \((r_n)\) name the same computable real if
\[
|q_n-r_n|\le2^{1-n}
\]
for every sufficiently large \(n\).

**Theorem 2.2 (Equivalence relation).**
Equality of computable names is an equivalence relation.

**Theorem 2.3 (Embedding into the ordinary reals).**
Every computable name determines a unique ordinary real number, and equivalent names determine the same real number.

## 3. Computable Arithmetic

**Theorem 3.1 (Field closure).**
The computable real numbers are closed under addition, subtraction, and multiplication.

**Theorem 3.2 (Effective reciprocal).**
If \(x\) is a nonzero computable real and effective information separating \(x\) from zero is available, then \(x^{-1}\) is computable.

**Normalization note.** A bare name for a nonzero real need not reveal a computable lower bound for its absolute value uniformly. Distinguish pointwise computability from uniform computability on a represented domain.

**Corollary 3.3 (Computable reals form a field).**
The set \(\mathbb R_{\mathrm{comp}}\) of computable real numbers is a subfield of \(\mathbb R\).

## 4. Order and Semidecidability

**Theorem 4.1 (Strict order is semidecidable).**
Given computable names for \(x\) and \(y\), the relation \(x<y\) is semidecidable: if \(x<y\), an algorithm eventually verifies a rational separation.

**Theorem 4.2 (Equality is not generally decidable).**
There is no algorithm that, for every pair of computable real names, decides whether they name the same real number.

**Corollary 4.3 (Non-strict order is not uniformly decidable).**
The usual order on computable reals is not a decidable total order when inputs are supplied only by arbitrary computable names.

## 5. Computable Functions

**Definition 5.1 (Computable real function).**
Let \(D\subseteq\mathbb R^k\). A function \(f:D\to\mathbb R\) is computable if an algorithm transforms every valid name of an input in \(D\) into a valid name of its output, uniformly in the input name.

**Theorem 5.2 (Computable functions are continuous).**
Every computable real function on its represented domain is continuous.

**Theorem 5.3 (Effective uniform continuity on compact domains).**
A computable function on a computably compact interval admits an effective modulus of uniform continuity under the standard hypotheses of computable analysis.

## 6. Cardinality and Noncomputability

**Theorem 6.1 (Countability).**
The set of computable real numbers is countable.

**Theorem 6.2 (Existence of noncomputable reals).**
There exist uncountably many noncomputable real numbers.

**Corollary 6.3 (Almost every real is noncomputable in the cardinal sense).**
The computable reals form a countable proper subset of \(\mathbb R\).

## 7. Interval and GPU Connections

**Definition 7.1 (Certified approximation procedure).**
A certified approximation procedure for a real number returns, for each requested precision \(n\), a rational interval of width at most \(2^{-n}\) guaranteed to contain the number.

**Theorem 7.2 (Equivalence with fast computable names).**
Computable certified interval procedures and computable fast Cauchy names determine the same class of real numbers.

**Interpretation.** Certified interval names align naturally with verified numerical pipelines because every approximation carries an explicit enclosure guarantee.

## 8. Final Structural Summary

**Theorem 8.1 (Status of computable reals).**
The computable reals form a countable ordered subfield of \(\mathbb R\) closed under the standard effectively realizable operations, while equality and total order are not uniformly decidable from arbitrary names.
