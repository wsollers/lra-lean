# Order (`[RECAP]`)

[← Back to Index](00-index.md)

## 5.0 Geometric Intuition

A landscape with "at least as high as." A bound is a horizon you may not cross. A least upper bound is the tightest horizon that still works. Completeness is the single order-theoretic fact that turns algebra into analysis — nothing about $\mathbb Q$ being a field explains why $\sqrt2$ exists; only completeness (an order property) does.

## 5.1 Bounds and Extremal Elements

$$\mathrm{UpperBound}(u,A,S):\equiv u\in S\wedge\forall a\in A(a\le u) \qquad \mathrm{LowerBound}(\ell,A,S):\equiv\ell\in S\wedge\forall a\in A(\ell\le a)$$
$$\mathrm{IsGreatest}(m,A):\equiv m\in A\wedge\forall a\in A(a\le m) \qquad \mathrm{IsMaximal}(m,A):\equiv m\in A\wedge\neg\exists a\in A(m<a)$$

**Theorem.** Greatest $\to$ maximal, uniqueness of greatest (antisymmetry). **Flagged counterexample.** $S=\{\varnothing,\{1\},\{2\}\}$ under $\subseteq$: both $\{1\},\{2\}$ maximal, neither greatest (incomparable) — total order collapses this distinction (Theorem).

## 5.2 Supremum and Infimum

$$\mathrm{IsSup}(s,A,S):\equiv\mathrm{UpperBound}(s,A,S)\wedge\forall u(\mathrm{UpperBound}(u,A,S)\to s\le u)$$

Supremum is literally "least element" applied one level up, to the set of upper bounds. **Theorem.** $\sup A\in A \to$ equals greatest element; converse too. **Flagged, vacuous truth.** $\mathrm{UpperBound}(u,\varnothing,S)$ holds for every $u$ (vacuously); $\sup\varnothing$ = least element of $S$ if it exists — must never be silently assumed away, exact mirror of Set interlude's empty-intersection flag.

## 5.3 Lattices

$$x\vee y:=\sup\{x,y\} \qquad x\wedge y:=\inf\{x,y\} \qquad \mathrm{Lattice}(S,\le):\equiv\mathrm{PartialOrder}\wedge\forall x,y(\exists(x\vee y)\wedge\exists(x\wedge y))$$
$$\mathrm{CompleteLattice}(S,\le):\equiv\mathrm{PartialOrder}\wedge\forall A\subseteq S(\exists\sup A\wedge\exists\inf A)$$

**`[REWORK — CORRECTED PER AUDIT, ROUND 2]` Definition (closure operator).** Extensive + Monotone + Idempotent. **Theorem (fixed-point-of-closure-operator).** Fixed points of a closure operator on a complete lattice form a complete lattice — the unifying skeleton for σ-algebra generation, topology generation, subgroup generation, convex hull, and ([Part 3.4](03-equivalences.md)) equivalence-relation refinement-join. **Audit correction:** Round 2 (`aud-res.md`, project knowledge) confirms **no `ClosureOperator` type exists anywhere in the repo** — not in `LRA/Order/` (despite Order being nine subdirectories deep in every other respect: Bounds, Lattices, Density, Directedness, Morphisms, OrderedSets) nor elsewhere. This is presented above as established fact but is genuinely unbuilt — flagged as the single highest-priority small addition, since [`03-equivalences.md`](03-equivalences.md) §3.4 cites it *by theorem number* to justify its refinement-lattice join, and that citation currently points at nothing. See [`13-audit-round-2.md`](13-audit-round-2.md) §4.

## 5.4 Chains and Directed Sets

$$\mathrm{Chain}(C,S):\equiv\forall x,y\in C(x\le y\vee y\le x) \qquad \mathrm{Directed}(D,S):\equiv D\neq\varnothing\wedge\forall x,y\in D\,\exists z\in D(x\le z\wedge y\le z)$$

**Theorem.** Every chain is directed; not conversely — $\mathbb N\times\mathbb N$ coordinatewise is directed but not a chain (this is exactly $\mathbb Z^2$'s shape as your torus lattice index set). **Named forward reference:** nets generalize sequences via directedness.

## 5.5 Well-Orders

**Theorem.** $\mathrm{WellOrder}(\le,S)\leftrightarrow\mathrm{TotalOrder}\wedge\forall A(A\neq\varnothing\to\exists!\,\mathrm{IsLeast}(m,A))$. Transfinite induction (statement only). Well-Ordering Theorem $\equiv$ Choice.

## 5.6 Completeness — The Capstone

$$\mathrm{OrderComplete}(S,\le):\equiv\forall A\subseteq S(A\neq\varnothing\wedge\mathrm{BoundedAbove}(A,S)\to\exists\sup A)$$

**Theorem.** $\mathrm{OrderComplete}(\mathbb R,\le)$, adjoined to ordered-field axioms, is categorical: any two complete ordered fields are uniquely isomorphic.

**Worked failure, in full.** $A=\{x\in\mathbb Q:x\ge0\wedge x^2<2\}$: nonempty, bounded above by $2$, but no rational is $\sup A$ — structural gap in $\mathbb Q$ itself, motivating all five $\mathbb R$-construction methods.

**Definition (DCPO — forward reference).** $\mathrm{DCPO}(S,\le):\equiv\mathrm{PartialOrder}\wedge\forall D(\mathrm{Directed}(D,S)\to\exists\sup D)$ — NOT the same demand as order-complete (only directed subsets, not arbitrary bounded ones); underlies the formal-ball model of metric completion.

## 5.7 Duality

**Theorem (order duality principle).** Every poset theorem has a dual under $\le\leftrightarrow\ge$, $\vee\leftrightarrow\wedge$, $\sup\leftrightarrow\inf$, Greatest$\leftrightarrow$Least, Maximal$\leftrightarrow$Minimal. **Flagged, the single most important caveat:** WellFounded is NOT self-dual; completeness-from-above and -below are logically independent in a bare poset — $\mathbb R$'s "interderivability" of both directions secretly uses the involution $x\mapsto -x$, which a general poset lacks.

**Summary map.**
```
Bounds -> Greatest/Least (membership) vs Maximal/Minimal (non-domination) -- FLAGGED
   |
   v
Supremum/Infimum = "least element" one level up -- vacuous-truth edge cases FLAGGED
   |
   v
Lattices -> Complete lattice -> closure-operator fixed points UNIFY:
   sigma-algebra gen, topology gen, subgroup gen, convex hull, equiv-rel refinement
   |
   v
Chains -> Directed sets (STRICTLY more general; Z^2 coordinatewise = directed not chain)
   |
   v
Well-Orders -> transfinite induction, Well-Ordering Thm = Choice
   |
   v
Completeness (CAPSTONE) -> R is THE complete ordered field; Q fails at sqrt(2), worked
   -> DCPO (directed-completeness), formal-ball / Cauchy-completeness bridge
   |
   v
Duality: sup<->inf, but WellFounded NOT self-dual -- FLAGGED, load-bearing
```

---

---

[← Back to Index](00-index.md)
