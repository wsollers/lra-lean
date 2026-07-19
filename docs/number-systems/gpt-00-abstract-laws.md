# Part 0 — Abstract Algebraic and Order Laws

## 0. Purpose

This document records the reusable definitions and theorems needed throughout the construction of the standard number systems. It contains only abstract algebraic, relational, order-theoretic, and transport results. Concrete representation theorems, floor and ceiling, and exponentiation belong in later number-system documents.

Each numbered item is intended to become a rigorous mathematical block. Instructional material appears only under **Dependencies**, **Proof obligations**, and **Normalization notes**.

## 1. Operations and Relations

**Definition 1.1 (Binary operation).**
Let \(X\) be a nonempty set. A binary operation on \(X\) is a function \(\ast:X\times X\to X\).

**Definition 1.2 (Binary relation).**
Let \(X\) be a set. A binary relation on \(X\) is a subset \(R\subseteq X\times X\). For \(a,b\in X\), write \(aRb\) when \((a,b)\in R\).

## 2. Laws for One Operation

**Definition 2.1 (Commutative operation).**
Let \(\ast\) be a binary operation on \(X\). The operation \(\ast\) is commutative if
\[
a\ast b=b\ast a
\]
for all \(a,b\in X\).

**Definition 2.2 (Associative operation).**
Let \(\ast\) be a binary operation on \(X\). The operation \(\ast\) is associative if
\[
(a\ast b)\ast c=a\ast(b\ast c)
\]
for all \(a,b,c\in X\).

**Definition 2.3 (Identity element).**
Let \(\ast\) be a binary operation on \(X\). An element \(e\in X\) is an identity element for \(\ast\) if
\[
e\ast a=a=a\ast e
\]
for every \(a\in X\).

**Theorem 2.4 (Uniqueness of the identity element).**
Let \(\ast\) be a binary operation on \(X\). If \(e,f\in X\) are identity elements for \(\ast\), then \(e=f\).

**Dependencies.** Definition 2.3.

**Proof obligations.** Show \(e=e\ast f=f\).

**Definition 2.5 (Inverse element).**
Suppose \(\ast\) is a binary operation on \(X\) with identity element \(e\). Let \(a\in X\). An element \(b\in X\) is an inverse of \(a\) with respect to \(\ast\) if
\[
a\ast b=e=b\ast a.
\]

**Theorem 2.6 (Uniqueness of inverses).**
Suppose \(\ast\) is associative and has identity element \(e\). If \(b,c\in X\) are inverses of \(a\in X\), then \(b=c\).

**Dependencies.** Definitions 2.2, 2.3, and 2.5.

**Proof obligations.** Compute \(b=b\ast e=b\ast(a\ast c)=(b\ast a)\ast c=e\ast c=c\).

**Definition 2.7 (Left and right cancellation).**
Let \(\ast\) be a binary operation on \(X\). The operation has the left cancellation property if
\[
a\ast b=a\ast c\implies b=c
\]
for all \(a,b,c\in X\). It has the right cancellation property if
\[
b\ast a=c\ast a\implies b=c
\]
for all \(a,b,c\in X\). It is cancellative if it has both properties.

**Theorem 2.8 (Invertibility implies cancellation).**
Suppose \(\ast\) is associative and has an identity element. If \(a\in X\) has an inverse, then left and right multiplication by \(a\) are injective. Thus
\[
a\ast b=a\ast c\implies b=c
\]
and
\[
b\ast a=c\ast a\implies b=c
\]
for all \(b,c\in X\).

## 3. Two Interacting Operations

**Definition 3.1 (Left distributivity).**
Let \(+\) and \(\cdot\) be binary operations on \(X\). Multiplication is left-distributive over addition if
\[
a\cdot(b+c)=a\cdot b+a\cdot c
\]
for all \(a,b,c\in X\).

**Definition 3.2 (Right distributivity).**
Multiplication is right-distributive over addition if
\[
(a+b)\cdot c=a\cdot c+b\cdot c
\]
for all \(a,b,c\in X\).

**Definition 3.3 (Absorbing element).**
Let \(\cdot\) be a binary operation on \(X\). An element \(z\in X\) is absorbing for multiplication if
\[
z\cdot a=z=a\cdot z
\]
for every \(a\in X\).

