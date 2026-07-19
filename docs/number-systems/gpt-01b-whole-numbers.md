# Part 2 — The Whole Numbers \(\mathbb W\)

## 0. Purpose

The whole numbers are obtained from the one-based natural numbers by adjoining an additive identity. This document must distinguish the new element \(0\) from every element of \(\mathbb N\).

## 1. Construction

**Definition 1.1 (Whole numbers).**
Let \(0\) be an object not belonging to \(\mathbb N\). Define
\[
\mathbb W:=\mathbb N\cup\{0\}.
\]

**Theorem 1.2 (Basic decomposition).**
Every \(w\in\mathbb W\) satisfies exactly one of the alternatives \(w=0\) or \(w\in\mathbb N\).

## 2. Successor and Induction

**Definition 2.1 (Successor on \(\mathbb W\)).**
Define \(S_{\mathbb W}:\mathbb W\to\mathbb W\) by
\[
S_{\mathbb W}(0)=1
\]
and
\[
S_{\mathbb W}(n)=S(n)
\]
for every \(n\in\mathbb N\).

**Theorem 2.2 (Zero is not a successor).**
For every \(w\in\mathbb W\),
\[
S_{\mathbb W}(w)\ne0.
\]

**Theorem 2.3 (Injectivity of successor on \(\mathbb W\)).**
For all \(u,v\in\mathbb W\),
\[
S_{\mathbb W}(u)=S_{\mathbb W}(v)\implies u=v.
\]

**Theorem 2.4 (Induction from zero).**
Let \(K\subseteq\mathbb W\). If \(0\in K\) and
\[
w\in K\implies S_{\mathbb W}(w)\in K
\]
for every \(w\in\mathbb W\), then \(K=\mathbb W\).

**Corollary 2.5 (Strong induction on \(\mathbb W\)).**
The usual strong-induction principle holds for properties indexed by \(\mathbb W\).

## 3. Addition

**Definition 3.1 (Addition on \(\mathbb W\)).**
For \(m,n\in\mathbb N\), retain their natural-number sum. Define
\[
0+w=w=w+0
\]
for every \(w\in\mathbb W\).

**Theorem 3.2 (Addition is a binary operation).**
For all \(u,v\in\mathbb W\), the sum \(u+v\) belongs to \(\mathbb W\).

**Theorem 3.3 (Associativity and commutativity of addition).**
For all \(u,v,w\in\mathbb W\),
\[
(u+v)+w=u+(v+w)
\]
and
\[
u+v=v+u.
\]

**Theorem 3.4 (Additive identity).**
For every \(w\in\mathbb W\),
\[
0+w=w=w+0.
\]

**Theorem 3.5 (Additive cancellation).**
For all \(a,b,c\in\mathbb W\),
\[
a+b=a+c\implies b=c.
\]

**Theorem 3.6 (Additive structure).**
The structure \((\mathbb W,+,0)\) is a commutative cancellative monoid.

## 4. Multiplication

**Definition 4.1 (Multiplication on \(\mathbb W\)).**
For \(m,n\in\mathbb N\), retain their natural-number product. Define
\[
0\cdot w=0=w\cdot0
\]
for every \(w\in\mathbb W\).

**Theorem 4.2 (Multiplication is a binary operation).**
For all \(u,v\in\mathbb W\), the product \(uv\) belongs to \(\mathbb W\).

**Theorem 4.3 (Associativity and commutativity of multiplication).**
For all \(u,v,w\in\mathbb W\),
\[
(uv)w=u(vw)
\]
and
\[
uv=vu.
\]

**Theorem 4.4 (Multiplicative identity).**
For every \(w\in\mathbb W\),
\[
1w=w=w1.
\]

**Theorem 4.5 (Zero is absorbing).**
For every \(w\in\mathbb W\),
\[
0w=0=w0.
\]

**Theorem 4.6 (Distributivity).**
For all \(a,b,c\in\mathbb W\),
\[
a(b+c)=ab+ac
\]
and
\[
(a+b)c=ac+bc.
\]

**Theorem 4.7 (No zero divisors).**
For all \(a,b\in\mathbb W\),
\[
ab=0\implies a=0\text{ or }b=0.
\]

**Theorem 4.8 (Multiplicative cancellation away from zero).**
For all \(a,b,c\in\mathbb W\), if \(a\ne0\) and \(ab=ac\), then \(b=c\).

**Theorem 4.9 (Semiring structure).**
The structure \((\mathbb W,+,\cdot,0,1)\) is a nontrivial commutative semiring with no zero divisors.

## 5. Order

**Definition 5.1 (Order on \(\mathbb W\)).**
For \(u,v\in\mathbb W\), define
\[
u<v\quad\Longleftrightarrow\quad \exists k\in\mathbb N\;(u+k=v).
\]
Define \(u\le v\) by \(u<v\) or \(u=v\).

**Theorem 5.2 (Strict total order).**
The relation \(<\) is a strict total order on \(\mathbb W\).

**Theorem 5.3 (Zero is least).**
For every \(w\in\mathbb W\),
\[
0\le w.
\]

**Theorem 5.4 (Discrete successor order).**
For every \(w\in\mathbb W\),
\[
w<S_{\mathbb W}(w),
\]
and no whole number lies strictly between them.

**Theorem 5.5 (Compatibility with addition).**
For all \(a,b,c\in\mathbb W\),
\[
a<b\quad\Longleftrightarrow\quad a+c<b+c.
\]

**Theorem 5.6 (Compatibility with positive multiplication).**
For all \(a,b,c\in\mathbb W\), if \(c\ne0\), then
\[
a<b\quad\Longleftrightarrow\quad ac<bc.
\]

**Theorem 5.7 (Well-ordering).**
Every nonempty subset of \(\mathbb W\) has a least element.

## 6. Embedding of \(\mathbb N\)

**Definition 6.1 (Natural-number embedding).**
Let \(\iota:\mathbb N\to\mathbb W\) be the inclusion map \(\iota(n)=n\).

**Theorem 6.2 (Structure preservation).**
The map \(\iota\) is injective and preserves addition, multiplication, successor, and strict order.

**Theorem 6.3 (Image characterization).**
The image of \(\iota\) is \(\mathbb W\setminus\{0\}\).

## 7. Final Structural Summary

**Theorem 7.1 (Structure of the whole numbers).**
The structure \((\mathbb W,+,\cdot,0,1,<)\) is a discretely ordered commutative semiring with no zero divisors, and \(\mathbb N\) is isomorphic to its positive part \(\mathbb W\setminus\{0\}\).
