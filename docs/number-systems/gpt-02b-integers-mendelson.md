# Alternate Construction of \(\mathbb Z\) — Mendelson Positive-Pair Quotient

## 0. Purpose and source posture

This file records Mendelson's construction of the integers from ordered pairs of positive integers. Unlike the canonical construction in `gpt-02-integers.md`, which uses
\[
\mathbb W\times\mathbb W,
\]
Mendelson begins with
\[
\mathbb N\times\mathbb N
\]
under the project's one-based convention. Consequently,
\[
0_M=[(1,1)]_M,
\qquad
1_M=[(2,1)]_M.
\]

The construction has the same quotient shape as the canonical and Tao constructions, but it deserves a separate guide because it develops the arithmetic through positive-pair classes and constructs the order from a positive cone.

**Source basis.**
Elliott Mendelson, *Number Systems and the Foundations of Analysis*, Chapter 2, as represented in `wsollers/lra-volume-ii`.

**Normalization rule.**
All representatives lie in \(\mathbb N\times\mathbb N\), not \(\mathbb W\times\mathbb W\). Do not silently replace Mendelson's carrier by the canonical whole-number carrier.

---

## 1. Positive-pair equivalence relation

**Definition 1.1 (Mendelson pair relation).**
For \((n,j),(k,i)\in\mathbb N\times\mathbb N\), define
\[
(n,j)\sim_M(k,i)
\quad\Longleftrightarrow\quad
n+i=k+j.
\]

