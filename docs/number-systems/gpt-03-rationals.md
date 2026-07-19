# Part 6 — The Rational Numbers \(\mathbb Q\)

## 0. Purpose

The rational numbers are constructed as equivalence classes of integer numerators and positive natural denominators. The use of \(\mathbb N\) for denominators builds nonzeroness and sign normalization into the construction.

## 1. Construction

**Definition 1.1 (Fraction-pair equivalence relation).**
For \((a,b),(c,d)\in\mathbb Z\times\mathbb N\), define
\[
(a,b)\sim(c,d)
\quad\Longleftrightarrow\quad
ad=bc.
\]

**Theorem 1.2 (The fraction-pair relation is an equivalence relation).**
The relation \(\sim\) is reflexive, symmetric, and transitive on \(\mathbb Z\times\mathbb N\).

**Proof obligations.** Transitivity requires multiplicative cancellation in \(\mathbb Z\) and the positivity of denominators.

**Definition 1.3 (Rational numbers).**
Define
\[
\mathbb Q:=(\mathbb Z\times\mathbb N)/\!\sim.
\]
Write \([(a,b)]\) for the equivalence class of \((a,b)\).

## 2. Addition and Multiplication

**Definition 2.1 (Rational addition).**
Define
\[
[(a,b)]+[(c,d)]:=[(ad+bc,bd)].
\]

**Theorem 2.2 (Well-definedness of rational addition).**
Equivalent representatives determine equivalent sums.

**Definition 2.3 (Rational multiplication).**
Define
\[
[(a,b)]\cdot[(c,d)]:=[(ac,bd)].
\]

**Theorem 2.4 (Well-definedness of rational multiplication).**
Equivalent representatives determine equivalent products.

**Definition 2.5 (Zero and one).**
Define
\[
0_{\mathbb Q}:=[(0,1)]
\]
and
\[
1_{\mathbb Q}:=[(1,1)].
\]

**Definition 2.6 (Additive inverse).**
Define
\[
-[(a,b)]:=[(-a,b)].
\]

**Theorem 2.7 (Well-definedness of additive inverse).**
Equivalent representatives determine equivalent additive inverses.

**Theorem 2.8 (Additive group laws).**
The structure \((\mathbb Q,+,0_{\mathbb Q})\) is an abelian group.

**Theorem 2.9 (Multiplicative laws).**
Rational multiplication is associative and commutative, \(1_{\mathbb Q}\) is its identity, and multiplication distributes over addition.

**Definition 2.10 (Reciprocal).**
Let \(q=[(a,b)]\in\mathbb Q\) be nonzero. Then \(a\ne0\). Define
\[
q^{-1}:=
\begin{cases}
[(b,a)],&0<a,\\
[(-b,-a)],&a<0.
\end{cases}
\]

**Theorem 2.11 (Well-definedness and correctness of reciprocal).**
The reciprocal is independent of the representative and satisfies
\[
qq^{-1}=1_{\mathbb Q}=q^{-1}q
\]
for every nonzero \(q\in\mathbb Q\).

**Theorem 2.12 (Field structure).**
The structure \((\mathbb Q,+,\cdot,0_{\mathbb Q},1_{\mathbb Q})\) is a field.

## 3. Order

**Definition 3.1 (Rational order).**
For \([(a,b)],[(c,d)]\in\mathbb Q\), define
\[
[(a,b)]<[(c,d)]
\quad\Longleftrightarrow\quad
ad<bc.
\]

**Theorem 3.2 (Well-definedness of rational order).**
The inequality \(ad<bc\) is independent of representatives.

**Theorem 3.3 (Strict total order).**
The relation \(<\) is a strict total order on \(\mathbb Q\).

**Theorem 3.4 (Ordered-field compatibility).**
For all \(x,y,z\in\mathbb Q\),
\[
x<y\implies x+z<y+z,
\]
and for all \(x,y\in\mathbb Q\),
\[
0<x\text{ and }0<y\implies0<xy.
\]

**Theorem 3.5 (Ordered-field structure).**
The rational numbers form an ordered field.

## 4. Embedding of \(\mathbb Z\)

**Definition 4.1 (Integer embedding).**
Define \(\iota:\mathbb Z\to\mathbb Q\) by
\[
\iota(z):=[(z,1)].
\]

**Theorem 4.2 (Embedding properties).**
The map \(\iota\) is an ordered-field embedding of the ordered ring \(\mathbb Z\) into \(\mathbb Q\).

**Normalization notes.** After this theorem, the embedded integers may be identified notationally with their images when no ambiguity results.

## 5. Reduced Fractions

**Definition 5.1 (Reduced fraction).**
A representative \((a,b)\in\mathbb Z\times\mathbb N\) is reduced if
\[
\gcd(|a|,b)=1.
\]

**Theorem 5.2 (Existence of reduced representatives).**
Every rational number has a reduced representative.

**Theorem 5.3 (Uniqueness of reduced representatives).**
If \((a,b)\) and \((c,d)\) are reduced representatives of the same rational number, then \(a=c\) and \(b=d\).

**Corollary 5.4 (Unique lowest-term form).**
Every rational number has a unique expression
\[
\frac ab
\]
with \(a\in\mathbb Z\), \(b\in\mathbb N\), and \(\gcd(|a|,b)=1\).

## 6. Density and Archimedean Properties

**Theorem 6.1 (Density of \(\mathbb Q\)).**
If \(x,y\in\mathbb Q\) and \(x<y\), then there exists \(q\in\mathbb Q\) such that
\[
x<q<y.
\]

**Theorem 6.2 (Archimedean property of \(\mathbb Q\)).**
For every \(q\in\mathbb Q\), there exists \(n\in\mathbb N\) such that
\[
q<n.
\]

**Corollary 6.3 (Integer-part bounds in \(\mathbb Q\)).**
For every \(q\in\mathbb Q\), there exists \(z\in\mathbb Z\) such that
\[
z\le q<z+1.
\]

## 7. Failure of Completeness

**Definition 7.1 (The rational square-root cut for \(2\)).**
Define
\[
A:=\{q\in\mathbb Q:q<0\text{ or }q^2<2\}.
\]

**Theorem 7.2 (The set \(A\) is nonempty and bounded above).**
The subset \(A\subseteq\mathbb Q\) is nonempty and bounded above in \(\mathbb Q\).

**Theorem 7.3 (No rational squares to \(2\)).**
There is no \(q\in\mathbb Q\) such that
\[
q^2=2.
\]

**Theorem 7.4 (Failure of the least-upper-bound property).**
The set \(A\) has no supremum in \(\mathbb Q\).

**Corollary 7.5 (Incompleteness of \(\mathbb Q\)).**
The ordered field \(\mathbb Q\) does not have the least-upper-bound property.

## 8. Final Structural Summary

**Theorem 8.1 (Structure of the rationals).**
The rational numbers form a countable, dense, Archimedean ordered field that is not order-complete.


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
