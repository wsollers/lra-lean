# Part 4 — Divisibility and Euclidean Division

## 0. Purpose

This document develops divisibility on \(\mathbb W\), Euclidean division, greatest common divisors, and the basic prime-number vocabulary needed later for reduced rational representations and unique factorization.

## 1. Divisibility

**Definition 1.1 (Divisibility).**
Let \(a,b\in\mathbb W\). The whole number \(a\) divides \(b\), written \(a\mid b\), if there exists \(k\in\mathbb W\) such that
\[
b=ak.
\]

**Definition 1.2 (Divisor and multiple).**
If \(a\mid b\), then \(a\) is a divisor of \(b\), and \(b\) is a multiple of \(a\).

**Theorem 1.3 (Elementary divisibility laws).**
For all \(a,b,c\in\mathbb W\):

1. \(a\mid a\);
2. if \(a\mid b\) and \(b\mid c\), then \(a\mid c\);
3. if \(a\mid b\) and \(a\mid c\), then \(a\mid(b+c)\);
4. if \(a\mid b\), then \(a\mid bc\);
5. \(1\mid a\);
6. \(a\mid0\);
7. \(0\mid a\) if and only if \(a=0\).

**Theorem 1.4 (Antisymmetry of divisibility on positive whole numbers).**
If \(a,b\in\mathbb N\), \(a\mid b\), and \(b\mid a\), then \(a=b\).

## 2. Euclidean Division

**Theorem 2.1 (Division algorithm on \(\mathbb W\)).**
Let \(a\in\mathbb W\) and let \(b\in\mathbb N\). There exist unique \(q,r\in\mathbb W\) such that
\[
a=bq+r
\]
and
\[
0\le r<b.
\]

**Dependencies.** Well-ordering of \(\mathbb W\), addition and multiplication laws.

**Proof obligations.** For existence, consider the set of nonnegative differences \(a-bq\). For uniqueness, subtract two representations and use the remainder bounds.

**Definition 2.2 (Quotient and remainder).**
Under the hypotheses of Theorem 2.1, the unique \(q\) is the quotient of \(a\) by \(b\), and the unique \(r\) is the remainder of \(a\) upon division by \(b\).

**Corollary 2.3 (Divisibility and zero remainder).**
Let \(a\in\mathbb W\) and \(b\in\mathbb N\). Then \(b\mid a\) if and only if the remainder of \(a\) upon division by \(b\) is zero.

## 3. Parity and Congruence

**Definition 3.1 (Even and odd whole numbers).**
A whole number \(n\) is even if \(2\mid n\). It is odd if there exists \(k\in\mathbb W\) such that
\[
n=2k+1.
\]

**Theorem 3.2 (Parity dichotomy).**
Every whole number is exactly one of even or odd.

**Definition 3.3 (Congruence modulo \(m\)).**
Let \(m\in\mathbb N\). For \(a,b\in\mathbb W\), define
\[
a\equiv b\pmod m
\]
if \(a\) and \(b\) have the same remainder upon division by \(m\).

**Theorem 3.4 (Congruence is an equivalence relation).**
For every \(m\in\mathbb N\), congruence modulo \(m\) is an equivalence relation on \(\mathbb W\).

**Theorem 3.5 (Congruence respects addition and multiplication).**
If \(a\equiv b\pmod m\) and \(c\equiv d\pmod m\), then
\[
a+c\equiv b+d\pmod m
\]
and
\[
ac\equiv bd\pmod m.
\]

## 4. Greatest Common Divisors

**Definition 4.1 (Common divisor).**
Let \(a,b\in\mathbb W\). A whole number \(d\) is a common divisor of \(a\) and \(b\) if \(d\mid a\) and \(d\mid b\).

**Definition 4.2 (Greatest common divisor).**
Let \(a,b\in\mathbb W\), not both zero. A natural number \(d\) is the greatest common divisor of \(a\) and \(b\) if:

1. \(d\mid a\) and \(d\mid b\);
2. every common divisor of \(a\) and \(b\) divides \(d\).

Write \(d=\gcd(a,b)\).

**Theorem 4.3 (Existence and uniqueness of gcd).**
If \(a,b\in\mathbb W\) are not both zero, then \(\gcd(a,b)\) exists and is unique.

**Proof obligations.** Prove by the Euclidean algorithm or by taking the greatest element of the finite set of positive common divisors.

**Definition 4.4 (Relatively prime).**
Whole numbers \(a,b\), not both zero, are relatively prime if
\[
\gcd(a,b)=1.
\]

**Theorem 4.5 (Bézout identity for whole numbers, integer-coefficient form).**
If \(a,b\in\mathbb W\) are not both zero, then there exist integers \(x,y\in\mathbb Z\) such that
\[
\gcd(a,b)=ax+by.
\]

**Dependencies.** Construction of \(\mathbb Z\). This theorem may be stated here and proved after integers are available.

## 5. Prime Numbers

**Definition 5.1 (Prime number).**
A natural number \(p\) is prime if \(p\ne1\) and its only natural-number divisors are \(1\) and \(p\).

**Definition 5.2 (Composite number).**
A natural number \(n\) is composite if there exist \(a,b\in\mathbb N\) with \(1<a<n\), \(1<b<n\), and \(n=ab\).

**Theorem 5.3 (Prime-composite dichotomy).**
Every natural number greater than \(1\) is either prime or composite, but not both.

**Theorem 5.4 (Existence of prime divisors).**
Every natural number greater than \(1\) has a prime divisor.

**Theorem 5.5 (Euclid's lemma).**
If \(p\) is prime and \(p\mid ab\), then \(p\mid a\) or \(p\mid b\).

**Theorem 5.6 (Fundamental theorem of arithmetic).**
Every natural number greater than \(1\) can be expressed as a finite product of prime numbers, and this factorization is unique up to the order of the prime factors.

**Proof status.** Include proof or mark as deferred, but retain the complete statement.
