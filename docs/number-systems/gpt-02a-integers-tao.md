# Alternate Construction of \(\mathbb Z\) — Tao Formal Differences

## 0. Purpose and source posture

This file records Tao's construction of the integers as formal differences of whole numbers. It is an alternate presentation of the same quotient object constructed in `gpt-02-integers.md`, but it preserves Tao's placeholder notation
\[
a {-\!\!-} b
\]
to emphasize that subtraction has not yet been defined.

The construction must be developed independently through its own definitions, equivalence checks, operation formulas, well-definedness theorems, order, and structural summary. Only after the comparison theorem may it be identified with the canonical integer construction.

**Source basis.**
Terence Tao, *Analysis I*, Section 4.1, as represented in `wsollers/lra-volume-ii`.

**Normalization rule.**
The notation \(a {-\!\!-} b\) is formal-difference notation, not literal subtraction. Do not replace it by \(a-b\) before integer subtraction has been defined and the agreement theorem has been proved.

---

## 1. Formal integer expressions and equality

**Definition 1.1 (Tao formal integer expression).**
Let \(a,b\in\mathbb W\). A Tao formal integer expression is a symbol
\[
a {-\!\!-} b,
\]
whose intended interpretation is the difference of \(a\) and \(b\), without presupposing that subtraction is already defined.

**Definition 1.2 (Equality of Tao formal integer expressions).**
For \(a,b,c,d\in\mathbb W\), define
\[
a {-\!\!-} b \equiv_T c {-\!\!-} d
\quad\Longleftrightarrow\quad
a+d=c+b.
\]

**Theorem 1.3 (Tao equality is an equivalence relation).**
The relation \(\equiv_T\) is reflexive, symmetric, and transitive on the collection of Tao formal integer expressions.

**Dependencies.**
Addition on \(\mathbb W\), commutativity and associativity of addition, and additive cancellation on \(\mathbb W\).

**Proof obligations.**
Prove reflexivity and symmetry directly from equality. For transitivity, assume
\[
a+d=c+b
\quad\text{and}\quad
c+f=e+d,
\]
rearrange the resulting sums, and use additive cancellation to derive
\[
a+f=e+b.
\]

**Definition 1.4 (Tao integers).**
Define
\[
\mathbb Z_T
\]
to be the quotient of the set of Tao formal integer expressions by \(\equiv_T\). Denote the equivalence class of \(a {-\!\!-} b\) by
\[
[a {-\!\!-} b]_T.
\]

**Normalization notes.**
Keep the set of representatives, the equivalence relation, and the quotient definition as separate mathematical items. The original compact wording combines these stages too early.

---

## 2. Distinguished integers and the whole-number embedding

**Definition 2.1 (Zero and one in the Tao construction).**
Define
\[
0_T:=[0 {-\!\!-} 0]_T,
\qquad
1_T:=[1 {-\!\!-} 0]_T.
\]

**Definition 2.2 (Canonical embedding of whole numbers).**
Define
\[
\iota_T:\mathbb W\to\mathbb Z_T,
\qquad
\iota_T(n):=[n {-\!\!-} 0]_T.
\]

**Theorem 2.3 (Injectivity of the Tao embedding).**
For all \(m,n\in\mathbb W\),
\[
\iota_T(m)=\iota_T(n)
\quad\Longleftrightarrow\quad
m=n.
\]

**Proof obligations.**
Expand equality of classes:
\[
m+0=n+0.
\]

**Normalization notes.**
Tao's source often suppresses the embedding and writes \(n\) for its image. Retain \(\iota_T\) until an explicit identification convention is adopted.

---

## 3. Addition and negation

**Definition 3.1 (Addition on Tao integers).**
For \(a,b,c,d\in\mathbb W\), define
\[
[a {-\!\!-} b]_T+[c {-\!\!-} d]_T
:=
[(a+c) {-\!\!-} (b+d)]_T.
\]

