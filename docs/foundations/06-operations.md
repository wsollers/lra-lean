# Operations (`[RECAP]` for §§6.1–6.6; `[REWORK — CORRECTED PER AUDIT]` for §6.7 — the discarded `Law`/`Satisfies` design replaced by the repo's real `Signature`/`Model`/`SatisfiesEquation` mechanism)

[← Back to Index](00-index.md)

## 6.0 Geometric Intuition

An operation is a machine: feed elements of $S$ in, get an element of $S$ back. Closure is not a separately-verified property — it's definitional, built into the type $S^n\to S$. Every question in this chapter is an adjective you can ask of that machine before deciding what $S$ even is.

## 6.1 Arity

$\mathrm{IsOperation}_n(\omega,S):\equiv\omega:S^n\to S$. $n=0$: nullary, a distinguished constant. $n=1$: unary. $n=2$: binary, $x*y$ — the case this chapter studies almost exclusively.

## 6.2 Laws

$$\mathrm{Associative}(*,S):\equiv\forall x,y,z((x*y)*z=x*(y*z)) \qquad \mathrm{Commutative}(*,S):\equiv\forall x,y(x*y=y*x)$$
$$\mathrm{Idempotent}(*,S):\equiv\forall x(x*x=x) \qquad \mathrm{Cancellative} := \mathrm{LeftCancellative}\wedge\mathrm{RightCancellative}$$

**Theorem (generalized associativity).** Any parenthesization of $x_1*\cdots*x_n$ agrees. **Theorem (commuting factors).** Associative+commutative $\to$ any permutation of factors agrees — cites $\mathrm{Sym}(\{1,\dots,n\})$ ([Part 4.4](04-maps-functions-operators.md)) as a genuine instance, not a coincidence of notation. **Theorem (flagged, forward reference).** Cancellative does NOT imply invertible — $(\mathbb N,+)$ is cancellative with no additive inverses; motivates the $\mathbb Z$ construction from $\mathbb N$.

## 6.3 Identity Elements

**Theorem (uniqueness).** Left identity + right identity $\to$ they're equal (needs one of each side, not two of the same side). **Flagged counterexample.** $S=\{a,b\}$, $x*y:=y$: every element is a left identity, no right identity exists unless $|S|=1$ — shows the "one of each side" hypothesis is not a convenience.

## 6.4 Inverses

