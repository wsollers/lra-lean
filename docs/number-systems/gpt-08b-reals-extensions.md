# Part 8 — Derived Operations on the Real Numbers

## 0. Purpose

This document develops integer parts, powers, roots, rational exponents, and real exponentiation after a complete ordered field \(\mathbb R\) has been fixed.

## 1. Archimedean and Integer-Part Theorems

**Theorem 1.1 (Archimedean property).**
For every \(x\in\mathbb R\), there exists \(n\in\mathbb N\) such that
\[
x<n.
\]

**Theorem 1.2 (Integer-part theorem).**
For every \(x\in\mathbb R\), there exists a unique \(m\in\mathbb Z\) such that
\[
m\le x<m+1.
\]

**Definition 1.3 (Floor).**
For \(x\in\mathbb R\), define \(\lfloor x\rfloor\) to be the unique integer satisfying
\[
\lfloor x\rfloor\le x<\lfloor x\rfloor+1.
\]

**Definition 1.4 (Ceiling).**
For \(x\in\mathbb R\), define
\[
\lceil x\rceil:=-\lfloor-x\rfloor.
\]

**Theorem 1.5 (Floor and ceiling characterizations).**
For every \(x\in\mathbb R\), \(\lfloor x\rfloor\) is the greatest integer not exceeding \(x\), and \(\lceil x\rceil\) is the least integer not less than \(x\).

## 2. Integer Powers

**Definition 2.1 (Nonnegative integer powers).**
Let \(a\in\mathbb R\). Define recursively
\[
a^0:=1,
\qquad
a^{n+1}:=a^na
\]
for \(n\in\mathbb W\).

**Definition 2.2 (Negative integer powers).**
If \(a\ne0\) and \(n\in\mathbb N\), define
\[
a^{-n}:=(a^n)^{-1}.
\]

**Theorem 2.3 (Integer exponent laws).**
Whenever all expressions are defined, for \(a,b\in\mathbb R\) and \(m,n\in\mathbb Z\),
\[
a^{m+n}=a^ma^n,
\qquad
(a^m)^n=a^{mn},
\qquad
(ab)^n=a^nb^n.
\]

## 3. Roots

**Theorem 3.1 (Positive \(n\)-th roots).**
Let \(n\in\mathbb N\) and \(a>0\). There exists a unique \(x>0\) such that
\[
x^n=a.
\]

**Proof obligations.** Apply the least-upper-bound property to \(\{x\ge0:x^n<a\}\) and prove the supremum has exactly the required power.

**Theorem 3.2 (Roots at zero).**
For every \(n\in\mathbb N\), the unique nonnegative solution of \(x^n=0\) is \(x=0\).

**Theorem 3.3 (Odd roots of negative numbers).**
If \(n\) is odd and \(a<0\), then there exists a unique \(x<0\) such that \(x^n=a\).

**Theorem 3.4 (No even root of a negative number).**
If \(n\) is even and \(a<0\), then there is no \(x\in\mathbb R\) such that \(x^n=a\).

**Definition 3.5 (Principal \(n\)-th root).**
For \(a\ge0\), define \(a^{1/n}\) to be the unique nonnegative real number \(x\) satisfying \(x^n=a\).

**Definition 3.6 (Square root).**
For \(a\ge0\), define
\[
\sqrt a:=a^{1/2}.
\]

## 4. Rational Powers

**Definition 4.1 (Positive-base rational power).**
Let \(a>0\) and \(r\in\mathbb Q\). Choose \(p\in\mathbb Z\) and \(q\in\mathbb N\) with \(r=p/q\). Define
\[
a^r:=(a^{1/q})^p.
\]

**Theorem 4.2 (Well-definedness of rational powers).**
The value in Definition 4.1 is independent of the representation \(r=p/q\).

**Theorem 4.3 (Rational exponent laws).**
For \(a,b>0\) and \(r,s\in\mathbb Q\),
\[
a^{r+s}=a^ra^s,
\qquad
(a^r)^s=a^{rs},
\qquad
(ab)^r=a^rb^r.
\]

**Theorem 4.4 (Monotonicity in the exponent).**
If \(a>1\) and \(r<s\), then \(a^r<a^s\). If \(0<a<1\), then \(a^s<a^r\).

## 5. Real Exponentiation

**Definition 5.1 (Real powers for base greater than one).**
Let \(a>1\) and \(x\in\mathbb R\). Define
\[
a^x:=\sup\{a^q:q\in\mathbb Q\text{ and }q<x\}.
\]

**Definition 5.2 (Base one).**
For every \(x\in\mathbb R\), define
\[
1^x:=1.
\]

**Definition 5.3 (Real powers for bases between zero and one).**
If \(0<a<1\), define
\[
a^x:=(a^{-1})^{-x}.
\]

**Theorem 5.4 (Well-definedness of real exponentiation).**
For every \(a>0\) and \(x\in\mathbb R\), the preceding definitions determine a unique positive real number \(a^x\).

**Theorem 5.5 (Agreement with rational powers).**
If \(a>0\) and \(r\in\mathbb Q\), then the real-exponent definition of \(a^r\) agrees with Definition 4.1.

**Theorem 5.6 (Real exponent laws).**
For \(a,b>0\) and \(x,y\in\mathbb R\),
\[
a^{x+y}=a^xa^y,
\qquad
(a^x)^y=a^{xy},
\qquad
(ab)^x=a^xb^x.
\]

**Theorem 5.7 (Monotonicity and continuity).**
If \(a>1\), then \(x\mapsto a^x\) is strictly increasing and continuous. If \(0<a<1\), then it is strictly decreasing and continuous.

**Theorem 5.8 (Range).**
If \(a>0\) and \(a\ne1\), then
\[
\{a^x:x\in\mathbb R\}=(0,\infty).
\]

## 6. Uniqueness of the Real Field

**Theorem 6.1 (Uniqueness of complete Archimedean ordered fields).**
Any two complete Archimedean ordered fields are uniquely isomorphic by an ordered-field isomorphism that sends \(1\) to \(1\). This isomorphism fixes the canonically embedded copies of \(\mathbb Q\).

**Corollary 6.2 (Equivalence of real constructions).**
The Dedekind, Cauchy, nested-interval, and canonical binary constructions are uniquely isomorphic as ordered fields by isomorphisms fixing \(\mathbb Q\).
