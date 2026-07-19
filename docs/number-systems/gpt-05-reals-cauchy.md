# Part 7B — The Real Numbers by Cauchy Sequences

## 0. Purpose

This construction defines real numbers as equivalence classes of rational Cauchy sequences. The principal technical obligations are proving that the equivalence relation, operations, and order are well-defined.

## 1. Rational Cauchy Sequences

**Definition 1.1 (Rational sequence).**
A rational sequence is a function \(x:\mathbb N\to\mathbb Q\), written \((x_n)\).

**Definition 1.2 (Cauchy sequence).**
A rational sequence \((x_n)\) is Cauchy if, for every \(\varepsilon\in\mathbb Q_{>0}\), there exists \(N\in\mathbb N\) such that
\[
|x_m-x_n|<\varepsilon
\]
whenever \(m,n\ge N\).

**Definition 1.3 (Null sequence).**
A rational sequence \((x_n)\) is null if, for every \(\varepsilon\in\mathbb Q_{>0}\), there exists \(N\in\mathbb N\) such that
\[
|x_n|<\varepsilon
\]
whenever \(n\ge N\).

**Definition 1.4 (Cauchy equivalence).**
For rational Cauchy sequences \((x_n)\) and \((y_n)\), define
\[
(x_n)\sim(y_n)
\quad\Longleftrightarrow\quad
(x_n-y_n)\text{ is null}.
\]

**Theorem 1.5 (Cauchy equivalence is an equivalence relation).**
The relation \(\sim\) is reflexive, symmetric, and transitive on the set of rational Cauchy sequences.

**Definition 1.6 (Cauchy real numbers).**
Let \(\mathbb R_C\) be the quotient of the set of rational Cauchy sequences by \(\sim\). Write \([x_n]\) for the class of \((x_n)\).

## 2. Algebraic Operations

**Definition 2.1 (Addition).**
Define
\[
[x_n]+[y_n]:=[x_n+y_n].
\]

**Theorem 2.2 (Well-definedness of addition).**
Equivalent Cauchy sequences have equivalent termwise sums.

**Definition 2.3 (Multiplication).**
Define
\[
[x_n][y_n]:=[x_ny_n].
\]

**Theorem 2.4 (Products of Cauchy sequences are Cauchy).**
If \((x_n)\) and \((y_n)\) are rational Cauchy sequences, then \((x_ny_n)\) is Cauchy.

**Theorem 2.5 (Well-definedness of multiplication).**
Equivalent Cauchy sequences have equivalent termwise products.

**Definition 2.6 (Zero, one, and additive inverse).**
Define
\[
0_C:=[0,0,0,\ldots],\qquad1_C:=[1,1,1,\ldots]
\]
and
\[
-[x_n]:=[-x_n].
\]

**Theorem 2.7 (Additive group and ring laws).**
The induced addition and multiplication satisfy the commutative-ring laws.

**Lemma 2.8 (Nonzero classes are bounded away from zero eventually).**
If \([x_n]\ne0_C\), then there exist \(\varepsilon\in\mathbb Q_{>0}\) and \(N\in\mathbb N\) such that
\[
|x_n|\ge\varepsilon
\]
for every \(n\ge N\).

**Definition 2.9 (Reciprocal).**
Let \([x_n]\ne0_C\). Choose \(N\) such that \(x_n\ne0\) for all \(n\ge N\), and define a rational sequence \((y_n)\) by assigning arbitrary nonzero values for \(n<N\) and
\[
y_n:=\frac1{x_n}
\]
for \(n\ge N\). Define
\[
[x_n]^{-1}:=[y_n].
\]

**Theorem 2.10 (Well-definedness and correctness of reciprocal).**
Definition 2.9 is independent of all choices and
\[
[x_n][x_n]^{-1}=1_C.
\]

**Theorem 2.11 (Field structure).**
The structure \((\mathbb R_C,+,\cdot,0_C,1_C)\) is a field.