**Theorem (uniqueness of two-sided inverse — needs associativity, unlike identity-uniqueness).** The standard chain $y=y*e=y*(x*y')=(y*x)*y'=e*y'=y'$ uses associativity at the regrouping step — flagged as genuinely needing an extra hypothesis identity-uniqueness didn't need. **Definition (involution).** $\iota(\iota(x))=x$. **Theorem.** If every element has a two-sided inverse under an associative op, $x\mapsto x^{-1}$ is an involution — this is exactly why $\mathrm{Sym}(S)$'s inverse-function operation ([Part 4.4](04-maps-functions-operators.md)) is an involution. **Theorem (socks-and-shoes).** $(x*y)^{-1}=y^{-1}*x^{-1}$ — the SAME theorem, proved once here, retroactively certifying the Relations-interlude converse identity and the Maps-interlude composition-inverse identity as three instances of one abstract fact.

## 6.5 Distributivity

$$\mathrm{LeftDistributive}(*,+,S):\equiv\forall x,y,z(x*(y+z)=(x*y)+(x*z))$$

**Flagged, name clash.** "Absorption law" (Boolean-lattice self-interaction identity, e.g. $a\cup(a\cap b)=a$) vs. "absorbing element" (Part 6.6, a single element dominating one operation) are different notions sharing a root word — keep separated in the knowledge graph.

**Theorem.** Distributivity + additive identity $\to 0*x=0$ for all $x$ — the classical "anything times zero is zero" is a theorem, not a primitive axiom of arithmetic.

## 6.6 Absorbing (Zero) Elements

Direct dual of identity elements (uniqueness proof has the same shape). Duality here is a structural mirror-image of $\vee/\wedge$ order-duality ([Part 5.7](05-order.md)), though not literally an instance of converse-duality.

## 6.7 Compatibility, and the Repo's Equational Satisfaction Machinery (`[RECAP]` for 6.7.1–6.7.2; `[REWORK — CORRECTED PER AUDIT]` for 6.7.3, replacing the discarded `Law`/`Satisfies` design with the repo's real `Signature`/`Model`/`SatisfiesEquation` mechanism; see `06a-satisfaction-certificates.md` for worked cert names and `06b-model-theory-boundary.md` for the equational/relational scope boundary)

### 6.7.1 The canonical definition (`[RECAP]`)

$$\mathrm{RespectsRelation}(*,R,S):\equiv\forall x,y,x',y'\in S((xRx'\wedge yRy')\to(x*y)\,R\,(x'*y'))$$

$\mathrm{RespectsEquivalence}$ and $\mathrm{RespectsOrder}$ are THEOREMS obtained by instantiating $\mathrm{RespectsRelation}$ at a specific $R$ — not three independent definitions.

### 6.7.2 The well-defined-quotient-operation theorem (`[RECAP]`)

**Theorem.** $\mathrm{RespectsEquivalence}(*,\sim,S) \to \exists!\bar*: (S/\!\sim)\times(S/\!\sim)\to(S/\!\sim)\big(\forall x,y(\bar*([x]_\sim,[y]_\sim)=[x*y]_\sim)\big)$. An operation descends to the quotient iff it respects the equivalence relation. This is the exact mechanism for defining addition of points on $\mathbb R^2/\mathbb Z^2$.

### 6.7.3 `[REWORK — CORRECTED PER AUDIT]` — The Repo's Real Satisfaction Machinery, and the Cert-Naming Convention Repointed at It

**Audit correction, stated plainly.** A three-way audit against the live `lra-lean` repository (see `audit-results.md`, project knowledge) found that the `Law(S) := (S×S→S)→Prop` design originally proposed in this section does **not exist in the repo, and should not be built** — the repo already has a strictly more general, better-founded mechanism one level up, and porting the bespoke carrier-level version would be redundant, less general, and duplicate real work. This subsection replaces the discarded design with the repo's actual objects, and repoints the cert-naming convention at them. The earlier `Law`/`Satisfies` text is fully superseded; do not cite it.

**What the repo actually has (`LRA/UniversalAlgebra/Satisfaction/Definition.lean`).** Built on top of the pre-existing `Logic.Signature` / `Logic.FirstOrder.Model` / `Term` / `evaluateTerm` machinery (i.e., this is *Signature-and-Model* level, not bare-carrier-and-operation level):

- **`Equation`** — a pair of `Term`s over an arbitrary, multi-symbol `Signature` (not restricted to one binary operation; a signature can carry any finite collection of operation/relation/constant symbols).
- **`SatisfiesEquation (M : Model S) (equation) : Prop`** — checks the equation against a given `Model` of signature `S` under every variable assignment. This is the real analogue of what the discarded `Satisfies(*, S, ℓ)` was trying to be, except correctly generalized to arbitrary signatures rather than hand-restricted to one binary operation.
- **`EquationalTheory`** — a set of `Equation`s (the real analogue of the discarded "law-list").
- **`ModelsOfEquationalTheory`** / **`IsVariety`** — `IsVariety` asserts a class of models equals `ModelsOfEquationalTheory` for some theory; this is Birkhoff's H/S/P-characterization stated as a real Lean theorem, with the "→" direction definitionally free and the "←" direction (`modelsOfEquationalTheoryIsVariety`) one `sorry` away from complete, per the audit.

**Why this supersedes the discarded design, not merely renames it.** The discarded `Law(S)` only ever talked about one binary operation on one carrier at a time — a future two-operator law (e.g. distributivity) would have needed its own hand-written transport theorem, and the whole apparatus was blind to signatures with more than one operation symbol (rings, lattices, anything beyond a single $*$). `SatisfiesEquation`/`EquationalTheory` handles all of this uniformly, for free, because it operates at the `Signature`/`Term` level rather than hard-coding a single operation's arity into the type. This is a strictly more general and already-partially-proved formalization of exactly the same idea the discarded design was reaching for.

**Product/quotient transport — genuinely missing from the repo, but small.** The audit confirms the repo has `productModel`/`piModel` (`UniversalAlgebra/Product/Definition.lean`) and `quotientProjectionIsHomomorphism`/`Congruence` (`UniversalAlgebra/Quotient/Definition.lean`), which construct the relevant Models and exhibit canonical homomorphisms — but **no proved lemma of the exact shape** "if every factor Model satisfies equation $e$, the product Model satisfies $e$ too." This specific lemma is a real, currently-unwritten gap, not a renaming exercise, and the audit's own recommendation is the right scope for it:

> `productModel_satisfies_of_all_satisfy : (∀ i, SatisfiesEquation (S_i) equation) → SatisfiesEquation (productModel S_i) equation`

stated and proved directly against the existing `Satisfaction`/`Product` definitions — a small, targeted lemma, **not** a port of this document's discarded transport-theorem apparatus. The analogous quotient-side lemma (an equation satisfied by $M$ descends to $M$'s quotient by a congruence, when the quotient construction already gives you the projection homomorphism) is the corresponding gap on the `Quotient`/`Congruence` side.

