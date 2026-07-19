# Part 7D — The Real Numbers by Primitive Interval Quotients

## 0. Purpose

This document constructs a complete ordered field directly from nested shrinking rational intervals. Intervals are primitive representatives. Equivalence is defined by persistent cross-level overlap, and arithmetic is defined first on intervals themselves.

No real number, Cauchy-equivalence class, or Dedekind cut is used in the definitions.

## 1. Primitive Interval Representatives

**Definition 1.1 (Rational closed interval).**
For \(a,b\in\mathbb Q\) with \(a\le b\), define
\[
[a,b]_{\mathbb Q}:=\{q\in\mathbb Q:a\le q\le b\}.
\]

**Definition 1.2 (Admissible interval sequence).**
An admissible interval sequence is a sequence \(I=(I_n)\), with
\[
I_n=[a_n,b_n]_{\mathbb Q},
\]
such that:

1. \(I_{n+1}\subseteq I_n\) for every \(n\);
2. for every \(\varepsilon\in\mathbb Q_{>0}\), there exists \(N\) such that \(b_n-a_n<\varepsilon\) whenever \(n\ge N\).

**Definition 1.3 (Persistent-overlap relation).**
For admissible interval sequences \(I=(I_n)\) and \(J=(J_n)\), define
\[
I\bowtie J
\]
if
\[
I_m\cap J_n\ne\varnothing
\]
for every \(m,n\in\mathbb N\).

**Normalization note.** Same-index overlap alone is not transitive. Cross-level overlap is required.

**Theorem 1.4 (Persistent overlap is an equivalence relation).**
The relation \(\bowtie\) is reflexive, symmetric, and transitive on admissible interval sequences.

**Proof obligations.** For transitivity, use nestedness and arbitrarily small diameters to show that a separation between \(I_m\) and \(K_n\) would force a sufficiently small interval of the middle sequence to fail to meet one of them.

**Definition 1.5 (Primitive interval real).**
Let
\[
\mathbb R_{\bowtie}:=\mathcal I/\bowtie,
\]
where \(\mathcal I\) is the set of admissible interval sequences.

## 2. Rational Embedding

**Definition 2.1 (Degenerate constant representative).**
For \(q\in\mathbb Q\), let \(C_q\) be the constant sequence \(([q,q]_{\mathbb Q})_n\).

**Definition 2.2 (Canonical rational embedding).**
Define
\[
\iota_{\bowtie}:\mathbb Q\to\mathbb R_{\bowtie}
\]
by
\[
\iota_{\bowtie}(q):=[C_q]_{\bowtie}.
\]

**Theorem 2.3 (Rational embedding is injective).**
The map \(\iota_{\bowtie}\) is injective.

## 3. Primitive Interval Arithmetic

**Definition 3.1 (Minkowski interval sum).**
For rational intervals \(I=[a,b]\) and \(J=[c,d]\), define
\[
I\oplus J:=[a+c,b+d].
\]

**Definition 3.2 (Interval negation).**
For \(I=[a,b]\), define
\[
\ominus I:=[-b,-a].
\]

**Definition 3.3 (Interval product).**
For \(I=[a,b]\) and \(J=[c,d]\), define
\[
I\otimes J:=
[\min\{ac,ad,bc,bd\},\max\{ac,ad,bc,bd\}].
\]

**Theorem 3.4 (Closure on admissible representatives).**
Termwise addition, negation, and multiplication send admissible interval sequences to admissible interval sequences.

**Proof obligations.** For multiplication, first prove that every admissible sequence is uniformly rationally bounded, then derive an explicit diameter estimate for interval products.