## 3. Order

**Definition 3.1 (Positive Cauchy class).**
A class \([x_n]\in\mathbb R_C\) is positive if there exist \(\varepsilon\in\mathbb Q_{>0}\) and \(N\in\mathbb N\) such that
\[
x_n\ge\varepsilon
\]
for every \(n\ge N\).

**Definition 3.2 (Strict order).**
For \(x,y\in\mathbb R_C\), define
\[
x<y\quad\Longleftrightarrow\quad y-x\text{ is positive}.
\]

**Normalization notes.** Do not define strict order merely by eventual pointwise inequality; equivalent sequences can violate that naive definition.

**Theorem 3.3 (Well-definedness of positivity and order).**
Positivity and strict order are independent of representatives.

**Theorem 3.4 (Strict total order).**
The relation \(<\) is a strict total order on \(\mathbb R_C\).

**Theorem 3.5 (Ordered-field compatibility).**
The order is translation-invariant, and the product of two positive Cauchy reals is positive.

**Theorem 3.6 (Ordered-field structure).**
The Cauchy real numbers form an ordered field.

## 4. Rational Embedding

**Definition 4.1 (Constant-sequence embedding).**
Define \(\iota_C:\mathbb Q\to\mathbb R_C\) by
\[
\iota_C(q):=[q,q,q,\ldots].
\]

**Theorem 4.2 (Embedding properties).**
The map \(\iota_C\) is an ordered-field embedding.

## 5. Comparison with Dedekind Reals

**Definition 5.1 (Cut associated with a Cauchy class).**
For \(x=[x_n]\in\mathbb R_C\), define
\[
\Phi(x):=\{q\in\mathbb Q:\exists\varepsilon\in\mathbb Q_{>0}\ \exists N\ \forall n\ge N\ (q+\varepsilon<x_n)\}.
\]

**Theorem 5.2 (Well-definedness of \(\Phi\)).**
The set \(\Phi(x)\) is a Dedekind cut and is independent of the representative of \(x\).

**Theorem 5.3 (Ordered-field isomorphism).**
The map
\[
\Phi:\mathbb R_C\to\mathbb R_D
\]
is an ordered-field isomorphism satisfying
\[
\Phi(\iota_C(q))=\iota_D(q)
\]
for every \(q\in\mathbb Q\).

**Corollary 5.4 (Completeness of the Cauchy reals).**
The ordered field \(\mathbb R_C\) has the least-upper-bound property.

**Proof obligations.** Invoke preservation of completeness by order isomorphisms only after proving Theorem 5.3.

## 6. Sequential Completeness

**Theorem 6.1 (Every Cauchy sequence of Cauchy reals converges).**
Every Cauchy sequence in \(\mathbb R_C\), with respect to the metric induced by absolute value, converges to an element of \(\mathbb R_C\).

**Normalization notes.** Distinguish rational Cauchy sequences used as representatives from Cauchy sequences whose terms are already real numbers.

## 7. Final Structural Summary

**Theorem 7.1 (Cauchy construction of the reals).**
The Cauchy real numbers form a complete Archimedean ordered field, uniquely isomorphic to the Dedekind real numbers by an isomorphism fixing \(\mathbb Q\).


---

## Streamlined quotient-operation workflow

All quotient operations in this file should use the abstract descent machinery in
`gpt-00-abstract-laws.md`.

For each raw binary operation \(O\) on representatives:

1. define \(O\) before defining the class operation;
2. prove that \(O\) respects the equivalence relation in the first argument;
3. prove right respect separately, or derive it from commutativity;
4. invoke the induced-operation theorem to obtain the operation on classes.

For each unary operation, predicate, or order relation:

1. define it on representatives;
2. prove representative independence;
3. invoke the corresponding induced unary-operation, predicate, or relation theorem.

This replaces repeated four-representative well-definedness proofs with smaller
one-coordinate compatibility proofs and one reusable abstract theorem.
