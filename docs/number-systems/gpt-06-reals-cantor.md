# Part 7C — Cantor Reals Through Endpoint Cauchy Sequences

## 0. Purpose

This document constructs a presentation of the real numbers from nested shrinking rational intervals, but it deliberately mediates equality and arithmetic through the Cauchy-sequence machinery of Part 7B. The intervals organize approximations; the endpoint sequences carry the algebra.

This construction is therefore distinct from Part 7D, where intervals and interval overlap are primitive throughout.

## 1. Cantor Interval Sequences

**Definition 1.1 (Rational closed interval).**
Let \(a,b\in\mathbb Q\) with \(a\le b\). The rational closed interval with endpoints \(a\) and \(b\) is
\[
[a,b]_{\mathbb Q}:=\{q\in\mathbb Q:a\le q\le b\}.
\]

**Definition 1.2 (Cantor interval sequence).**
A Cantor interval sequence is a sequence \(I=(I_n)_{n\in\mathbb N}\), where
\[
I_n=[a_n,b_n]_{\mathbb Q},
\]
such that:

1. \(I_{n+1}\subseteq I_n\) for every \(n\in\mathbb N\);
2. for every \(\varepsilon\in\mathbb Q_{>0}\), there exists \(N\in\mathbb N\) such that \(b_n-a_n<\varepsilon\) whenever \(n\ge N\).

**Theorem 1.3 (Endpoint sequences are Cauchy).**
If \(I_n=[a_n,b_n]_{\mathbb Q}\) is a Cantor interval sequence, then \((a_n)\) and \((b_n)\) are rational Cauchy sequences, and \((b_n-a_n)\) is a null sequence.

**Corollary 1.4 (Endpoints determine the same Cauchy real).**
For every Cantor interval sequence \(I_n=[a_n,b_n]_{\mathbb Q}\), the endpoint sequences \((a_n)\) and \((b_n)\) represent the same element of the Cauchy real field \(\mathbb R_C\).

## 2. Endpoint-Mediated Equivalence

**Definition 2.1 (Cantor equivalence).**
Let \(I_n=[a_n,b_n]_{\mathbb Q}\) and \(J_n=[c_n,d_n]_{\mathbb Q}\) be Cantor interval sequences. Define
\[
I\approx_C J
\]
if the rational sequence \((a_n-c_n)\) is null.

**Theorem 2.2 (Equivalent endpoint formulations).**
For Cantor interval sequences \(I\) and \(J\), the following conditions are equivalent:

1. \((a_n-c_n)\) is null;
2. \((b_n-d_n)\) is null;
3. \((a_n-d_n)\) is null;
4. \((b_n-c_n)\) is null;
5. the endpoint sequences of \(I\) and \(J\) determine the same Cauchy real.

**Theorem 2.3 (Cantor equivalence is an equivalence relation).**
The relation \(\approx_C\) is reflexive, symmetric, and transitive.

**Definition 2.4 (Cantor real field).**
Let \(\mathbb R_{\mathrm{Can}}\) be the quotient of the set of Cantor interval sequences by \(\approx_C\).

## 3. Comparison with Cauchy Reals

**Definition 3.1 (Endpoint map).**
Define
\[
E:\mathbb R_{\mathrm{Can}}\to\mathbb R_C
\]
by
\[
E([I])=[(a_n)]_C,
\]
where \(I_n=[a_n,b_n]_{\mathbb Q}\).

**Theorem 3.2 (Endpoint map is well-defined and injective).**
The map \(E\) is well-defined and injective.

**Theorem 3.3 (Every Cauchy real has a nested-interval representative).**
For every rational Cauchy sequence \((x_n)\), there exists a Cantor interval sequence \(I\) whose endpoint sequences represent the same Cauchy real as \((x_n)\).

**Proof obligations.** Construct a subsequence with a prescribed error modulus and surround its terms by nested rational intervals of rapidly decreasing length.

**Corollary 3.4 (Endpoint map is bijective).**
The map \(E\) is a bijection.

## 4. Arithmetic Transported Through Endpoints

**Definition 4.1 (Addition and multiplication).**
For \(x,y\in\mathbb R_{\mathrm{Can}}\), define \(x+y\) and \(xy\) to be the unique elements satisfying
\[
E(x+y)=E(x)+E(y)
\quad\text{and}\quad
E(xy)=E(x)E(y).
\]

**Definition 4.2 (Order).**
For \(x,y\in\mathbb R_{\mathrm{Can}}\), define
\[
x<y\quad\Longleftrightarrow\quad E(x)<E(y).
\]

**Theorem 4.3 (Ordered-field structure).**
The transported operations and order make \(\mathbb R_{\mathrm{Can}}\) a complete Archimedean ordered field, and \(E\) is an ordered-field isomorphism.

## 5. Derived Interval Formulas

**Theorem 5.1 (Interval addition formula).**
If \(I_n=[a_n,b_n]\) and \(J_n=[c_n,d_n]\), then the Cantor real sum is represented by
\[
I_n+J_n=[a_n+c_n,b_n+d_n].
\]

**Theorem 5.2 (Interval multiplication formula).**
If \(I_n=[a_n,b_n]\) and \(J_n=[c_n,d_n]\), then the Cantor real product is represented by
\[
I_nJ_n=
[\min\{a_nc_n,a_nd_n,b_nc_n,b_nd_n\},
 \max\{a_nc_n,a_nd_n,b_nc_n,b_nd_n\}].
\]

**Normalization note.** These formulas are derived consequences of endpoint/Cauchy arithmetic. They are not the primitive definitions in this construction.

## 6. Final Structural Summary

**Theorem 6.1 (Cantor endpoint construction).**
The quotient of nested shrinking rational interval sequences by endpoint-null equivalence is a complete Archimedean ordered field canonically isomorphic to the Cauchy real field.
