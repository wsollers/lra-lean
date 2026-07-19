# Part 7A — The Real Numbers by Dedekind Cuts

## 0. Purpose

This is the reference construction of the real numbers. It must establish directly that the resulting structure is a complete ordered field. Later constructions may transfer completeness through an explicit ordered-field isomorphism.

## 1. Dedekind Cuts

**Definition 1.1 (Dedekind cut).**
A Dedekind cut is a subset \(A\subseteq\mathbb Q\) satisfying:

1. \(A\ne\varnothing\);
2. \(A\ne\mathbb Q\);
3. if \(x\in A\) and \(y<x\), then \(y\in A\);
4. for every \(x\in A\), there exists \(y\in A\) such that \(x<y\).

**Definition 1.2 (Dedekind real numbers).**
Let
\[
\mathbb R_D:=\{A\subseteq\mathbb Q:A\text{ is a Dedekind cut}\}.
\]

**Theorem 1.3 (Equality of cuts).**
Two Dedekind real numbers are equal exactly when they are equal as subsets of \(\mathbb Q\).

## 2. Order and Rational Embedding

**Definition 2.1 (Order by inclusion).**
For \(A,B\in\mathbb R_D\), define
\[
A<B\quad\Longleftrightarrow\quad A\subsetneq B.
\]

**Theorem 2.2 (Strict total order).**
Proper inclusion is a strict total order on \(\mathbb R_D\).

**Definition 2.3 (Rational embedding).**
For \(q\in\mathbb Q\), define
\[
\iota_D(q):=\{r\in\mathbb Q:r<q\}.
\]

**Theorem 2.4 (The rational embedding is well-defined).**
For every \(q\in\mathbb Q\), the set \(\iota_D(q)\) is a Dedekind cut.

**Theorem 2.5 (Order embedding of \(\mathbb Q\)).**
The map \(\iota_D:\mathbb Q\to\mathbb R_D\) is injective and
\[
p<q\quad\Longleftrightarrow\quad\iota_D(p)<\iota_D(q).
\]

## 3. Addition

**Definition 3.1 (Addition of cuts).**
For \(A,B\in\mathbb R_D\), define
\[
A+B:=\{a+b:a\in A,\ b\in B\}.
\]

**Theorem 3.2 (Closure of addition).**
If \(A,B\in\mathbb R_D\), then \(A+B\) is a Dedekind cut.

**Definition 3.3 (Zero cut).**
Define
\[
0_D:=\iota_D(0).
\]

**Definition 3.4 (Additive inverse of a cut).**
For \(A\in\mathbb R_D\), define
\[
-A:=\{q\in\mathbb Q:\exists r\notin A\text{ with }q<-r\}.
\]

**Theorem 3.5 (The additive inverse is a cut).**
For every \(A\in\mathbb R_D\), the set \(-A\) is a Dedekind cut.

**Theorem 3.6 (Additive group structure).**
Addition on \(\mathbb R_D\) is associative and commutative, \(0_D\) is its identity, and \(A+(-A)=0_D\) for every \(A\in\mathbb R_D\).

## 4. Multiplication

**Definition 4.1 (Positive cut).**
A cut \(A\in\mathbb R_D\) is positive if \(0_D<A\), and nonnegative if \(0_D\le A\).

**Definition 4.2 (Product of nonnegative cuts).**
For nonnegative cuts \(A,B\), define
\[
A\odot B:=\{q\in\mathbb Q:q<0\text{ or }\exists a\in A\cap\mathbb Q_{>0}\ \exists b\in B\cap\mathbb Q_{>0}\ (q<ab)\}.
\]

**Theorem 4.3 (Closure of nonnegative multiplication).**
If \(A,B\ge0_D\), then \(A\odot B\) is a Dedekind cut.

**Definition 4.4 (Multiplication of arbitrary cuts).**
Define \(AB\) by sign cases:

- if \(A,B\ge0_D\), set \(AB=A\odot B\);
- if \(A<0_D\le B\), set \(AB=-((-A)\odot B)\);
- if \(B<0_D\le A\), set \(AB=-(A\odot(-B))\);
- if \(A,B<0_D\), set \(AB=(-A)\odot(-B)\).

**Definition 4.5 (One cut).**
Define
\[
1_D:=\iota_D(1).
\]

**Theorem 4.6 (Multiplicative laws).**
Multiplication on \(\mathbb R_D\) is associative and commutative, \(1_D\) is its identity, and multiplication distributes over addition.

**Definition 4.7 (Reciprocal of a positive cut).**
For \(A>0_D\), define
\[
A^{-1}:=\{q\in\mathbb Q:q\le0\text{ or }\exists r\in\mathbb Q_{>0}\setminus A\ (q<1/r)\}.
\]

**Definition 4.8 (Reciprocal of a nonzero cut).**
If \(A<0_D\), define
\[
A^{-1}:=-((-A)^{-1}).
\]

**Theorem 4.9 (Reciprocal correctness).**
If \(A\ne0_D\), then \(A^{-1}\in\mathbb R_D\) and
\[
AA^{-1}=1_D.
\]

**Theorem 4.10 (Field structure).**
The structure \((\mathbb R_D,+,\cdot,0_D,1_D)\) is a field.

## 5. Ordered-Field Structure

**Theorem 5.1 (Translation invariance).**
If \(A<B\), then
\[
A+C<B+C
\]
for every \(C\in\mathbb R_D\).

**Theorem 5.2 (Positive products are positive).**
If \(0_D<A\) and \(0_D<B\), then
\[
0_D<AB.
\]

**Theorem 5.3 (Ordered-field structure).**
The structure \((\mathbb R_D,+,\cdot,0_D,1_D,<)\) is an ordered field.

## 6. Completeness

**Theorem 6.1 (Union of a bounded family of cuts).**
Let \(\mathcal A\subseteq\mathbb R_D\) be nonempty and bounded above. Then
\[
S:=\bigcup_{A\in\mathcal A}A
\]
is a Dedekind cut.

**Theorem 6.2 (Supremum of a family of cuts).**
Under the hypotheses of Theorem 6.1,
\[
\sup\mathcal A=\bigcup_{A\in\mathcal A}A.
\]

**Corollary 6.3 (Least-upper-bound property).**
The ordered field \(\mathbb R_D\) has the least-upper-bound property.

**Theorem 6.4 (Complete ordered-field structure).**
The Dedekind real numbers form a complete ordered field.

## 7. Density and Archimedean Properties

**Theorem 7.1 (Density of embedded rationals).**
If \(A,B\in\mathbb R_D\) and \(A<B\), then there exists \(q\in\mathbb Q\) such that
\[
A<\iota_D(q)<B.
\]

**Theorem 7.2 (Archimedean property).**
For every \(A\in\mathbb R_D\), there exists \(n\in\mathbb N\) such that
\[
A<\iota_D(n).
\]

## 8. Final Structural Summary

**Theorem 8.1 (Reference real-number construction).**
The structure \(\mathbb R_D\) is a complete Archimedean ordered field containing an order-dense embedded copy of \(\mathbb Q\).
