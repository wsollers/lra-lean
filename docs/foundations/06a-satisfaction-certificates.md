# Satisfaction Certificates: Worked Cert Trees for ℕ, ℤ, ℚ, ℝ (`[NET NEW]`; header `[REWORK — CORRECTED PER AUDIT]`)

[← Back to Index](00-index.md)

**`[REWORK — CORRECTED PER AUDIT]` Correction notice, read this first.** A three-way audit against the live `lra-lean` repo (`audit-results.md`, project knowledge) found that the `Law(S)`/`Satisfies` type this file originally cited from [`06-operations.md`](06-operations.md) §6.7.3 does not exist in the repo and should not be built — the repo already has a strictly more general mechanism (`Signature`/`Model`/`Equation`/`SatisfiesEquation`/`IsVariety`, in `LRA/UniversalAlgebra/Satisfaction/`). §6.7.3 has been reworked accordingly. **Every cert name below still stands as a documentation convention**, but each now names a fact about `SatisfiesEquation`/`ModelsOfEquationalTheory` (or, where a bundled Lean structure already exists in `AlgebraicStructures/*`, that structure's proof term directly) rather than about the discarded type. Where the audit checked a specific fact's real repo status, that is now noted inline as **[repo status: ...]**; where it did not, the cert remains aspirational shorthand pending a dedicated pass.

**Depends on:** [`06-operations.md`](06-operations.md) §6.7.3 (corrected) for the cert-naming convention itself and its real referent. This file contains no machinery of its own — it is the *instance* layer, kept separate from the *machinery* file precisely so `06-operations.md` doesn't become busy as the number-system tower grows (per the design decision recorded in [`10-open-items.md`](10-open-items.md)).

## 0. Purpose and Reading Convention

Every cert below is named per the standardized convention (now repointed, per the correction above):

| Cert kind | Pattern | Meaning |
|---|---|---|
| Atomic | `Cert_⟨Carrier⟩_⟨Operator⟩_⟨Law⟩` | shorthand for a `SatisfiesEquation` fact — one law, one operator, one carrier |
| Binary-law | `Cert_⟨Carrier⟩_⟨Op1⟩⟨Op2⟩_⟨Law⟩` | shorthand for a `SatisfiesEquation` fact relating two operators (distributivity) |
| Structure | `StructCert_⟨Carrier⟩_⟨StructureName⟩` | a named conjunction of other certs, or a pointer to an existing bundled proof term in `AlgebraicStructures/*` — never restates a law |
| Transport | `Cert_⟨Carrier⟩_⟨Operator⟩_⟨Law⟩_via_⟨TransportTheorem⟩` | obtained generically, not proved by hand |

**Binding rule, restated.** A `StructCert_*` is *only* ever a conjunction of citations. If you find yourself writing a fresh $\forall x,y(\dots)$ inside a `StructCert_*` definition, that is a violation of the convention — split it into an atomic cert first, prove it (or transport it), and cite it.

## 1. ℕ (and ℕ₀) — the base case, no transport available, proved by hand once

Since ℕ is not built as a product or a quotient (Peano-successor / primitive inductive carrier, per the project's `NumberSystemTower.NaturalNumberInterface` convention), its certs are the base of the citation chain — proved directly by induction, never transported.

- `Cert_N0_Add_Commutative` — proved by induction on the second argument, citing the recursive definition of $+$.
- `Cert_N0_Add_Associative` — proved by induction, standard.
- `Cert_N0_Add_HasTwoSidedIdentity` — witness $0$.
- `Cert_N0_Mul_Commutative`, `Cert_N0_Mul_Associative`, `Cert_N0_Mul_HasTwoSidedIdentity` (witness $1$) — proved by induction, standard.
- `Cert_N0_MulAdd_Distributive` — proved by induction, standard.
- **Explicitly absent:** `Cert_N0_Add_HasTwoSidedInverses` — false; this is the load-bearing fact motivating the ℤ construction (flagged already in [`06-operations.md`](06-operations.md) §6.2, "cancellative does not imply invertible").

`StructCert_N0_CommutativeMonoid` (for $+$) `:= [Cert_N0_Add_Commutative, Cert_N0_Add_Associative, Cert_N0_Add_HasTwoSidedIdentity]` — a genuine structure cert, pure conjunction, no restatement.

## 2. ℤ from ℕ₀ × ℕ₀ — the first transport example, in full

Construction: $\mathbb Z := (\mathbb N_0\times\mathbb N_0)/\!\sim$, $\sim\,:\equiv (a,b)\sim(c,d) :\equiv a+d=b+c$, $+_{\mathrm{pair}}(a,b),(c,d) := (a+c,b+d)$.

**Step 1 — product transport.**
$$\mathrm{Cert\_N0_Add\_Commutative} \;\xrightarrow{\text{product-transport}}\; \mathrm{Cert\_N0xN0\_AddPair\_Commutative\_via\_ProductTransport}$$
$$\mathrm{Cert\_N0_Add\_Associative} \;\xrightarrow{\text{product-transport}}\; \mathrm{Cert\_N0xN0\_AddPair\_Associative\_via\_ProductTransport}$$
(and similarly for `HasTwoSidedIdentity`, witness $(0,0)$ — no inverses to transport yet, since ℕ₀ has none).

**Step 2 — the one genuinely new closure check (not a citation).** Verify $\mathrm{RespectsEquivalence}(+_{\mathrm{pair}}, \sim, \mathbb N_0\times\mathbb N_0)$: if $a+d=b+c$ and $a'+d'=b'+c'$, then $(a+a')+(d+d') = (b+b')+(c+c')$ — a short rearrangement citing `Cert_N0_Add_Commutative` and `Cert_N0_Add_Associative` internally, but the closure fact itself is new work specific to this $\sim$.

**Step 3 — quotient transport.**
$$\mathrm{Cert\_N0xN0\_AddPair\_Commutative\_via\_ProductTransport} \;\xrightarrow{\text{quotient-transport}}\; \mathrm{Cert\_Z\_Add\_Commutative\_via\_QuotientTransport}$$
$$\mathrm{Cert\_N0xN0\_AddPair\_Associative\_via\_ProductTransport} \;\xrightarrow{\text{quotient-transport}}\; \mathrm{Cert\_Z\_Add\_Associative\_via\_QuotientTransport}$$
Identity transports to witness $[(0,0)]_\sim$. **Inverses are new** (not transported, since ℕ₀×ℕ₀ under $+_{\mathrm{pair}}$ has none either) — `Cert_Z_Add_HasTwoSidedInverses` is proved directly: $[(a,b)]_\sim$'s inverse is $[(b,a)]_\sim$, a short one-line check, the first genuinely new algebraic fact ℤ has over ℕ₀.

**Multiplication on ℤ** — defined as $(a,b)\times_{\mathrm{pair}}(c,d) := (ac+bd,\, ad+bc)$ (representing $(a-b)(c-d)$). This is *not* a coordinatewise product in the Part 6.7.3 sense (it mixes coordinates), so `Cert_Z_Mul_Commutative` and `Cert_Z_Mul_Associative` are **not** transport certs — they require direct verification citing `Cert_N0_Mul_Commutative`/`Cert_N0_Mul_Associative`/`Cert_N0_MulAdd_Distributive` inside the computation, then a `RespectsEquivalence` check for $\times_{\mathrm{pair}}$ against $\sim$, then descent via §6.7.2 directly (not via the product-transport theorem, since the operation itself isn't of product shape). This is flagged explicitly as a case where the *quotient* half of the machinery applies but the *product* half does not — worth remembering when doing ℚ below, where the analogous multiplication *is* closer to a genuine product shape.

**Structure cert.**
$$\mathrm{StructCert\_Z\_CommutativeRing} := \big[\mathrm{Cert\_Z\_Add\_Commutative\_via\_QuotientTransport},\ \mathrm{Cert\_Z\_Add\_Associative\_via\_QuotientTransport},$$
$$\mathrm{Cert\_Z\_Add\_HasTwoSidedInverses},\ \mathrm{Cert\_Z\_Mul\_Commutative},\ \mathrm{Cert\_Z\_Mul\_Associative},\ \mathrm{Cert\_Z\_MulAdd\_Distributive}\big]$$
— a pure conjunction of citations, per the binding rule; matches `07-algebraic-structures.md`'s `CommutativeRing` definition exactly, now with each conjunct traceable to a named cert.

## 3. ℚ from ℤ × (ℤ∖{0}) — same shape, sketched

Construction: $\mathbb Q := (\mathbb Z\times(\mathbb Z\setminus\{0\}))/\!\sim$, $(a,b)\sim(c,d):\equiv ad=bc$, $+_{\mathrm{pair}}(a,b),(c,d) := (ad+bc, bd)$.

- `Cert_Z_Add_Commutative_via_QuotientTransport` and `Cert_Z_Mul_Commutative` (from §2 above) are cited inside the closure check for this new $\sim$ — note the citation chain is now two levels deep (ℕ₀ → ℤ → ℚ), and at no point does any commutativity fact get re-derived from scratch.
- `Cert_Q_Add_Commutative_via_QuotientTransport`, `Cert_Q_Add_Associative_via_QuotientTransport`: same shape as ℤ's, one level up.
- `Cert_Q_Mul_HasTwoSidedInverses` (excluding $0$) is the genuinely new fact ℚ has over ℤ — $[(a,b)]_\sim^{-1} = [(b,a)]_\sim$ for $a\neq0$, proved directly, not transported (ℤ has no multiplicative inverses to transport from).
- `StructCert_Q_Field` cites `StructCert_Z_CommutativeRing`-shaped facts plus the new inverse cert plus nonzero-unity — a pure conjunction, matching `07-algebraic-structures.md`'s `Field` definition.

## 4. ℝ — the shape, without committing to one of the five constructions

Regardless of which of the five ℝ-constructions (Dedekind cuts / Cauchy sequences / Cantor nested intervals / interval arithmetic / dyadic sequences) is used as the working definition, the cert-tree shape is the same: each construction is a quotient (Cauchy sequences mod "difference tends to 0"; dyadic sequences mod eventual-agreement; etc.) or a direct order-completion (Dedekind cuts), and:

- For the four quotient-shaped constructions: `Cert_R_Add_Commutative_via_QuotientTransport` etc., citing the corresponding ℚ certs from §3 inside the closure check, exactly as ℚ cited ℤ and ℤ cited ℕ₀.
- For Dedekind cuts specifically: the construction is not a bare algebraic quotient, so the additive/multiplicative certs are proved directly against the cut-arithmetic definitions, citing ℚ's certs internally rather than via the generic quotient-transport theorem — flagged the same way ℤ's multiplication was flagged in §2.
- **The one cert that is never a transport cert, for any construction:** `StructCert_R_OrderComplete` (Dedekind completeness / least-upper-bound property) — this is not an equational law at all (it needs $\exists$ and an order relation), so it is **out of scope for `Law(S)`** per [`06-operations.md`](06-operations.md) §6.7.3's equational restriction, and is instead a `Logic.Signature/Model`-level fact, per the boundary drawn in [`06b-model-theory-boundary.md`](06b-model-theory-boundary.md).

**Final structure cert for ℝ, stated to show the "busy document" problem is avoided.**
$$\mathrm{StructCert\_R\_CompleteOrderedField} := \big[\mathrm{StructCert\_R\_Field},\ \mathrm{StructCert\_R\_OrderedRing},\ \mathrm{StructCert\_R\_OrderComplete}\big]$$
Note this definition never mentions commutativity, associativity, or distributivity directly — those live two or three citation-hops down, inside `StructCert_R_Field`, which itself cites `Cert_R_Add_Commutative_via_QuotientTransport` (or the direct Dedekind-cut proof), which itself cites the corresponding ℚ cert. This is the precise mechanism answering the original worry: *"complete ordered field addition is commutative should refer to the other"* — it does, by construction of the cert tree, and the top-level definition stays exactly three lines long regardless of how deep the citation chain underneath it grows.

## 5. Summary Diagram

```
Cert_N0_Add_Commutative (proved by induction, BASE CASE, no transport)
   |
   v  [product-transport]
Cert_N0xN0_AddPair_Commutative_via_ProductTransport
   |
   v  [quotient-transport, after 1 closure check on ~]
Cert_Z_Add_Commutative_via_QuotientTransport -----------+
   |                                                      |
   v  [quotient-transport, after 1 closure check on ~]    | (cited inside
Cert_Q_Add_Commutative_via_QuotientTransport              |  StructCert_Z_CommutativeRing,
   |                                                      |  a pure conjunction)
   v  [quotient-transport or direct cut-arithmetic proof]  |
Cert_R_Add_Commutative_via_QuotientTransport (or direct)  |
   |                                                      v
   v                                          StructCert_Z_CommutativeRing
StructCert_R_Field
   |
   v  [pure conjunction, adds OrderedRing + OrderComplete -- NEITHER is a Law(S) cert]
StructCert_R_CompleteOrderedField
```

Every arrow in this diagram is either a transport theorem (cited, zero new casework) or a single, isolated, explicitly-flagged closure check — never a re-derivation of a commutativity/associativity fact already established one level down.

## 6. `[REWORK — CORRECTED PER AUDIT]` Note on Real Repo Maturity

The audit found `LRA/AlgebraicStructures/` already contains real, granular, mostly-sorry-free directories for essentially every structure named in this file's diagrams — including `CompleteOrderedField/`, `OrderedField/`, `OrderedGroup/`, `OrderedRing/`, `LinearlyOrderedGroup/`, `LinearlyOrderedRing/`, `Archimedean/`, and a full lattice family (`Lattice`, `BooleanAlgebra`, `DistributiveLattice`, `BoundedLattice`, `JoinSemilattice`, `MeetSemilattice`) — by name, already, considerably more built-out than this file assumed when first written. **Practical consequence:** `StructCert_R_CompleteOrderedField` and similar structure certs above should, where possible, be repointed to cite the *existing* bundled Lean structure in `AlgebraicStructures/CompleteOrderedField/` directly, rather than treated as a fresh conjunction to be built from scratch. Before writing any new Lean content against this file's cert trees, check whether the target structure already has a home in `AlgebraicStructures/*` first — the audit's own recommendation is to treat that directory as the mature, ground-truth layer for bundled structures, with `UniversalAlgebra/Satisfaction`'s `SatisfiesEquation`/`IsVariety` reserved for the more general Signature-level equational reasoning underneath it.
