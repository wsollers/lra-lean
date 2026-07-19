# Part 5 — The Integers \(\mathbb Z\)

## 0. Purpose

The integers are constructed as equivalence classes of ordered pairs of whole numbers. The pair \((a,b)\) represents the formal difference \(a-b\). Every operation and relation defined on equivalence classes requires a separate well-definedness theorem.

## 1. Construction by Formal Differences

**Definition 1.1 (Integer-pair equivalence relation).**
For \((a,b),(c,d)\in\mathbb W\times\mathbb W\), define
\[
(a,b)\sim(c,d)
\quad\Longleftrightarrow\quad
 a+d=b+c.
\]

**Theorem 1.2 (The integer-pair relation is an equivalence relation).**
The relation \(\sim\) is reflexive, symmetric, and transitive on \(\mathbb W\times\mathbb W\).

**Definition 1.3 (Integers).**
Define
\[
\mathbb Z:=(\mathbb W\times\mathbb W)/\!\sim.
\]
For \((a,b)\in\mathbb W\times\mathbb W\), denote its equivalence class by \([(a,b)]\).

**Normalization notes.** Do not use \(a-b\) as literal subtraction until a theorem has licensed that notation.

## 2. Addition and Additive Inverses

**Definition 2.1 (Integer addition).**
For \([(a,b)],[(c,d)]\in\mathbb Z\), define
\[
[(a,b)]+[(c,d)]:=[(a+c,b+d)].
\]

**Theorem 2.2 (Well-definedness of integer addition).**
If \((a,b)\sim(a',b')\) and \((c,d)\sim(c',d')\), then
\[
(a+c,b+d)\sim(a'+c',b'+d').
\]
Hence Definition 2.1 is independent of representatives.

**Definition 2.3 (Zero integer).**
Define
\[
0_{\mathbb Z}:=[(0,0)].
\]

**Definition 2.4 (Additive inverse).**
For \([(a,b)]\in\mathbb Z\), define
\[
-[(a,b)]:=[(b,a)].
\]

**Theorem 2.5 (Well-definedness of additive inverse).**
If \((a,b)\sim(c,d)\), then \((b,a)\sim(d,c)\).

**Theorem 2.6 (Additive group laws).**
Integer addition is associative and commutative, \(0_{\mathbb Z}\) is its identity, and every integer \(z\) satisfies
\[
z+(-z)=0_{\mathbb Z}=(-z)+z.
\]

**Theorem 2.7 (Additive structure of the integers).**
The structure \((\mathbb Z,+,0_{\mathbb Z})\) is an abelian group.

**Definition 2.8 (Integer subtraction).**
For \(z,w\in\mathbb Z\), define
\[
z-w:=z+(-w).
\]

## 3. Multiplication

**Definition 3.1 (Integer multiplication).**
For \([(a,b)],[(c,d)]\in\mathbb Z\), define
\[
[(a,b)]\cdot[(c,d)]:=[(ac+bd,ad+bc)].
\]

**Theorem 3.2 (Well-definedness of integer multiplication).**
If \((a,b)\sim(a',b')\) and \((c,d)\sim(c',d')\), then
\[
(ac+bd,ad+bc)\sim(a'c'+b'd',a'd'+b'c').
\]

**Definition 3.3 (One integer).**
Define
\[
1_{\mathbb Z}:=[(1,0)].
\]

**Theorem 3.4 (Multiplicative laws).**
Integer multiplication is associative and commutative, \(1_{\mathbb Z}\) is its identity, and multiplication distributes over addition on both sides.

**Theorem 3.5 (Zero is absorbing).**
For every \(z\in\mathbb Z\),
\[
z0_{\mathbb Z}=0_{\mathbb Z}=0_{\mathbb Z}z.
\]

**Theorem 3.6 (No zero divisors).**
For all \(z,w\in\mathbb Z\),
\[
zw=0_{\mathbb Z}\implies z=0_{\mathbb Z}\text{ or }w=0_{\mathbb Z}.
\]

**Corollary 3.7 (Multiplicative cancellation).**
If \(a,b,c\in\mathbb Z\), \(a\ne0_{\mathbb Z}\), and \(ab=ac\), then \(b=c\).

## 4. Order

**Definition 4.1 (Integer order).**
For \([(a,b)],[(c,d)]\in\mathbb Z\), define
\[
[(a,b)]<[(c,d)]
\quad\Longleftrightarrow\quad
 a+d<b+c.
\]

**Theorem 4.2 (Well-definedness of integer order).**
The truth of \(a+d<b+c\) is independent of the representatives chosen for the two equivalence classes.

**Theorem 4.3 (Strict total order).**
The relation \(<\) is a strict total order on \(\mathbb Z\).

**Theorem 4.4 (Translation invariance).**
For all \(x,y,z\in\mathbb Z\),
\[
x<y\quad\Longleftrightarrow\quad x+z<y+z.
\]

**Theorem 4.5 (Positive products are positive).**
For all \(x,y\in\mathbb Z\),
\[
0<x\text{ and }0<y\implies0<xy.
\]

**Theorem 4.6 (Discrete order).**
For every \(z\in\mathbb Z\), there is no integer \(w\) satisfying
\[
z<w<z+1_{\mathbb Z}.
\]

## 5. Embedding of \(\mathbb W\)

**Definition 5.1 (Whole-number embedding).**
Define \(\iota:\mathbb W\to\mathbb Z\) by
\[
\iota(n):=[(n,0)].
\]

**Theorem 5.2 (Embedding properties).**
The map \(\iota\) is injective and preserves zero, one, addition, multiplication, and order.

**Theorem 5.3 (Image of the whole numbers).**
An integer \(z\) belongs to \(\iota(\mathbb W)\) if and only if \(0_{\mathbb Z}\le z\).

**Theorem 5.4 (Canonical sign decomposition).**
For every \(z\in\mathbb Z\), exactly one of the following holds:

1. \(z=0_{\mathbb Z}\);
2. there exists a unique \(n\in\mathbb N\) such that \(z=\iota(n)\);
3. there exists a unique \(n\in\mathbb N\) such that \(z=-\iota(n)\).

**Definition 5.5 (Absolute value on \(\mathbb Z\)).**
For \(z\in\mathbb Z\), define
\[
|z|:=
\begin{cases}
z,&0\le z,\\
-z,&z<0.
\end{cases}
\]

## 6. Euclidean Division on Integers

**Theorem 6.1 (Integer division algorithm).**
Let \(a,b\in\mathbb Z\) with \(b\ne0\). There exist unique \(q,r\in\mathbb Z\) such that
\[
a=bq+r
\]
and
\[
0\le r<|b|.
\]

## 7. Final Structural Summary

**Theorem 7.1 (Structure of the integers).**
The structure
\[
(\mathbb Z,+,\cdot,0_{\mathbb Z},1_{\mathbb Z},<)
\]
is a discretely ordered integral domain, and \(\mathbb W\) is isomorphic to its nonnegative cone.


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