**Theorem 1.2 (Mendelson's relation is an equivalence relation).**
The relation \(\sim_M\) is reflexive, symmetric, and transitive on \(\mathbb N\times\mathbb N\).

**Dependencies.**
Associativity and commutativity of addition on \(\mathbb N\), together with additive cancellation.

**Proof obligations.**
Transitivity is the load-bearing step. From
\[
n+i=k+j
\quad\text{and}\quad
k+r=q+i,
\]
derive
\[
n+r=q+j
\]
using reassociation, commutation, and cancellation.

**Definition 1.3 (Mendelson integers).**
Define
\[
\mathbb Z_M:=(\mathbb N\times\mathbb N)/\!\sim_M.
\]
For \((n,j)\in\mathbb N\times\mathbb N\), denote its equivalence class by
\[
[(n,j)]_M.
\]

**Definition 1.4 (Zero and one in the Mendelson construction).**
Define
\[
0_M:=[(1,1)]_M,
\qquad
1_M:=[(2,1)]_M.
\]

**Theorem 1.5 (Representative forms of zero and one).**
For every \(r\in\mathbb N\),
\[
0_M=[(r,r)]_M
\]
and
\[
1_M=[(r+1,r)]_M.
\]

**Normalization notes.**
This theorem makes clear that the distinguished elements are classes, not privileged pairs.

---

## 2. Addition and additive inverses

**Theorem 2.1 (Representative compatibility of Mendelson addition).**
If
\[
(n,j)\sim_M(n',j')
\quad\text{and}\quad
(k,i)\sim_M(k',i'),
\]
then
\[
(n+k,j+i)\sim_M(n'+k',j'+i').
\]

**Definition 2.2 (Mendelson addition).**
For \(\alpha,\beta\in\mathbb Z_M\), choose representatives
\[
(n,j)\in\alpha,
\qquad
(k,i)\in\beta,
\]
and define
\[
\alpha+_M\beta:=[(n+k,j+i)]_M.
\]

**Theorem 2.3 (Well-definedness of Mendelson addition).**
Definition 2.2 is independent of the representatives chosen for \(\alpha\) and \(\beta\).

**Definition 2.4 (Mendelson negation).**
For \(\alpha=[(n,j)]_M\), define
\[
-_M\alpha:=[(j,n)]_M.
\]

**Theorem 2.5 (Well-definedness of Mendelson negation).**
If \((n,j)\sim_M(k,i)\), then
\[
(j,n)\sim_M(i,k).
\]

**Theorem 2.6 (Mendelson additive group laws).**
Addition on \(\mathbb Z_M\) is associative and commutative, \(0_M\) is an additive identity, and every \(\alpha\in\mathbb Z_M\) has the additive inverse \(-_M\alpha\).

**Theorem 2.7 (Additive structure).**
The structure
\[
(\mathbb Z_M,+_M,0_M)
\]
is an abelian group.

**Definition 2.8 (Mendelson subtraction).**
For \(\alpha,\beta\in\mathbb Z_M\), define
\[
\alpha-_M\beta:=\alpha+_M(-_M\beta).
\]

---

## 3. Multiplication

**Theorem 3.1 (Representative compatibility of Mendelson multiplication).**
If
\[
(n,j)\sim_M(n',j')
\quad\text{and}\quad
(k,i)\sim_M(k',i'),
\]
then
\[
(nk+ji,jk+ni)
\sim_M
(n'k'+j'i',j'k'+n'i').
\]

**Definition 3.2 (Mendelson multiplication).**
For \(\alpha,\beta\in\mathbb Z_M\), choose representatives
\[
(n,j)\in\alpha,
\qquad
(k,i)\in\beta,
\]
and define
\[
\alpha\cdot_M\beta
:=
[(nk+ji,jk+ni)]_M.
\]

**Theorem 3.3 (Well-definedness of Mendelson multiplication).**
Definition 3.2 is independent of the representatives chosen for \(\alpha\) and \(\beta\).

**Theorem 3.4 (Multiplicative and distributive laws).**
Multiplication on \(\mathbb Z_M\) is associative and commutative, \(1_M\) is a multiplicative identity, and multiplication distributes over addition on both sides.

**Theorem 3.5 (Zero and one are distinct).**
The equality
\[
0_M=1_M
\]
does not hold.

**Theorem 3.6 (No zero divisors).**
For all \(\alpha,\beta\in\mathbb Z_M\),
\[
\alpha\cdot_M\beta=0_M
\quad\Longrightarrow\quad
\alpha=0_M\text{ or }\beta=0_M.
\]

**Corollary 3.7 (Multiplicative cancellation).**
Let \(\alpha,\beta,\gamma\in\mathbb Z_M\). If \(\gamma\ne0_M\) and
\[
\alpha\gamma=\beta\gamma,
\]
then \(\alpha=\beta\).

**Theorem 3.8 (Integral-domain structure before order).**
The structure
\[
(\mathbb Z_M,+_M,\cdot_M,0_M,1_M)
\]
is an integral domain.

**Normalization notes.**
The source inserts general definitions of ring and integral domain at this point. In the normalized collection, cite `gpt-00-abstract-laws.md` instead of redefining those structures locally.

---

## 4. Positive classes

**Lemma 4.1 (Representative invariance of positivity).**
Let \(\alpha\in\mathbb Z_M\), and let \((n,j),(k,i)\in\alpha\). Then
\[
j<n
\quad\Longleftrightarrow\quad
i<k.
\]

**Definition 4.2 (Mendelson positive cone).**
Define
\[
P_M
:=
\left\{
\alpha\in\mathbb Z_M:
\text{for some, equivalently every, }(n,j)\in\alpha,\ j<n
\right\}.
\]

**Theorem 4.3 (Positive-cone trichotomy).**
For every \(\alpha\in\mathbb Z_M\), exactly one of the following holds:

1. \(\alpha\in P_M\);
2. \(\alpha=0_M\);
3. \(-_M\alpha\in P_M\).

**Theorem 4.4 (Positive cone is closed under addition).**
If \(\alpha,\beta\in P_M\), then
\[
\alpha+_M\beta\in P_M.
\]

**Theorem 4.5 (Positive cone is closed under multiplication).**
If \(\alpha,\beta\in P_M\), then
\[
\alpha\cdot_M\beta\in P_M.
\]

**Theorem 4.6 (Zero is not positive).**
The element \(0_M\) does not belong to \(P_M\).

**Dependencies.**
Order and arithmetic on \(\mathbb N\), representative invariance, and the integral-domain laws already proved.

---

## 5. Order induced by the positive cone

**Definition 5.1 (Mendelson strict order).**
For \(\alpha,\beta\in\mathbb Z_M\), define
\[
\alpha<_M\beta
\quad\Longleftrightarrow\quad
\beta-_M\alpha\in P_M.
\]

**Definition 5.2 (Mendelson non-strict order).**
For \(\alpha,\beta\in\mathbb Z_M\), define
\[
\alpha\le_M\beta
\quad\Longleftrightarrow\quad
\alpha<_M\beta\text{ or }\alpha=\beta.
\]

**Theorem 5.3 (Strict total order).**
The relation \(<_M\) is a strict total order on \(\mathbb Z_M\).

**Theorem 5.4 (Translation invariance).**
For all \(\alpha,\beta,\gamma\in\mathbb Z_M\),
\[
\alpha<_M\beta
\quad\Longleftrightarrow\quad
\alpha+_M\gamma<_M\beta+_M\gamma.
\]

**Theorem 5.5 (Positive multiplication preserves order).**
For all \(\alpha,\beta,\gamma\in\mathbb Z_M\), if
\[
\alpha<_M\beta
\quad\text{and}\quad
0_M<_M\gamma,
\]
then
\[
\alpha\gamma<_M\beta\gamma.
\]

**Theorem 5.6 (Negation reverses order).**
For all \(\alpha,\beta\in\mathbb Z_M\),
\[
\alpha<_M\beta
\quad\Longleftrightarrow\quad
-_M\beta<_M-_M\alpha.
\]

**Theorem 5.7 (Sign rules).**
For all \(\alpha,\beta\in\mathbb Z_M\):

1. if \(0_M<_M\alpha\) and \(0_M<_M\beta\), then \(0_M<_M\alpha+\beta\);
2. if \(0_M<_M\alpha\) and \(0_M<_M\beta\), then \(0_M<_M\alpha\beta\);
3. if \(\alpha<_M0_M\) and \(\beta<_M0_M\), then \(0_M<_M\alpha\beta\).

**Theorem 5.8 (Discrete order).**
For every \(\alpha\in\mathbb Z_M\), there is no \(\beta\in\mathbb Z_M\) satisfying
\[
\alpha<_M\beta<_M\alpha+_M1_M.
\]

---

## 6. Recovery of the positive natural-number system

**Definition 6.1 (Successor on positive Mendelson integers).**
Define
\[
S_M:P_M\to P_M,
\qquad
S_M(\alpha):=\alpha+_M1_M.
\]

**Theorem 6.2 (Positive Mendelson integers form a one-based Peano system).**
The structure
\[
(P_M,1_M,S_M)
\]
satisfies the one-based Peano axioms.

**Proof obligations.**
Verify:

1. \(1_M\in P_M\);
2. \(S_M(P_M)\subseteq P_M\);
3. \(1_M\) is not a successor;
4. \(S_M\) is injective;
5. the induction principle holds for subsets of \(P_M\).

**Theorem 6.3 (Canonical isomorphism with \(\mathbb N\)).**
There exists a unique Peano-system isomorphism
\[
\eta_M:\mathbb N\to P_M
\]
such that
\[
\eta_M(1)=1_M
\quad\text{and}\quad
\eta_M(S(n))=S_M(\eta_M(n)).
\]

**Normalization notes.**
This recovery theorem is a genuine distinctive feature of Mendelson's presentation and should be retained rather than collapsed into the ordinary embedding theorem.

---

## 7. Structural summary

**Theorem 7.1 (Structure of the Mendelson integers).**
The structure
\[
(\mathbb Z_M,+_M,\cdot_M,0_M,1_M,<_M)
\]
is a discretely ordered integral domain.

---

## 8. Comparison with the canonical construction

Let \(\mathbb Z\) denote the canonical whole-number-pair construction from `gpt-02-integers.md`.

Because Mendelson uses positive pairs, translate a positive representative \((n,j)\) into the whole-number pair \((n-1,j-1)\).

**Definition 8.1 (Comparison map from Mendelson integers).**
Define
\[
\Phi_M:\mathbb Z_M\to\mathbb Z,
\qquad
\Phi_M([(n,j)]_M):=[(n-1,j-1)].
\]

Here \(n-1\) and \(j-1\) denote the unique predecessors of \(n\) and \(j\) in \(\mathbb W\).

**Theorem 8.2 (Well-definedness of the Mendelson comparison map).**
The value of \(\Phi_M([(n,j)]_M)\) is independent of the chosen representative.

**Theorem 8.3 (Mendelson construction isomorphism).**
The map \(\Phi_M\) is an order-preserving ring isomorphism.

**Theorem 8.4 (Compatibility with the recovered naturals).**
For every \(n\in\mathbb N\),
\[
\Phi_M(\eta_M(n))
=
\iota_{\mathbb W\to\mathbb Z}(n).
\]

**Corollary 8.5 (Equivalence of the Mendelson and canonical constructions).**
The Mendelson positive-pair construction and the canonical whole-number-pair construction produce isomorphic discretely ordered integral domains.

---

## 9. Comparison with Tao's construction

Let \(\mathbb Z_T\) be the construction in `gpt-02a-integers-tao.md`.

**Definition 9.1 (Direct comparison map).**
Define
\[
\Psi_{M,T}:\mathbb Z_M\to\mathbb Z_T,
\qquad
\Psi_{M,T}([(n,j)]_M)
=
[(n-1) {-\!\!-} (j-1)]_T.
\]

**Theorem 9.2 (Direct Tao–Mendelson isomorphism).**
The map \(\Psi_{M,T}\) is an order-preserving ring isomorphism and satisfies
\[
\Phi_T\circ\Psi_{M,T}=\Phi_M.
\]

**Interpretation.**
Tao and Mendelson implement the same Grothendieck-style formal-difference construction using different underlying carriers and notation. Tao's carrier permits literal zero coordinates; Mendelson shifts both coordinates into the positive integers.

---

## 10. Proof status checklist

- [ ] Equivalence relation proved.
- [ ] Addition well-defined.
- [ ] Negation well-defined.
- [ ] Multiplication well-defined.
- [ ] Integral-domain laws proved.
- [ ] Positive cone proved representative-independent.
- [ ] Positive-cone axioms proved.
- [ ] Order laws proved.
- [ ] Discreteness proved.
- [ ] Recovery of the Peano system proved.
- [ ] Comparison with the canonical construction proved.
- [ ] Direct comparison with Tao's construction proved.


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
