# Equivalences (`[RECAP]` for Parts 3.1–3.3 restating prior omnibus content; `[NET NEW]` for Parts 3.4–3.6, the refinement lattice and its full development)

[← Back to Index](00-index.md)

## 3.0 Geometric Intuition

Equivalence is the single most consequential combination of three relation-adjectives (reflexive, symmetric, transitive): it partitions the whole space into disjoint blobs, and every element inside a blob becomes indistinguishable from every other, for the purposes of this relation. "Same denomination as," sorting a box of coins — unambiguous sorting is the entire content of the Fundamental Theorem below, and it is the single most-used piece of machinery in this project: $\mathbb{R}^2/\mathbb{Z}^2$ is this sorting process applied to the plane, "same pile" meaning "differs by a lattice vector."

## 3.1 Definition (`[RECAP]`)

$$\mathrm{EquivalenceRelation}(\sim,S) :\equiv \mathrm{Reflexive}(\sim,S)\wedge\mathrm{Symmetric}(\sim,S)\wedge\mathrm{Transitive}(\sim,S)$$

## 3.2 Classes and the Fundamental Theorem (`[RECAP]`, canonical source: omnibus Satz 0.11)

**Definition.** $[x]_\sim := \{y\in S : y\sim x\}$ (exists by Separation). Representative $r\in[x]_\sim$ satisfies $[r]_\sim=[x]_\sim$.

**Theorem (reflexivity payoff).** $x\in[x]_\sim$ for all $x$ — no class is empty.

**Theorem (class-equality criterion).** $[x]_\sim\cap[y]_\sim\neq\varnothing \leftrightarrow [x]_\sim=[y]_\sim$; equivalently $x\sim y \leftrightarrow [x]_\sim=[y]_\sim$.

**Definition (partition).** $\mathrm{IsPartition}(\mathcal P,S) :\equiv (\forall B\in\mathcal P(B\neq\varnothing)) \wedge (\forall B_1\neq B_2\in\mathcal P(B_1\cap B_2=\varnothing)) \wedge (\bigcup\mathcal P = S)$.

**Theorem (Fundamental Theorem of Equivalence Relations).** $\mathrm{EquivalenceRelation}(\sim,S) \to \mathrm{IsPartition}(\{[x]_\sim:x\in S\},S)$, and conversely every partition $\mathcal P$ arises uniquely from $x\sim_{\mathcal P}y :\equiv \exists B\in\mathcal P(x\in B\wedge y\in B)$. **Bijective correspondence:** $\{\text{equivalence relations on }S\}\leftrightarrow\{\text{partitions of }S\}$.

**Flagged counterexamples (load-bearing, each drops exactly one hypothesis).**
- *Drop reflexivity:* empty relation on $S=\{a,b\}$ is vacuously symmetric+transitive; $[a]_\sim=\varnothing$, not a valid partition block.
- *Drop symmetry:* $a\sim b$ holds, $b\sim a$ doesn't; $[a]_\sim=\{a\}\neq[b]_\sim\supseteq\{a,b\}$, yet they overlap — violates the class-equality biconditional directly.
- *Drop transitivity:* $a\sim b$, $b\sim c$, not $a\sim c$; $b\in[a]_\sim\cap[c]_\sim$ but $[a]_\sim\neq[c]_\sim$ — this is exactly the union-of-equivalence-relations pathology from [Part 2.5](02-relations.md), now traced to its root cause.

## 3.3 Quotient Sets, Canonical Projection, Universal Property (`[RECAP]`)

**Definition.** $S/\!\sim\, := \{[x]_\sim : x\in S\}$ (Replacement). $\pi_\sim: S\to S/\!\sim$, $\pi_\sim(x):=[x]_\sim$.

**Theorem.** $\pi_\sim$ is surjective; injective iff $\sim\,=\,=$.

**Theorem (Universal Property of the Quotient — the theorem the Set interlude named as its destination).** If $\forall x,y(x\sim y\to f(x)=f(y))$ then $\exists! \bar f: S/\!\sim\,\to T$ with $f=\bar f\circ\pi_\sim$.

**Definition (kernel of a function — general, structure-free case; explicitly NOT the algebraic/homomorphism kernel, which lives in [Part 8](08-morphisms.md), Morphisms).** $\ker(f) := \{(x,y)\in S\times S : f(x)=f(y)\}$.

**Theorem.** $\ker(f)$ is *always* an equivalence relation — no hypotheses on $f$ or $T$ needed.

**Theorem.** $[x]_{\ker(f)} = \mathrm{fib}_f(f(x))$ — equivalence classes of the kernel *are* the fibers ([Part 4](04-maps-functions-operators.md)).

**Theorem (coimage-image factorization).** $f=\bar f\circ\pi_{\ker(f)}$ with $\bar f$ injective — the set-theoretic ancestor of the First Isomorphism Theorem ([Part 8](08-morphisms.md)).

**Explicit boundary flag:** the *algebraic* kernel of a group homomorphism (Definition 4.1, [Part 8](08-morphisms.md) below) is a different, later object requiring Homomorphism to exist first — matching the project's own resolved placement decision (kernel relocated out of `Relations.Equivalence` into `Algebra.Models`). Not duplicated here.

## 3.4 The Refinement Lattice (`[NET NEW]` — genuinely new development beyond what [Part 2.5](02-relations.md) sketched)

This was flagged in [Part 2.5](02-relations.md) as a theorem-existence claim without full development. Developing it properly is the actual payoff of promoting Equivalences to its own document.

