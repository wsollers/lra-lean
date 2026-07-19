# Part 1 — The One-Based Natural Numbers \(\mathbb N\)

## 0. Purpose

This document develops arithmetic from an abstract one-based Peano system. The distinguished first element is \(1\), and \(0\notin\mathbb N\). The whole numbers \(\mathbb W\) are constructed separately by adjoining zero.

## 1. One-Based Peano Systems

**Definition 1.1 (One-based Peano system).**
A one-based Peano system is a triple \((N,1,S)\) consisting of a nonempty set \(N\), a distinguished element \(1\in N\), and a function \(S:N\to N\) satisfying:

1. \(S(n)\ne1\) for every \(n\in N\);
2. \(S(m)=S(n)\implies m=n\) for all \(m,n\in N\);
3. if \(K\subseteq N\), \(1\in K\), and \(n\in K\implies S(n)\in K\), then \(K=N\).

**Normalization notes.** This is a full second-order induction axiom because it quantifies over all subsets \(K\subseteq N\).

**Definition 1.2 (The natural-number system).**
Fix a one-based Peano system \((\mathbb N,1,S)\). Its elements are called natural numbers.

**Theorem 1.3 (Categoricity under full second-order semantics).**
Any two one-based Peano systems are uniquely isomorphic by a bijection that sends the distinguished element of the first system to the distinguished element of the second and commutes with successor.

**Proof status.** Foundational theorem. Prove once or cite from the Peano-system development.

## 2. Structural Consequences of the Peano Axioms

**Theorem 2.1 (Every natural number is one or a successor).**
For every \(n\in\mathbb N\), either \(n=1\) or there exists \(m\in\mathbb N\) such that \(n=S(m)\).

**Theorem 2.2 (Existence of predecessors away from one).**
If \(n\in\mathbb N\) and \(n\ne1\), then there exists \(m\in\mathbb N\) such that \(S(m)=n\).

**Theorem 2.3 (Uniqueness of predecessors away from one).**
If \(S(m)=n=S(k)\), then \(m=k\). Hence every natural number other than \(1\) has a unique predecessor.

**Theorem 2.4 (No natural number is its own successor).**
For every \(n\in\mathbb N\), \(S(n)\ne n\).

**Theorem 2.5 (Successor has no finite cycles).**
For every \(n\in\mathbb N\) and every \(k\in\mathbb N\), the \(k\)-fold iterate \(S^k(n)\) is not equal to \(n\).

## 3. Recursion

**Theorem 3.1 (One-based recursion theorem).**
Let \(X\) be a set, let \(x_1\in X\), and let \(g:X\to X\). There exists a unique function \(f:\mathbb N\to X\) such that
\[
f(1)=x_1
\]
and
\[
f(S(n))=g(f(n))
\]
for every \(n\in\mathbb N\).

**Proof status.** Foundational theorem. Its status must match the minimal-iterator construction used elsewhere in the project.

## 4. Addition

**Definition 4.1 (Addition).**
For each \(m\in\mathbb N\), let \(A_m:\mathbb N\to\mathbb N\) be the unique function satisfying
\[
A_m(1)=S(m)
\]
and
\[
A_m(S(n))=S(A_m(n))
\]
for every \(n\in\mathbb N\). Define
\[
m+n:=A_m(n).
\]

**Theorem 4.2 (Addition base and recursion equations).**
For all \(m,n\in\mathbb N\),
\[
m+1=S(m)
\]
and
\[
m+S(n)=S(m+n).
\]

**Theorem 4.3 (Successor addition on the left).**
For all \(m,n\in\mathbb N\),
\[
S(m)+n=S(m+n).
\]

**Theorem 4.4 (Associativity of addition).**
For all \(a,b,c\in\mathbb N\),
\[
(a+b)+c=a+(b+c).
\]

**Theorem 4.5 (Commutativity of addition).**
For all \(a,b\in\mathbb N\),
\[
a+b=b+a.
\]

**Theorem 4.6 (Cancellation for addition).**
For all \(a,b,c\in\mathbb N\),
\[
a+b=a+c\implies b=c.
\]
Equivalently, by commutativity,
\[
b+a=c+a\implies b=c.
\]

