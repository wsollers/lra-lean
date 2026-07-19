# Companion B — Universal Properties of \(\mathbb Z\), \(\mathbb Q\), and \(\mathbb R\)

## 0. Purpose

This document characterizes the principal number-system extensions by the maps they uniquely support, not merely by their concrete representatives.

## 1. Universal Property of the Integers

**Definition 1.1 (Grothendieck group completion).**
Let \((M,+,0)\) be a commutative monoid. A group completion of \(M\) is an abelian group \(G\) together with a monoid homomorphism \(\eta:M\to G\) such that every monoid homomorphism from \(M\) into an abelian group factors uniquely through \(\eta\).

**Theorem 1.2 (Universal property of \(\mathbb Z\)).**
Let \(G\) be an abelian group and let \(f:\mathbb W\to G\) be a monoid homomorphism. There exists a unique group homomorphism
\[
\widetilde f:\mathbb Z\to G
\]
such that
\[
\widetilde f\circ\iota_{\mathbb W\mathbb Z}=f.
\]

**Definition 1.3 (Explicit extension).**
For an integer represented by \((a,b)\), define
\[
\widetilde f([(a,b)])=f(a)-f(b).
\]

**Proof obligations.** Prove independence of representatives, homomorphism preservation, factorization, and uniqueness.

**Corollary 1.4 (Uniqueness of group completion).**
Any two group completions of \(\mathbb W\) are uniquely isomorphic by an isomorphism commuting with their canonical maps from \(\mathbb W\).

## 2. Universal Property of the Rational Numbers

**Definition 2.1 (Fraction field).**
Let \(D\) be an integral domain. A fraction field of \(D\) is a field \(K\) with an injective ring homomorphism \(\eta:D\to K\) such that every injective ring homomorphism from \(D\) into a field factors uniquely through \(\eta\).

**Theorem 2.2 (Universal property of \(\mathbb Q\)).**
Let \(F\) be a field and let \(f:\mathbb Z\to F\) be an injective ring homomorphism. There exists a unique field homomorphism
\[
\widetilde f:\mathbb Q\to F
\]
such that
\[
\widetilde f\circ\iota_{\mathbb Z\mathbb Q}=f.
\]

**Definition 2.3 (Explicit extension).**
For \(a\in\mathbb Z\) and \(b\in\mathbb N\), define
\[
\widetilde f(a/b)=f(a)f(b)^{-1}.
\]

**Corollary 2.4 (Uniqueness of the fraction field).**
Any two fraction fields of \(\mathbb Z\) are uniquely isomorphic by an isomorphism fixing the embedded integers.

## 3. Metric Completion of the Rationals

**Definition 3.1 (Dense isometric embedding).**
Let \((X,d_X)\) and \((Y,d_Y)\) be metric spaces. A map \(i:X\to Y\) is a dense isometric embedding if it preserves distances and its image is dense in \(Y\).

**Definition 3.2 (Metric completion).**
A metric completion of \(X\) is a complete metric space \(\widehat X\) equipped with a dense isometric embedding \(i:X\to\widehat X\).

**Theorem 3.3 (Universal property of metric completion).**
Let \(i:X\to\widehat X\) be a metric completion. Let \(Y\) be a complete metric space and let \(f:X\to Y\) be uniformly continuous. Then there exists a unique uniformly continuous map
\[
\widehat f:\widehat X\to Y
\]
with
\[
\widehat f\circ i=f.
\]

**Specialization 3.4 (Metric universal property of \(\mathbb R\)).**
The Cauchy construction of \(\mathbb R\), together with the canonical embedding \(\mathbb Q\hookrightarrow\mathbb R\), is a metric completion of \(\mathbb Q\) under the usual metric.

## 4. Ordered-Field Characterization of the Reals

**Theorem 4.1 (Uniqueness of complete Archimedean ordered fields).**
Let \(F\) and \(K\) be complete Archimedean ordered fields. There exists a unique order-preserving field isomorphism
\[
\Phi:F\to K
\]
that sends \(1_F\) to \(1_K\).

**Corollary 4.2 (Universal comparison of real constructions).**
Every real-number construction in this package is uniquely isomorphic to every other by an ordered-field isomorphism fixing the embedded rational numbers.

**Normalization note.** This is a uniqueness characterization, not a naive initial-object statement in the category of complete ordered fields.

## 5. Extension of Uniformly Continuous Rational Functions

**Theorem 5.1 (Extension from a dense subfield).**
Let \(Y\) be a complete metric space, let \(A\subseteq\mathbb R\), and let \(D=A\cap\mathbb Q\) be dense in \(A\). Every uniformly continuous map \(f:D\to Y\) extends uniquely to a uniformly continuous map \(\overline f:A\to Y\).

**Significance.** This theorem supplies the abstract mechanism behind extending rationally defined functions to real arguments.

## 6. Final Structural Summary

**Theorem 6.1 (Canonical nature of the extension chain).**
The integers are the additive group completion of the whole numbers, the rationals are the fraction field of the integers, and the reals are both the metric completion of the rationals and the unique complete Archimedean ordered field containing their canonical image.