#### Cert naming, repointed (`[NET NEW]`, corrected referent)

The cert-naming convention itself survives the audit as a **documentation and notes convention** — useful for referring to specific proved facts by a short, greppable name in this project's own markdown notes and git history — but it must name facts about the repo's real objects (`SatisfiesEquation`, `ModelsOfEquationalTheory`) rather than about the discarded `Law(S)` type.

| Cert kind | Naming pattern | Repointed meaning |
|---|---|---|
| **Atomic cert** | `Cert_⟨Carrier⟩_⟨Operator⟩_⟨Law⟩` | Shorthand for: "the `Model` of ⟨Carrier⟩'s signature satisfies the `Equation` corresponding to ⟨Law⟩ applied to ⟨Operator⟩" — e.g. `Cert_Z_Add_Commutative` names the fact `SatisfiesEquation (ℤ's Model) (x + y ≈ y + x)`, however that Model/Equation pair is actually named in the Lean source. |
| **Binary-law cert** | `Cert_⟨Carrier⟩_⟨Op1⟩⟨Op2⟩_⟨Law⟩` | Same repointing, for equations mentioning two operation symbols (e.g. distributivity). |
| **Structure cert** | `StructCert_⟨Carrier⟩_⟨StructureName⟩` | Shorthand for `IsVariety`/`ModelsOfEquationalTheory` membership, or (for structures already given a bundled Lean definition in `AlgebraicStructures/*`, which the audit confirms is the far more mature layer — see [`07-algebraic-structures.md`](07-algebraic-structures.md)) shorthand for that bundled structure's proof term directly. |
| **Transport cert** | `Cert_⟨Carrier⟩_⟨Operator⟩_⟨Law⟩_via_⟨TransportLemma⟩` | Names a fact obtained via the small product/quotient lemmas above, once written — e.g. `Cert_Z_Add_Commutative_via_QuotientTransport` once the quotient-side lemma exists. |