**Theorem 3.5 (Compatibility with persistent overlap).**
If \(I\bowtie I'\) and \(J\bowtie J'\), then
\[
(I_n\oplus J_n)_n\bowtie(I'_n\oplus J'_n)_n,
\]
\[
(\ominus I_n)_n\bowtie(\ominus I'_n)_n,
\]
and
\[
(I_n\otimes J_n)_n\bowtie(I'_n\otimes J'_n)_n.
\]

**Definition 3.6 (Quotient addition, negation, and multiplication).**
For \([I],[J]\in\mathbb R_{\bowtie}\), define
\[
[I]+[J]:=[(I_n\oplus J_n)_n],
\]
\[
-[I]:=[(\ominus I_n)_n],
\]
and
\[
[I][J]:=[(I_n\otimes J_n)_n].
\]

**Definition 3.7 (Zero and one).**
Define
\[
0_{\bowtie}:=\iota_{\bowtie}(0),
\qquad
1_{\bowtie}:=\iota_{\bowtie}(1).
\]

## 4. Order

**Definition 4.1 (Eventual strict separation).**
For classes \([I]\) and \([J]\), define \([I]<[J]\) if there exist \(m,n\in\mathbb N\) such that every element of \(I_m\) is strictly less than every element of \(J_n\).

Equivalently, if \(I_m=[a_m,b_m]\) and \(J_n=[c_n,d_n]\), then
\[
[I]<[J]\quad\Longleftrightarrow\quad b_m<c_n
\]
for some \(m,n\).

**Theorem 4.2 (Order is well-defined).**
The relation in Definition 4.1 is independent of representatives.

**Theorem 4.3 (Strict total order).**
The relation \(<\) is a strict total order on \(\mathbb R_{\bowtie}\).

**Theorem 4.4 (Order compatibility).**
Addition preserves strict order, and multiplication by a positive element preserves strict order.

## 5. Raw Interval Laws and Their Quotient Recovery

**Theorem 5.1 (Raw interval subdistributivity).**
For all rational closed intervals \(I,J,K\),
\[
I\otimes(J\oplus K)
\subseteq
(I\otimes J)\oplus(I\otimes K).
\]

**Theorem 5.2 (Raw distributivity can fail).**
There exist rational closed intervals \(I,J,K\) for which
\[
I\otimes(J\oplus K)
\subsetneq
(I\otimes J)\oplus(I\otimes K).
\]

**Required counterexample.** Use a nondegenerate interval appearing on both terms of the right-hand side and calculate both enclosures explicitly.

**Theorem 5.3 (Distributive defect vanishes for shrinking representatives).**
Let \((I_n),(J_n),(K_n)\) be admissible interval sequences. Then the sequences
\[
(I_n\otimes(J_n\oplus K_n))_n
\]
and
\[
((I_n\otimes J_n)\oplus(I_n\otimes K_n))_n
\]
are persistently overlapping.

**Corollary 5.4 (Distributivity in the quotient).**
For all \(x,y,z\in\mathbb R_{\bowtie}\),
\[
x(y+z)=xy+xz.
\]

**Interpretation.** Raw intervals retain dependency information and need not form a ring. The quotient identifies enclosures whose uncertainty shrinks to zero, restoring exact field laws.

## 6. Multiplicative Inverses

**Lemma 6.1 (Nonzero classes are eventually separated from zero).**
If \([I]\ne0_{\bowtie}\), then there exists an equivalent admissible representative \((J_n)\) and a positive rational \(\delta\) such that either
\[
J_n\subseteq[\delta,\infty)\cap\mathbb Q
\]
for all sufficiently large \(n\), or
\[
J_n\subseteq(-\infty,-\delta]\cap\mathbb Q
\]
for all sufficiently large \(n\).

**Definition 6.2 (Reciprocal interval).**
For \(I=[a,b]\) with \(0\notin I\), define
\[
I^{-1}:=[1/b,1/a].
\]

**Theorem 6.3 (Reciprocal is well-defined on nonzero classes).**
Termwise reciprocal, after discarding a finite initial segment, defines a representative-independent multiplicative inverse on every nonzero class.

## 7. Field and Completeness

**Theorem 7.1 (Ordered-field structure).**
The structure
\[
(\mathbb R_{\bowtie},+,\cdot,0_{\bowtie},1_{\bowtie},<)
\]
is an Archimedean ordered field.

**Theorem 7.2 (Nested-interval completeness).**
Every nonempty subset of \(\mathbb R_{\bowtie}\) that is bounded above has a least upper bound.

**Proof obligation.** Construct a nested sequence of rational intervals that successively localizes the cut between members and upper bounds of the subset. Do not invoke another construction of \(\mathbb R\).

## 8. Comparison with the Cantor Endpoint Construction

**Theorem 8.1 (Persistent overlap equals endpoint-null equivalence).**
Let \(I_n=[a_n,b_n]\) and \(J_n=[c_n,d_n]\) be admissible interval sequences. Then
\[
I\bowtie J
\]
if and only if \((a_n-c_n)\) is a null sequence.

**Significance.** The relation \(\bowtie\) was defined only through set intersection, while endpoint-null equivalence was defined analytically through rational sequences. Their equivalence is a substantive theorem.

**Corollary 8.2 (Canonical comparison isomorphism).**
The identity on admissible interval representatives induces an ordered-field isomorphism
\[
\mathbb R_{\bowtie}\cong\mathbb R_{\mathrm{Can}}
\]
fixing the embedded rational numbers.

## 9. Final Structural Summary

**Theorem 9.1 (Primitive interval construction of the reals).**
The quotient of nested shrinking rational interval sequences by persistent cross-level overlap is a complete Archimedean ordered field. Its arithmetic is induced from primitive interval operations, and it is canonically isomorphic to the other real constructions while remaining definitionally independent of them.


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