**Theorem 3.4 (The additive identity is multiplicatively absorbing).**
Let \(X\) be equipped with binary operations \(+\) and \(\cdot\). Suppose \((X,+)\) is a group with identity element \(0\), and suppose multiplication distributes over addition on both sides. Then
\[
a\cdot0=0=0\cdot a
\]
for every \(a\in X\).

**Dependencies.** Group structure and Definitions 3.1–3.3.

**Proof obligations.** From \(a\cdot0=a\cdot(0+0)=a\cdot0+a\cdot0\), cancel \(a\cdot0\) additively. Repeat on the other side.

**Normalization notes.** Do not assume associativity of multiplication; it is unnecessary. Do not state the result under distributivity alone; additive cancellation is essential.

## 4. Order Relations

**Definition 4.1 (Strict partial order).**
A binary relation \(<\) on \(X\) is a strict partial order if it is irreflexive and transitive.

**Definition 4.2 (Strict total order).**
A strict partial order \(<\) on \(X\) is a strict total order if, for all \(a,b\in X\), exactly one of
\[
a<b,\qquad a=b,\qquad b<a
\]
holds.

**Definition 4.3 (Non-strict order induced by a strict total order).**
Let \(<\) be a strict total order on \(X\). For \(a,b\in X\), define
\[
a\le b\quad\Longleftrightarrow\quad a<b\text{ or }a=b.
\]

**Theorem 4.4 (Properties of the induced non-strict order).**
The relation \(\le\) induced by a strict total order is reflexive, antisymmetric, transitive, and total. Moreover,
\[
a<b\quad\Longleftrightarrow\quad a\le b\text{ and }a\ne b.
\]

**Definition 4.5 (Strict order induced by a non-strict total order).**
Let \(\le\) be a total order on \(X\). Define
\[
a<b\quad\Longleftrightarrow\quad a\le b\text{ and }a\ne b.
\]

**Theorem 4.6 (Equivalence of strict and non-strict presentations).**
Passing from a strict total order to its induced non-strict order and then back to a strict order recovers the original strict order. Passing from a total order to its induced strict order and then back to a non-strict order recovers the original total order.

**Definition 4.7 (Translation invariance).**
Let \(+\) be a binary operation on \(X\), and let \(<\) be a strict total order on \(X\). The order is translation-invariant if
\[
a<b\implies a+c<b+c
\]
for all \(a,b,c\in X\).

**Theorem 4.8 (Translation reflection in an ordered group).**
Let \((G,+)\) be a group equipped with a translation-invariant strict total order. Then
\[
a<b\quad\Longleftrightarrow\quad a+c<b+c
\]
for all \(a,b,c\in G\).

**Definition 4.9 (Order isomorphism).**
Let \((X,<_{X})\) and \((Y,<_{Y})\) be strictly totally ordered sets. An order isomorphism from \(X\) to \(Y\) is a bijection \(f:X\to Y\) such that
\[
x_1<_{X}x_2\quad\Longleftrightarrow\quad f(x_1)<_{Y}f(x_2)
\]
for all \(x_1,x_2\in X\).

## 5. Bounds and Completeness

**Definition 5.1 (Upper bound).**
Let \((S,\le)\) be an ordered set, let \(A\subseteq S\), and let \(u\in S\). The element \(u\) is an upper bound of \(A\) if
\[
a\le u
\]
for every \(a\in A\).

**Definition 5.2 (Lower bound).**
Let \((S,\le)\) be an ordered set, let \(A\subseteq S\), and let \(\ell\in S\). The element \(\ell\) is a lower bound of \(A\) if
\[
\ell\le a
\]
for every \(a\in A\).

**Definition 5.3 (Bounded above and bounded below).**
A subset \(A\subseteq S\) is bounded above if it has an upper bound in \(S\), and it is bounded below if it has a lower bound in \(S\).

**Definition 5.4 (Maximum and minimum).**
Let \(A\subseteq S\). An element \(m\in A\) is a maximum of \(A\) if \(a\le m\) for every \(a\in A\). An element \(n\in A\) is a minimum of \(A\) if \(n\le a\) for every \(a\in A\).