**Binding rule, unchanged in spirit.** A `StructCert_*` name is still shorthand for a conjunction/membership fact, never for a freshly-restated equation — the discipline this convention exists to enforce (don't let "complete ordered field" restate commutativity of $+$ three levels down) is unaffected by which underlying Lean mechanism it points to. See [`06a-satisfaction-certificates.md`](06a-satisfaction-certificates.md) for the worked cert names, now annotated per-cert with their real repo status where checked.

**`[REWORK]` Named placement note, corrected.** `SatisfiesEquation`/`EquationalTheory`/`IsVariety` already live in `LRA/UniversalAlgebra/Satisfaction/`, not in `LRA/Operation/`. This document (`Operations`) is downstream of that layer conceptually — `LRA/Operation/Laws/*` (Associative, Commutative, Distributive, Identity, Inverse, Cancellation, Idempotent, Absorbing, Absorption, Nilpotent, Closure, QuotientCompatible — all twelve present in the repo per the audit, `Definition`/`Consequences` sorry-free, but with real sorry debt in `Theorems`/`Relationships`/`FailureModes`, heaviest in `Inverse` at 26 and `Cancellation` at 23) states the bare predicates this document's §6.2–6.6 already describe; `UniversalAlgebra/Satisfaction` is the separate, Signature-level layer that lets those bare predicates be checked against arbitrary Models uniformly. Do not conflate the two when reading the repo — `Operation/Laws` and `UniversalAlgebra/Satisfaction` are siblings serving different granularities, not a redundant pair.

**`[REWORK]` Forward-looking payoff, corrected scope.** The realistic near-term target is the two missing small lemmas (product-transport, quotient-transport, both against `SatisfiesEquation`) plus finishing `modelsOfEquationalTheoryIsVariety`'s one remaining `sorry` — not building a new, separate apparatus. Once those exist, the cert names in [`06a-satisfaction-certificates.md`](06a-satisfaction-certificates.md) become directly citable against real Lean theorem names rather than aspirational shorthand.
## 6.8 Duality and Indexed Families (`[RECAP]`)

**Theorem (flagged non-instance).** Part 6.2's laws have no complement-style dual; the duality that *does* apply is opposite-operation duality ($x*^{op}y := y*x$) — the operation-theoretic analogue of converse-duality ([Part 2.4](02-relations.md)), a different object being flipped.

**Summary map.**
```
Arity -> n-ary op, closure built into the type
   |
   v
Laws: Associative, Commutative, Idempotent, Cancellative
   -> generalized associativity/commutativity cite Sym(S) from Maps interlude
   -> Cancellative does NOT imply Invertible -- flagged, motivates Z construction
   |
   +--> IdentityElements -> uniqueness (needs one of each side) -- FLAGGED counterexample
   +--> Inverses -> uniqueness NEEDS associativity (sharper than identity case)
        -> inverse map is an INVOLUTION -> socks-and-shoes law (ONE theorem, 3 instances)
   +--> Distributivity -> 0*x=0 as a THEOREM, not an axiom
   +--> AbsorbingElements -> dual to IdentityElements
   |
   v
Compatibility: RespectsRelation -> RespectsEquivalence (well-defined quotient op)
   -> RespectsOrder -> divisibility preorder (Satz 1.24)
   |
   v
[REWORK -- CORRECTED PER AUDIT] REPO'S REAL SATISFACTION MACHINERY (6.7.3)
   AUDIT FOUND: Law(S) design does NOT exist in repo and should NOT be built --
   repo already has a strictly more general mechanism one level up.
   Real objects: Signature, Model, Term, Equation, SatisfiesEquation, IsVariety
   (in LRA/UniversalAlgebra/Satisfaction/ -- Birkhoff HSP, 1 sorry from complete)
   GENUINELY MISSING (small, targeted, not a new apparatus):
     - product-transport lemma against SatisfiesEquation + productModel
     - quotient-transport lemma against SatisfiesEquation + Congruence/Quotient
   Cert naming SURVIVES as a documentation convention, REPOINTED at
   SatisfiesEquation / ModelsOfEquationalTheory instead of the discarded type.
   See audit-results.md (project knowledge) for full detail.
   ==> Operation/Laws/* (12 families, all present) states the bare predicates;
       UniversalAlgebra/Satisfaction is the separate Signature-level checking layer
```

**See also:** [`06a-satisfaction-certificates.md`](06a-satisfaction-certificates.md) for worked cert names, now annotated against real repo status; [`06b-model-theory-boundary.md`](06b-model-theory-boundary.md) for the equational/relational scope boundary — largely confirmed by the audit's finding that `IsVariety` already formalizes Birkhoff's theorem at full Signature generality.

---

---

[← Back to Index](00-index.md)