**Theorem 4.7 (No additive identity in \(\mathbb N\)).**
There is no element \(e\in\mathbb N\) such that \(e+n=n=n+e\) for every \(n\in\mathbb N\).

**Theorem 4.8 (Additive structure of \(\mathbb N\)).**
The structure \((\mathbb N,+)\) is a commutative cancellative semigroup and is not a monoid.

## 5. Multiplication

**Definition 5.1 (Multiplication).**
For each \(m\in\mathbb N\), let \(M_m:\mathbb N\to\mathbb N\) be the unique function satisfying
\[
M_m(1)=m
\]
and
\[
M_m(S(n))=M_m(n)+m
\]
for every \(n\in\mathbb N\). Define
\[
m\cdot n:=M_m(n).
\]

**Theorem 5.2 (Multiplication base and recursion equations).**
For all \(m,n\in\mathbb N\),
\[
m\cdot1=m
\]
and
\[
m\cdot S(n)=m\cdot n+m.
\]

**Theorem 5.3 (Multiplication by a successor on the left).**
For all \(m,n\in\mathbb N\),
\[
S(m)\cdot n=m\cdot n+n.
\]

**Theorem 5.4 (Distributivity).**
For all \(a,b,c\in\mathbb N\),
\[
a(b+c)=ab+ac
\]
and
\[
(a+b)c=ac+bc.
\]

**Theorem 5.5 (Associativity of multiplication).**
For all \(a,b,c\in\mathbb N\),
\[
(ab)c=a(bc).
\]

**Theorem 5.6 (Commutativity of multiplication).**
For all \(a,b\in\mathbb N\),
\[
ab=ba.
\]

**Theorem 5.7 (Multiplicative identity).**
For every \(n\in\mathbb N\),
\[
1\cdot n=n=n\cdot1.
\]

**Theorem 5.8 (Cancellation for multiplication).**
For all \(a,b,c\in\mathbb N\),
\[
ab=ac\implies b=c.
\]

**Proof obligations.** Do not copy this formulation unchanged to \(\mathbb W\), \(\mathbb Z\), or \(\mathbb Q\); those systems require the hypothesis \(a\ne0\).

**Theorem 5.9 (Multiplicative structure of \(\mathbb N\)).**
The structure \((\mathbb N,\cdot,1)\) is a commutative cancellative monoid.

## 6. Order

**Definition 6.1 (Strict order by additive difference).**
For \(m,n\in\mathbb N\), define
\[
m<n\quad\Longleftrightarrow\quad \exists k\in\mathbb N\;(m+k=n).
\]

**Definition 6.2 (Non-strict order).**
For \(m,n\in\mathbb N\), define
\[
m\le n\quad\Longleftrightarrow\quad m<n\text{ or }m=n.
\]

**Theorem 6.3 (Strict total order).**
The relation \(<\) is a strict total order on \(\mathbb N\).

**Theorem 6.4 (One is the least natural number).**
For every \(n\in\mathbb N\),
\[
1\le n.
\]

**Theorem 6.5 (Successor is the immediate next element).**
For every \(n\in\mathbb N\),
\[
n<S(n),
\]
and there is no \(m\in\mathbb N\) such that
\[
n<m<S(n).
\]

**Theorem 6.6 (Order compatibility with addition).**
For all \(a,b,c\in\mathbb N\),
\[
a<b\quad\Longleftrightarrow\quad a+c<b+c.
\]

**Theorem 6.7 (Order compatibility with multiplication).**
For all \(a,b,c\in\mathbb N\),
\[
a<b\quad\Longleftrightarrow\quad ac<bc.
\]

**Theorem 6.8 (Well-ordering principle).**
Every nonempty subset of \(\mathbb N\) has a least element.

**Theorem 6.9 (Strong induction).**
Let \(P(n)\) be a property of natural numbers. Suppose that, for every \(n\in\mathbb N\), if \(P(k)\) holds for every \(k<n\), then \(P(n)\) holds. Then \(P(n)\) holds for every \(n\in\mathbb N\).