**Definition 5.5 (Supremum).**
Let \(A\subseteq S\). An element \(s\in S\) is the supremum of \(A\) if \(s\) is an upper bound of \(A\) and \(s\le u\) for every upper bound \(u\) of \(A\).

**Definition 5.6 (Infimum).**
Let \(A\subseteq S\). An element \(t\in S\) is the infimum of \(A\) if \(t\) is a lower bound of \(A\) and \(\ell\le t\) for every lower bound \(\ell\) of \(A\).

**Theorem 5.7 (Uniqueness of supremum and infimum).**
A subset of an ordered set has at most one supremum and at most one infimum.

**Definition 5.8 (Least-upper-bound property).**
An ordered set \((S,\le)\) has the least-upper-bound property if every nonempty subset of \(S\) that is bounded above has a supremum in \(S\).

**Definition 5.9 (Greatest-lower-bound property).**
An ordered set \((S,\le)\) has the greatest-lower-bound property if every nonempty subset of \(S\) that is bounded below has an infimum in \(S\).

**Theorem 5.10 (Order duality of completeness).**
A linearly ordered set has the least-upper-bound property if and only if it has the greatest-lower-bound property.

**Theorem 5.11 (Order isomorphisms preserve suprema).**
Let \(f:X\to Y\) be an order isomorphism. If \(A\subseteq X\) has supremum \(s\in X\), then \(f(A)\) has supremum \(f(s)\) in \(Y\).

**Corollary 5.12 (Order isomorphisms preserve order completeness).**
If \(f:X\to Y\) is an order isomorphism and \(X\) has the least-upper-bound property, then \(Y\) has the least-upper-bound property.

## 6. Named Algebraic Structures

**Definition 6.1 (Magma).**
A magma is a nonempty set equipped with a binary operation.

**Definition 6.2 (Semigroup).**
A semigroup is a magma whose operation is associative.

**Definition 6.3 (Monoid).**
A monoid is a semigroup with an identity element.

**Definition 6.4 (Group).**
A group is a monoid in which every element has an inverse.

**Definition 6.5 (Abelian group).**
An abelian group is a group whose operation is commutative.

**Definition 6.6 (Semiring).**
A semiring is a structure \((S,+,\cdot,0,1)\) such that \((S,+,0)\) is a commutative monoid, \((S,\cdot,1)\) is a monoid, multiplication distributes over addition on both sides, and \(0\) is absorbing for multiplication.

**Definition 6.7 (Commutative semiring).**
A commutative semiring is a semiring whose multiplication is commutative.

**Definition 6.8 (Ring).**
A ring is a structure \((R,+,\cdot,0)\) such that \((R,+,0)\) is an abelian group, multiplication is associative, and multiplication distributes over addition on both sides.

**Definition 6.9 (Ring with unity).**
A ring with unity is a ring whose multiplication has an identity element \(1\).

**Definition 6.10 (Commutative ring).**
A commutative ring is a ring whose multiplication is commutative.

**Definition 6.11 (Integral domain).**
An integral domain is a nontrivial commutative ring with unity in which
\[
ab=0\implies a=0\text{ or }b=0.
\]

**Definition 6.12 (Field).**
A field is a nontrivial commutative ring with unity in which every nonzero element has a multiplicative inverse.

**Definition 6.13 (Ordered abelian group).**
An ordered abelian group is an abelian group \((G,+,0)\) equipped with a translation-invariant strict total order.

**Definition 6.14 (Ordered ring).**
An ordered ring is a ring \((R,+,\cdot,0)\) equipped with a strict total order \(<\) such that
\[
a<b\implies a+c<b+c
\]
for all \(a,b,c\in R\), and
\[
0<a\text{ and }0<b\implies0<ab
\]
for all \(a,b\in R\).

**Definition 6.15 (Ordered field).**
An ordered field is a field equipped with an order that makes it an ordered ring.

**Definition 6.16 (Complete ordered field).**
A complete ordered field is an ordered field whose underlying order has the least-upper-bound property.

## 7. Standard Ordered-Ring Consequences

**Theorem 7.1 (Squares are nonnegative).**
Let \(R\) be an ordered ring. Then \(a^2\ge0\) for every \(a\in R\).

**Theorem 7.2 (A square is zero only at zero in an ordered integral domain).**
Let \(R\) be an ordered integral domain. Then
\[
a^2=0\quad\Longleftrightarrow\quad a=0.
\]
Consequently, \(a\ne0\) implies \(a^2>0\).