**Lemma 3.2 (Tao addition respects equivalence in the first argument).**
If
\[
a {-\!\!-} b\equiv_T a' {-\!\!-} b'
\quad\text{and}\quad
c {-\!\!-} d\equiv_T c' {-\!\!-} d',
\]
then
\[
(a+c) {-\!\!-} (b+d)
\equiv_T
(a'+c') {-\!\!-} (b'+d').
\]

**Definition 3.3 (Negation on Tao integers).**
For \(a,b\in\mathbb W\), define
\[
-[a {-\!\!-} b]_T:=[b {-\!\!-} a]_T.
\]

**Theorem 3.4 (Well-definedness of Tao negation).**
If
\[
a {-\!\!-} b\equiv_T c {-\!\!-} d,
\]
then
\[
b {-\!\!-} a\equiv_T d {-\!\!-} c.
\]

**Theorem 3.5 (Additive group laws).**
Addition on \(\mathbb Z_T\) is associative and commutative, \(0_T\) is an additive identity, and every \(z\in\mathbb Z_T\) satisfies
\[
z+(-z)=0_T=(-z)+z.
\]

**Theorem 3.6 (Additive structure).**
The structure
\[
(\mathbb Z_T,+,0_T)
\]
is an abelian group.

**Definition 3.7 (Subtraction on Tao integers).**
For \(x,y\in\mathbb Z_T\), define
\[
x-y:=x+(-y).
\]

**Theorem 3.8 (Formal differences agree with subtraction).**
For all \(a,b\in\mathbb W\),
\[
[a {-\!\!-} b]_T=\iota_T(a)-\iota_T(b).
\]

**Normalization notes.**
This theorem is the point at which the placeholder notation has fulfilled its purpose. Before it, \(a {-\!\!-} b\) is syntax for a representative; after it, the class may be interpreted as a genuine integer difference.

---

## 4. Multiplication

**Definition 4.1 (Multiplication on Tao integers).**
For \(a,b,c,d\in\mathbb W\), define
\[
[a {-\!\!-} b]_T\,[c {-\!\!-} d]_T
:=
[(ac+bd) {-\!\!-} (ad+bc)]_T.
\]

**Theorem 4.2 (Well-definedness of Tao multiplication).**
If
\[
a {-\!\!-} b\equiv_T a' {-\!\!-} b'
\quad\text{and}\quad
c {-\!\!-} d\equiv_T c' {-\!\!-} d',
\]
then
\[
(ac+bd) {-\!\!-} (ad+bc)
\equiv_T
(a'c'+b'd') {-\!\!-} (a'd'+b'c').
\]

**Proof obligations.**
Use only addition and multiplication already proved on \(\mathbb W\). Do not justify the formula by writing \((a-b)(c-d)\) as though subtraction were already available in the representative system; that expansion belongs in interpretation or motivation.

**Theorem 4.3 (Multiplicative and distributive laws).**
Multiplication on \(\mathbb Z_T\) is associative and commutative, \(1_T\) is a multiplicative identity, and multiplication distributes over addition on both sides.

**Theorem 4.4 (Zero is absorbing).**
For every \(z\in\mathbb Z_T\),
\[
z0_T=0_T=0_Tz.
\]

**Theorem 4.5 (No zero divisors).**
For all \(x,y\in\mathbb Z_T\),
\[
xy=0_T
\quad\Longrightarrow\quad
x=0_T\text{ or }y=0_T.
\]

**Corollary 4.6 (Multiplicative cancellation).**
Let \(a,b,c\in\mathbb Z_T\). If \(c\ne0_T\) and
\[
ac=bc,
\]
then \(a=b\).

---

## 5. Sign classification

**Definition 5.1 (Positive Tao integer).**
An integer \(z\in\mathbb Z_T\) is positive if there exists \(n\in\mathbb N\) such that
\[
z=\iota_T(n).
\]

**Definition 5.2 (Negative Tao integer).**
An integer \(z\in\mathbb Z_T\) is negative if there exists \(n\in\mathbb N\) such that
\[
z=-\iota_T(n).
\]

**Theorem 5.3 (Trichotomy by sign).**
For every \(z\in\mathbb Z_T\), exactly one of the following holds:

1. \(z=0_T\);
2. \(z\) is positive;
3. \(z\) is negative.

**Theorem 5.4 (Unique sign decomposition).**
For every nonzero \(z\in\mathbb Z_T\), there exists a unique \(n\in\mathbb N\) such that
\[
z=\iota_T(n)
\quad\text{or}\quad
z=-\iota_T(n),
\]
and exactly one of these alternatives holds.

**Proof obligations.**
Choose a representative \([a {-\!\!-} b]_T\) and apply trichotomy in \(\mathbb W\) to \(a\) and \(b\).

---

## 6. Order

**Definition 6.1 (Tao non-strict order).**
For \(x,y\in\mathbb Z_T\), define
\[
x\le_T y
\quad\Longleftrightarrow\quad
\text{there exists }n\in\mathbb W\text{ such that }y=x+\iota_T(n).
\]

**Definition 6.2 (Tao strict order).**
For \(x,y\in\mathbb Z_T\), define
\[
x<_T y
\quad\Longleftrightarrow\quad
x\le_T y\text{ and }x\ne y.
\]

**Theorem 6.3 (Order characterized by positive difference).**
For all \(x,y\in\mathbb Z_T\),
\[
x<_T y
\quad\Longleftrightarrow\quad
y-x\text{ is positive}.
\]

**Theorem 6.4 (Strict total order).**
The relation \(<_T\) is a strict total order on \(\mathbb Z_T\).

**Theorem 6.5 (Translation invariance).**
For all \(x,y,z\in\mathbb Z_T\),
\[
x<_T y
\quad\Longleftrightarrow\quad
x+z<_T y+z.
\]

**Theorem 6.6 (Positive multiplication preserves order).**
For all \(x,y,z\in\mathbb Z_T\), if \(x<_T y\) and \(0_T<_T z\), then
\[
xz<_T yz.
\]

**Theorem 6.7 (Negation reverses order).**
For all \(x,y\in\mathbb Z_T\),
\[
x<_T y
\quad\Longleftrightarrow\quad
-y<_T -x.
\]

**Theorem 6.8 (Discrete order).**
For every \(z\in\mathbb Z_T\), there is no \(w\in\mathbb Z_T\) satisfying
\[
z<_T w<_T z+1_T.
\]

---

## 7. Structural summary

**Theorem 7.1 (Structure of the Tao integers).**
The structure
\[
(\mathbb Z_T,+,\cdot,0_T,1_T,<_T)
\]
is a discretely ordered integral domain.

---

## 8. Comparison with the canonical construction

Let \(\mathbb Z\) denote the canonical quotient construction from `gpt-02-integers.md`.

**Definition 8.1 (Comparison map from Tao integers).**
Define
\[
\Phi_T:\mathbb Z_T\to\mathbb Z,
\qquad
\Phi_T([a {-\!\!-} b]_T):=[(a,b)].
\]

**Theorem 8.2 (Well-definedness of the Tao comparison map).**
The value of \(\Phi_T([a {-\!\!-} b]_T)\) is independent of the chosen representative.

**Theorem 8.3 (Tao construction isomorphism).**
The map \(\Phi_T\) is an order-preserving ring isomorphism satisfying
\[
\Phi_T\circ\iota_T=\iota_{\mathbb W\to\mathbb Z}.
\]

**Corollary 8.4 (Equivalence of the Tao and canonical constructions).**
The Tao construction and the canonical whole-number-pair construction produce isomorphic discretely ordered integral domains, uniquely isomorphic by an isomorphism fixing the embedded copy of \(\mathbb W\).

---

## 9. Proof status checklist

- [ ] Equivalence relation proved.
- [ ] Addition well-defined.
- [ ] Negation well-defined.
- [ ] Multiplication well-defined.
- [ ] Additive group laws proved.
- [ ] Multiplicative and distributive laws proved.
- [ ] No-zero-divisors theorem proved.
- [ ] Sign trichotomy proved.
- [ ] Order laws proved.
- [ ] Discreteness proved.
- [ ] Comparison isomorphism proved.


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
