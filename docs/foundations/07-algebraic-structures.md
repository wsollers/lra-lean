# Algebraic Structures (`[RECAP]`)

[← Back to Index](00-index.md)

## 7.0 Geometric Intuition

A structure name (magma, group, ring, field) is shorthand for a fixed conjunction of Operations-interlude adjectives — nothing new is invented, only named. The hierarchy is a filter: each level adds one constraint, narrows the space of admissible objects, and earns correspondingly more free theorems.

## 7.1 Signatures vs. Structures

Signature = symbols + arities only. Structure/Model = signature + interpretation. Laws = what a model must satisfy. **Flagged discipline:** a signature lists primitives only — derived symbols (subtraction, division, powers) never belong in one. $\mathrm{GroupSignature}$ takes inversion as PRIMITIVE (universal-algebra convention, needed for "group" to be an equational variety) — a deliberate, flagged departure from a genetic treatment that derives $-d$ by solving an equation.

## 7.2 Elementary Structures

$$\mathrm{Magma}(S,*):\equiv\mathrm{IsOperation}_2(*,S) \qquad \mathrm{Semigroup} := \mathrm{Magma}\wedge\mathrm{Associative}$$
$$\mathrm{Monoid} := \mathrm{Semigroup}\wedge\mathrm{TwoSidedIdentity} \qquad \mathrm{Group} := \mathrm{Monoid}\wedge\forall x\,\exists y\,\mathrm{TwoSidedInverse}(y,x)$$

Abelian is a *modifier* (conjunction with Commutative), never a separate primitive definition. **Theorem.** Groups are cancellative (closes the gap flagged in 6.2). **Theorem.** Inverse map is a group anti-automorphism (cites the socks-and-shoes law, 6.4, at the structure level).

**Cross-reference table (already-verified instances, zero new work):** $(\mathrm{Fun}(S,S),\circ)$ monoid; $(\mathrm{Sym}(S),\circ)$ group; $(\{$partial orders extending $R_0\},\cap)$ NOT a group ([Part 2.5](02-relations.md)'s Theorem, flagged as stopping short of monoid); $(\mathbb Z^2,+)$ abelian group (Operations 6.7.3.a, coordinatewise).

## 7.3 Ring-Like Structures

$$\mathrm{Semiring} := \mathrm{CommutativeMonoid}(+)\wedge\mathrm{Semigroup}(\times)\wedge\mathrm{TwoSidedDistributive} \qquad \mathrm{Ring} := \mathrm{Semiring}\wedge\mathrm{Group}(+)$$

Integral domain: nontrivial, commutative, unital, no zero divisors. Field: additionally every $x\neq0$ has a $\times$-inverse. **Theorem.** Every field is an integral domain. **Theorem.** $0\times x=0$ (cites 6.5's theorem at the structure level). **Theorem (rule of signs).** $(-x)\times y=-(x\times y)$; $(-x)\times(-y)=x\times y$ — cites the involution-of-inverse mechanism (6.4) twice. **Theorem.** Absorbing element has no multiplicative inverse (the abstract reason division by zero is impossible).

**Instantiation table.** $(\mathbb N,+)$: commutative cancellative semigroup/monoid, not a group. $(\mathbb Z,+,\times)$: commutative unital ring, integral domain, not a field. $(\mathbb Q,\mathbb R,\mathbb C,+,\times)$: fields.

## 7.4 Ordered Structures

$$\mathrm{OrderedMagma}(S,*,\le):\equiv\mathrm{Magma}\wedge\mathrm{PartialOrder}(\le,S)\wedge\mathrm{RespectsOrder}(*,\le,S)$$

**Flagged distinction.** $\mathrm{RespectsOrder}$ (weak, one-directional, both args varied) vs. **translation-invariance** $x<y\leftrightarrow x+z<y+z$ (sharp, biconditional, one arg fixed) — the classical "ordered group" uses the sharper translation-invariance; $\mathrm{RespectsOrder}$ is reserved for magmas/monoids where no inverse exists to state the sharper form.

**Theorem.** $\mathbb C$ admits NO ordering making it an ordered field — genuine impossibility (from $x\neq0\to x^2>0$ applied to $i$, contradicting $1>0$). **Theorem.** $\mathbb Q$ is Archimedean but not order-complete (cites Order interlude's full worked $\sqrt2$ failure). **Theorem.** $\mathbb R$ is THE complete ordered field, categorically.

**Named forward reference at the close of this document originally:** the one missing theorem needed to fully certify "$\mathbb R^2/\mathbb Z^2$ is a group" was "homomorphic images of groups are groups" — resolved in [Part 8](08-morphisms.md).

---

---

[← Back to Index](00-index.md)