**Theorem 7.3 (Multiplication by a positive element preserves order).**
Let \(R\) be an ordered ring. If \(a<b\) and \(0<c\), then \(ac<bc\) and \(ca<cb\).

**Theorem 7.4 (Multiplication by a negative element reverses order).**
Let \(R\) be an ordered ring. If \(a<b\) and \(c<0\), then \(bc<ac\) and \(cb<ca\).

**Theorem 7.5 (A field containing a square root of \(-1\) is not orderable).**
Let \(F\) be a field. If there exists \(u\in F\) such that \(u^2=-1\), then no strict total order on \(F\) makes \(F\) an ordered field.

## 8. Homomorphisms, Embeddings, and Transport

**Definition 8.1 (Monoid homomorphism).**
Let \((M,\ast,e_M)\) and \((N,\diamond,e_N)\) be monoids. A monoid homomorphism is a function \(f:M\to N\) such that
\[
f(a\ast b)=f(a)\diamond f(b)
\]
for all \(a,b\in M\), and \(f(e_M)=e_N\).

**Definition 8.2 (Ring homomorphism).**
Let \(R\) and \(S\) be rings with unity. A ring homomorphism is a function \(f:R\to S\) preserving addition, multiplication, zero, and one.

**Definition 8.3 (Field embedding).**
A field embedding is an injective field homomorphism.

**Definition 8.4 (Ordered-field embedding).**
An ordered-field embedding is a field embedding that preserves and reflects strict order.

**Theorem 8.5 (Isomorphisms transport algebraic laws).**
Let \(f:X\to Y\) be a bijection that transports one or more operations on \(X\) to corresponding operations on \(Y\). Any equation expressible solely in those operations and constants holds in \(X\) if and only if its transported equation holds in \(Y\).

**Normalization notes.** State precise specializations when used. Do not cite this theorem as a substitute for proving that the proposed transport map is bijective and operation-preserving.

## 9. Structural Roadmap

- \((\mathbb N,+)\) will be a commutative cancellative semigroup.
- \((\mathbb N,\cdot,1)\) will be a commutative monoid.
- \((\mathbb W,+,\cdot,0,1)\) will be a commutative semiring.
- \((\mathbb Z,+,\cdot,0,1,<)\) will be a discretely ordered integral domain.
- \((\mathbb Q,+,\cdot,0,1,<)\) will be an Archimedean ordered field that is not complete.
- Every accepted construction of \(\mathbb R\) will produce a complete Archimedean ordered field.
- \(\overline{\mathbb R}\) will be a complete linear order with partially defined arithmetic, not a field.
- \(\mathbb C\) will be an algebraically closed field that admits no compatible total order.


---

# Part XI. Quotient Structures and Representative Independence

## 11.1 Quotient preliminaries

**Definition 11.1 (Quotient set).**
Let \(A\) be a set and let \(\sim\) be an equivalence relation on \(A\).
For \(a\in A\), write
\[
[a]:=\{x\in A:x\sim a\}.
\]
The quotient set of \(A\) by \(\sim\) is
\[
A/{\sim}:=\{[a]:a\in A\}.
\]

**Definition 11.2 (Canonical projection).**
The canonical projection is the function
\[
\pi:A\to A/{\sim},
\qquad
\pi(a):=[a].
\]

**Proposition 11.3 (Classes agree exactly for equivalent representatives).**
For all \(a,b\in A\),
\[
[a]=[b]
\quad\Longleftrightarrow\quad
a\sim b.
\]

**Proposition 11.4 (Canonical projection identifies equivalence classes).**
For all \(a,b\in A\),
\[
\pi(a)=\pi(b)
\quad\Longleftrightarrow\quad
a\sim b.
\]

---

## 11.2 Binary operations

**Definition 11.5 (Operation respects an equivalence relation).**
Let \(O:A\times A\to A\) be a binary operation. The operation \(O\) respects
\(\sim\) if, for all \(a,a',b,b'\in A\),
\[
a\sim a'
\text{ and }
b\sim b'
\quad\Longrightarrow\quad
O(a,b)\sim O(a',b').
\]