**`[NET NEW]` Definition (refinement order).** $\sim_1\,\sqsubseteq\,\sim_2 :\equiv \forall x,y\in S(x\sim_1 y\to x\sim_2 y)$ — "$\sim_1$ is finer than $\sim_2$": finer piles, more of them; coarser merges piles together.

**`[NET NEW]` Theorem.** $\sqsubseteq$ is a partial order on $\{\text{equivalence relations on }S\}$ (direct instance of $\subseteq$ on $\mathcal P(S\times S)$, restricted).

**`[NET NEW]` Definition (extremal points).** $\Delta_S:=\{(x,x):x\in S\}$ (the diagonal, i.e. $=$); $\nabla_S := S\times S$ (total relation).

**`[NET NEW]` Theorem.** $\Delta_S\sqsubseteq\,\sim\,\sqsubseteq\nabla_S$ for every equivalence relation $\sim$ on $S$. $\Delta_S$'s classes are all singletons (finest possible); $\nabla_S$'s single class is all of $S$ (coarsest possible).

**`[NET NEW]` Theorem (meet).** $\bigcap_{i\in I}R_i$ is an equivalence relation whenever each $R_i$ is (restated from [Part 2.5](02-relations.md)), and is exactly the **meet** (greatest lower bound) of $\{R_i\}$ under $\sqsubseteq$ — i.e. the coarsest common refinement.

**`[NET NEW]` Theorem (join — resolves [Part 2.5](02-relations.md)'s flagged union-failure with a correct positive construction).** Define $\sim_1\vee\sim_2 :=$ the transitive closure of $(\sim_1\cup\sim_2)$. Then $\sim_1\vee\sim_2$ is the *least* equivalence relation containing both — the genuine join in the refinement lattice. This is a direct instance of the closure-operator machinery of [Part 5](05-order.md) (Order interlude, §5.3's closure-operator theorem). **`[REWORK — CORRECTED PER AUDIT, ROUND 2]` Correction:** the theorem-number citation ("Theorem 4.6") in earlier drafts of this line pointed at a theorem that does not exist under that number in `05-order.md`, nor as a Lean declaration in the repo — Round 2 of the audit (`aud-res.md`) flagged this as a genuine three-way internal inconsistency (this file, `05-order.md`, and the project's own memory notes all treated the closure-operator theorem as settled, and none of them actually have it built). The *mathematical* argument above is still correct — transitive closure genuinely is the closure operator whose fixed points are the transitive relations — but it currently rests on an unbuilt piece of machinery, not a citable theorem. See [`13-audit-round-2.md`](13-audit-round-2.md) §4.

**`[NET NEW]` Theorem (completeness).** $\{\text{equivalence relations on }S\}$, ordered by $\sqsubseteq$, is a **complete lattice** — direct instance of the Order interlude's Definition 4.3, and it slots into that interlude's closure-operator unification table (σ-algebra generation, topology generation, subgroup generation, convex hull, ..., **equivalence-relation refinement-join**) as the fifth row, now fully justified rather than merely asserted.

## 3.5 Duality and Indexed Families for Equivalences (`[NET NEW]`)

**`[NET NEW]` Theorem.** Complement of an equivalence relation is (almost) never itself an equivalence relation — complementing destroys reflexivity outright whenever $S\neq\varnothing$: $(x,x)\in\sim$ for all $x$ forces $(x,x)\notin\sim^c$ for all $x$, i.e. $\sim^c$ is irreflexive. Flagged as a genuine non-instance of Boolean duality, parallel to [Operations §6.8](06-operations.md)'s flag that operation-laws have no complement-style dual.

**`[NET NEW]` Theorem.** Every equivalence relation is converse-self-dual: $\sim^{-1}=\sim$, directly from symmetry. The *only* rich duality structure equivalence relations carry is the refinement lattice's $\sqsubseteq$-order-duality (3.4), mirroring $\sup/\inf$ duality ([Part 5](05-order.md)) rather than anything at the level of individual relations.

**`[NET NEW]` Definition/Theorem (indexed refinement lattice operations).** $\bigwedge_{i\in I}\sim_i := \bigcap_{i\in I}\sim_i$; $\bigvee_{i\in I}\sim_i :=$ transitive closure of $\bigcup_{i\in I}\sim_i$; both exist and are equivalence relations for arbitrary index sets $I$, by completeness (3.4). **Named forward reference:** a family of "coset relations modulo $n\mathbb Z^2$" for varying $n$ forms a directed system in this lattice, relevant to comparing multi-resolution torus mesh discretizations.

## 3.6 Summary Map

```
EquivalenceRelation = Reflexive ^ Symmetric ^ Transitive
   |
   v
Equivalence Classes -> class-equality criterion -> FUNDAMENTAL THEOREM
   (equiv rels <-> partitions), flagged counterexamples per dropped hypothesis
   |
   v
Quotient Sets -> pi_~ surjective -> UNIVERSAL PROPERTY (f respects ~ => unique f-bar)
   |
   v
Kernel of a function (GENERAL case only) -> ker(f) always an equiv. rel.
   -> classes = fibers -> coimage-image factorization
   FLAGGED BOUNDARY: algebraic kernel stays in Algebra.Models ([Part 8](08-morphisms.md))
   |
   v
REFINEMENT LATTICE [NET NEW] -- Delta_S (finest) <= ~ <= nabla_S (coarsest)
   meet = intersection (direct); join = transitive closure of union (NOT bare union)
   -> COMPLETE LATTICE, slots into Order interlude's closure-operator table
   |
   v
Duality: converse-self-dual (trivial); complement destroys reflexivity (flagged
   non-instance); indexed meet/join for arbitrary I
```

---

---

[← Back to Index](00-index.md)