## 7. Final Structural Summary

**Theorem 7.1 (Arithmetic structure of the one-based natural numbers).**
The one-based natural numbers carry compatible addition, multiplication, and order such that:

1. \((\mathbb N,+)\) is a commutative cancellative semigroup without identity;
2. \((\mathbb N,\cdot,1)\) is a commutative cancellative monoid;
3. multiplication distributes over addition;
4. \((\mathbb N,<)\) is a discrete well-ordered set;
5. addition and multiplication preserve and reflect strict order.


---

# Parameterized Peano Iteration as the Default Operation-Construction Method

## P.1 Iterator data

**Definition P.1 (Iterator data).**
Let \((P,S,1)\) be a one-based Peano system. Let \(W\) be a set, let
\(c\in W\), and let \(g:W\to W\). The triple
\[
(W,c,g)
\]
is iterator data for \((P,S,1)\).

**Theorem P.2 (Peano Iterator Theorem).**
Let \((P,S,1)\) be a one-based Peano system and let \((W,c,g)\) be iterator
data. Then there exists a unique function
\[
f:P\to W
\]
such that
\[
f(1)=c
\]
and
\[
f(S(n))=g(f(n))
\]
for every \(n\in P\).

**Interpretation.**
The recursive clauses are a specification. The theorem supplies the existence,
totality, single-valuedness, and uniqueness needed to turn that specification
into a genuine definition.

---

## P.2 Parameterized iterator theorem

**Theorem P.3 (Parameterized Peano Iterator Theorem).**
Let \((P,S,1)\) be a one-based Peano system, let \(A\) and \(W\) be sets, let
\[
c:A\to W,
\]
and let
\[
G:A\times W\to W.
\]
Then there exists a unique function
\[
F:A\times P\to W
\]
such that, for every \(a\in A\) and \(n\in P\),
\[
F(a,1)=c(a)
\]
and
\[
F(a,S(n))=G(a,F(a,n)).
\]

**Proof obligations.**
For each fixed \(a\in A\), apply the Peano Iterator Theorem to the data
\[
(W,c(a),G_a),
\qquad
G_a(w):=G(a,w).
\]
Assemble the unique functions \(F_a:P\to W\) by
\[
F(a,n):=F_a(n).
\]
Prove uniqueness pointwise.

**Corollary P.4 (Construction of a binary operation by iteration).**
Let \((P,S,1)\) be a one-based Peano system. Suppose
\[
c:P\to P
\quad\text{and}\quad
G:P\times P\to P.
\]
Then there exists a unique binary operation
\[
\star:P\times P\to P
\]
such that
\[
a\star1=c(a)
\]
and
\[
a\star S(n)=G(a,a\star n)
\]
for all \(a,n\in P\).

---

## P.3 Standard operation templates

**Construction P.5 (Addition).**
Choose
\[
c(m)=S(m),
\qquad
G(m,x)=S(x).
\]
The Parameterized Peano Iterator Theorem produces a unique operation \(+\) on
\(P\) satisfying
\[
m+1=S(m)
\]
and
\[
m+S(n)=S(m+n).
\]

**Construction P.6 (Multiplication).**
After addition has been constructed, choose
\[
c(m)=m,
\qquad
G(m,x)=x+m.
\]
The theorem produces a unique multiplication operation satisfying
\[
m\cdot1=m
\]
and
\[
m\cdot S(n)=m\cdot n+m.
\]

**Construction P.7 (Positive integer powers).**
After multiplication has been constructed, choose
\[
c(m)=m,
\qquad
G(m,x)=x\cdot m.
\]
The theorem produces a unique positive-integer power operation satisfying
\[
m^1=m
\]
and
\[
m^{S(n)}=m^n\cdot m.
\]

**Normalization notes.**
For every recursively defined operation, use this order:

1. state the parameter and value sets;
2. state the initial-value function \(c\);
3. state the update function \(G\);
4. invoke the Parameterized Peano Iterator Theorem;
5. define the operation as the unique function supplied by the theorem;
6. restate the base and successor clauses as named reusable theorems.

Do not treat the recursive display alone as the definition.