**Definition 11.6 (Left and right respect).**
The operation \(O\) respects \(\sim\) in its first argument if
\[
a\sim a'
\quad\Longrightarrow\quad
O(a,b)\sim O(a',b)
\]
for all \(a,a',b\in A\).

The operation \(O\) respects \(\sim\) in its second argument if
\[
b\sim b'
\quad\Longrightarrow\quad
O(a,b)\sim O(a,b')
\]
for all \(a,b,b'\in A\).

**Lemma 11.7 (Respect splits by argument).**
A binary operation \(O\) respects \(\sim\) if and only if it respects \(\sim\)
in each argument separately.

**Proof obligations.**
For the nontrivial direction, use
\[
O(a,b)\sim O(a',b)\sim O(a',b')
\]
and transitivity of \(\sim\).

**Corollary 11.8 (Commutative one-sided criterion).**
Suppose \(O\) is commutative. If \(O\) respects \(\sim\) in one argument, then
it respects \(\sim\) in both arguments and therefore respects \(\sim\).

**Theorem 11.9 (Induced binary operation on a quotient).**
If \(O:A\times A\to A\) respects \(\sim\), then
\[
[a]\mathbin{\overline O}[b]:=[O(a,b)]
\]
defines a unique binary operation
\[
\overline O:(A/{\sim})\times(A/{\sim})\to A/{\sim}
\]
satisfying
\[
\pi(O(a,b))
=
\overline O(\pi(a),\pi(b))
\]
for all \(a,b\in A\).

**Normalization notes.**
Construction files should not begin by defining an operation directly on classes.
They should first:

1. define the raw operation on representatives;
2. prove left and right respect, or use the commutative one-sided criterion;
3. invoke Theorem 11.9 to obtain the quotient operation.

---

## 11.3 Unary operations

**Definition 11.10 (Unary operation respects an equivalence relation).**
Let \(f:A\to A\). The function \(f\) respects \(\sim\) if
\[
a\sim a'
\quad\Longrightarrow\quad
f(a)\sim f(a')
\]
for all \(a,a'\in A\).

**Theorem 11.11 (Induced unary operation on a quotient).**
If \(f:A\to A\) respects \(\sim\), then
\[
\overline f([a]):=[f(a)]
\]
defines a unique function
\[
\overline f:A/{\sim}\to A/{\sim}
\]
satisfying
\[
\pi(f(a))=\overline f(\pi(a))
\]
for every \(a\in A\).

---

## 11.4 Predicates and relations

**Definition 11.12 (Predicate respects an equivalence relation).**
Let \(P\) be a predicate on \(A\). The predicate \(P\) respects \(\sim\) if
\[
a\sim a'
\quad\Longrightarrow\quad
\bigl(P(a)\Longleftrightarrow P(a')\bigr).
\]

**Theorem 11.13 (Induced predicate on a quotient).**
If \(P\) respects \(\sim\), then
\[
\overline P([a])
\quad\Longleftrightarrow\quad
P(a)
\]
defines a predicate on \(A/{\sim}\).

**Definition 11.14 (Relation respects an equivalence relation).**
Let \(R\) be a binary relation on \(A\). The relation \(R\) respects \(\sim\) if
\[
a\sim a'
\text{ and }
b\sim b'
\quad\Longrightarrow\quad
\bigl(R(a,b)\Longleftrightarrow R(a',b')\bigr).
\]

**Theorem 11.15 (Induced relation on a quotient).**
If \(R\) respects \(\sim\), then
\[
\overline R([a],[b])
\quad\Longleftrightarrow\quad
R(a,b)
\]
defines a binary relation on \(A/{\sim}\).

---

## 11.5 General finite-arity form

**Theorem 11.16 (Coordinatewise compatibility induces an \(n\)-ary quotient operation).**
Let \(n\in\mathbb N\), and let \(F:A^n\to A\). Suppose that replacing any one
coordinate by an equivalent representative, while holding the remaining
coordinates fixed, produces an equivalent output. Then \(F\) induces a unique
function
\[
\overline F:(A/{\sim})^n\to A/{\sim}
\]
such that
\[
\overline F([a_1],\ldots,[a_n])
=
[F(a_1,\ldots,a_n)].
\]

**Proof obligations.**
Replace the coordinates one at a time and apply transitivity.
