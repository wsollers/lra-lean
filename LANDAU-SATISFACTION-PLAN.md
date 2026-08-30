# Landau Satisfaction Plan

Planning document produced in response to
`docs/tool-prompts/landau-generic-operation-proving-plan.md`. **No `.lean`
file was edited to produce this document.** It surveys the repo's current
state against the foundations-docs design, extends the theorem crosswalk to
Chapters II–V at a coarse level, and lays out an ordered plan for closing the
gap between Landau's 301-theorem checklist and generically-proved, cert-cited
Lean declarations.

Companion documents: [`LANDAU-THEOREMS.md`](LANDAU-THEOREMS.md) (the full
checklist), [`LANDAU-CROSSWALK.md`](LANDAU-CROSSWALK.md) (Chapter I only, to
be extended per this plan), [`docs/foundations/16-landau-cert-naming-history.md`](docs/foundations/16-landau-cert-naming-history.md)
(the binding cert-naming convention).

---

## 1. Survey: generic machinery vs. what the foundations docs claim

Verified by reading the actual `.lean` source, not `ProofsToDo.md` files
(per the repo's own binding policy in `docs/foundations/13-audit-round-2.md`).

| Claim in `docs/foundations/*` | Verified against repo | Status |
|---|---|---|
| `Equation`/`SatisfiesEquation`/`EquationalTheory`/`ModelsOfEquationalTheory`/`IsVariety` exist in `LRA/UniversalAlgebra/Satisfaction/Definition.lean`, Signature-and-Model level | Confirmed. `SatisfiesEquation` (line 97) is `∀ assignment, evaluateTerm M assignment lhs = evaluateTerm M assignment rhs`, exactly as documented. | **Matches doc** |
| `modelsOfEquationalTheoryIsVariety` is "one `sorry` from complete" | Confirmed: single `sorry` at `Satisfaction/Definition.lean:312`, nothing else in the file. | **Matches doc** |
| Product/quotient transport lemmas against `SatisfiesEquation` are "confirmed missing" | Confirmed absent. Grepped all of `LRA/UniversalAlgebra/` for `productModel_satisfies`, `ProductTransport`, `QuotientTransport` — zero hits. `productModel`/`piModel` (`Product/Definition.lean`) and `quotientModel`/`Congruence` (`Quotient/Definition.lean`) exist and are usable, but no lemma of the shape "if every factor/the source satisfies equation e, so does the product/quotient" exists anywhere. | **Matches doc — still genuinely missing** |
| `equationTransportsAlongSurjection` exists (Round 2 finding, upgrade from Round 1) | Confirmed: `Homomorphism/Definition.lean:468`, one `sorry` at line 475. This is the **H**-side (homomorphic-image) transport; still no **P**-side (product) transport at all. | **Matches doc** |
| `Operation/Laws/*` sorry debt ("~120 sorries, heaviest Inverse 26, Cancellation 23") | Recounted directly: Absorbing 9, Absorption 6, Associative 7, Cancellation 23, Closure 6, Commutative 7, Distributive 9, Idempotent 3, Identity 9, Inverse 26, Nilpotent 7, QuotientCompatible 0. Total **112** (doc says "~120" — close, roundable drift, not a real discrepancy). Inverse (26) and Cancellation (23) confirmed heaviest. | **Matches doc (minor recount drift only)** |
| `AlgebraicStructures/*` already has granular, mostly-sorry-free directories for the full hierarchy through `CompleteOrderedField`, `Archimedean`, the lattice family | Confirmed: all named directories exist. Spot-checked `CompleteOrderedField/*.lean` — **zero** `sorry` in any of `Characterizations`, `Consequences`, `Definition`, `Examples`, `Laws`, `Relationships`, `Theorems`. This layer is real and mature, as the docs claim. | **Matches doc** |

### 1.1 New findings, not previously documented anywhere in `docs/foundations/*`

These are concrete, repo-verified gaps that the existing docs do not mention.
They matter directly for sequencing the plan in §3.

1. **Landau's own ℕ construction has no bridge into the number-system
   interface layer at all.** `NaturalNumbers/Constructions/Landau/` has no
   `Instances.lean` and no `Satisfy_Generic.lean` — unlike every sibling
   construction checked (`WholeNumbers/Constructions/Landau`,
   `RationalNumbers/Constructions/RationalQuotientFractions`,
   `RealNumbers/Constructions/Dedekind`,
   `ComplexNumbers/Constructions/OrderedPairs`,
   `Integers/Constructions/{QuotientOrderedPairs,Tao,Mendelson}`, all of
   which have both). Concretely: nothing anywhere constructs a
   `NaturalNumberModel.ofCarrier` instance from the Landau ℕ carrier (which
   would require a `CommutativeSemiringLaws` instance on it), and without
   that there is no `LRA.Logic.FirstOrder.Model NaturalNumbersFirstOrderSignature`
   for the Landau carrier — meaning `Cert_N0_Add_Commutative` etc. cannot
   currently be phrased as an actual `SatisfiesEquation` fact against Landau's
   ℕ at all. `06a-satisfaction-certificates.md` §1 implicitly assumes this
   bridge exists ("proved directly by induction" reads as if the resulting
   fact is at least statable against a `Model`); it is not yet, for this
   specific construction. This is real, currently-unwritten wiring work, not
   a proof debt on an existing declaration.

2. **The two Signature types are not the ones you'd guess from the file
   layout, and the number-system Interface layer has three different
   "Signature" concepts in play.** `NaturalNumbers/Interface/UniversalAlgebra/Signature/Definition.lean`
   defines `NaturalNumbersAlgebraicSignature : LRA.Identity.AlgebraicSignature`
   — a *third*, distinct type from both `LRA.Logic.Signature` (what
   `SatisfiesEquation`/`Model` actually require) and
   `NaturalNumbersFirstOrderSignature : LRA.Logic.Signature`
   (`Interface/Signature/Definition.lean`, which *is* the right type and is
   what `NaturalNumberModel.firstOrderModel` in
   `Interface/ModelTheory/Model.lean` already targets). Nothing under
   `Interface/UniversalAlgebra/*` is used by the `SatisfiesEquation`
   machinery anywhere the audit checked. This is the same shape of
   naming ambiguity flagged as "Family D" in
   `docs/interface-model-standardization-inventory.md`, just for a
   different name pair, on a different refactor track (that inventory
   document is about `Interface/ModelTheory/*` file-naming standardization,
   not about the equational satisfaction machinery — the two projects are
   independent and should stay that way, but a future reader of this plan
   should import `NaturalNumbersFirstOrderSignature`, never
   `NaturalNumbersAlgebraicSignature`, when building `SatisfiesEquation`
   facts). Not proposing to fix the naming collision here — flagged so the
   next implementer doesn't import the wrong one.

3. **`06a-satisfaction-certificates.md` §2's worked ℤ example
   (`ℤ := (ℕ₀×ℕ₀)/~`) does not describe this repo's `WholeNumbers/Constructions/Landau`.**
   That construction (`WholeNumbers/Constructions/Landau/Carrier.lean`) is
   *axiomatic*: it takes an abstract `NaturalArithmeticForWholeNumbers`
   record (a `PeanoSystem` plus order-compatibility hypotheses stated as
   fields) and is generic over any model of that interface — it does not
   itself construct anything as a literal pair-quotient, so `productModel`/
   `quotientModel` do not apply to it directly. The literal
   `(ℕ₀×ℕ₀)/~`-shaped construction 06a describes lives in a **different**
   top-level subject: `NumberSystems.Integers.Constructions.QuotientOrderedPairs`
   (sibling constructions `Tao`, `Mendelson` also exist under
   `NumberSystems.Integers`). This means: "the reused Landau construction for
   integers" named in the task prompt (`WholeNumbers/Constructions/Landau`)
   and "the construction the transport-theorem worked example is about"
   (`Integers/Constructions/QuotientOrderedPairs`) are not the same Lean
   declarations, even though both are legitimately "ℤ from Landau's
   axioms" in different senses (`WholeNumbers` = ℤ realized via the
   book's five-axiom natural-number data with a two-sided order and
   subtraction bolted on; `Integers/QuotientOrderedPairs` = ℤ realized as
   the literal ℕ₀×ℕ₀ quotient Landau's book actually uses for the fraction/cut
   constructions' *shape*, though Landau's own book builds ℤ differently
   again). **This is flagged as an open question in §4** — which
   construction Chapter I/II crosswalk work and the transport theorems
   should target is a real decision, not resolved by this survey.

---

## 2. Survey: Chapters II–V coarse crosswalk

Coarse, chapter-level only, per the task's own scope note. "Equational" =
transport-theorem-eligible per the `06b-model-theory-boundary.md` template
(pure `∀x̄ (t₁≈t₂)`, term-only, no `∨/∃/≠/≤`). "Relational" = must route
through `Relations`/`Order`/`Operations §6.7.1 RespectsRelation`/general
`Logic.Signature/Model` per the same boundary.

| Chapter | Theorem range | Natural Lean target construction(s) | Rough law-shaped (equational) fraction | Rough order/relational fraction | Notes |
|---|---|---|---|---|---|
| II — Fractions/ℚ | 37–115 (79 theorems) | `RationalNumbers/Constructions/RationalQuotientFractions` (already has `Satisfy_Generic.lean`, 0 sorries in that file; `Laws.lean` 8 sorries, `Behavior.lean` 12) | ~10 theorems (58,59,69,70,71,92,93,102,103,104 — the add/mul commutative/associative/distributive laws, repeated once for fractions and once for the derived rational numbers) | ~55 theorems (trichotomy 41,81; order-preservation-under-op 61,62,72,96,105; density 55,91; Archimedean 115 — second-sort, routes to many-sorted `Logic.Signature/Model` per `06b` §1, not the equational fragment) | ~14 theorems (37–39,78–80 equivalence-relation reflexive/symmetric/transitive; 67,77,101,110 existence-of-solution definitional theorems) don't cleanly fit either bucket — they're either equivalence-relation boilerplate (belongs in `Relations`/`03-equivalences.md`, not `Operations`) or definitional/uniqueness existence statements (belong as direct `Cert_*`-adjacent but non-equational lemmas, since they assert `∃!`, not a bare equation) |
| III — Cuts/ℝ | 116–162 (47 theorems) | `RealNumbers/Constructions/Dedekind` (has `Satisfy_Generic.lean`, 0 sorries in that file; `Laws.lean` 8, `WellDefinedness.lean` 10) | ~6 theorems (130,131,142,143,144, plus 151 `ξ·1*=ξ` as an identity-element instance) | ~35 theorems (order/trichotomy 121–128,145–149,154; density 159) | 161 (unique square root, `∃!`) and 162 (irrationality of √2, a negative existence result) are neither — both are genuinely second-order/existential, route to the Henkin layer or stay as bespoke direct proofs, never `Cert_*` |
| IV — Real Numbers | 163–205 (43 theorems) | `RealNumbers/Constructions/Dedekind` (same target as Ch. III — Landau's Ch. IV real numbers **are** his Ch. III cuts, re-presented as signed differences of positive cuts) | ~10 theorems (175,177,179,180,186,194,195,197,198,201 — commutativity/associativity/identity/sign-rule identities, the exact `SignNegationLaws`-shaped derivation chain `landaureview.md` §27 already recommends) | ~28 theorems (order/sign 166–173,182,183,188–191; trichotomy 167) | Theorem 205 (Dedekind's Fundamental Theorem — every two-class partition of ℝ has exactly one separating real) is the sharpest possible non-equational case in the entire checklist: it quantifies over *all partitions*, i.e. genuinely second-order, and must route to the Henkin second-order layer per `06b` §3 item 4, never treated as an equational or even ordinary-relational fact |
| V — Complex Numbers | 206–301 (96 theorems) | `ComplexNumbers/Constructions/OrderedPairs` (has `Satisfy_Generic.lean`, 0 sorries there; `Laws.lean` 18 sorries — the largest single `Laws.lean` sorry count of any construction surveyed) | ~45–50 theorems — by far the highest equational fraction of any chapter: nearly all of the negation/subtraction identity block (210–239), the division identity block (240–256), and the conjugate-homomorphism block (257–263) are pure term equations over `+,·,−,÷,conj`; the power-law block (290–297) is equational once iteration is treated as a derived operation symbol | ~15 theorems (221 no-zero-divisors as an `↔`; 264–270,272–273 absolute-value inequalities — `\|·\|:ℂ→ℝ` is a genuine second sort, so **all** absolute-value theorems including 271/287 triangle inequality route to many-sorted `Logic.Signature/Model`, never the equational fragment, exactly as `06b` predicts for the triangle inequality generally) | 274 (pigeonhole for finite sets) and 275–289 (indexed sum/product family) are a self-contained sub-topic: recursively-defined finite iteration over a range, closer to `Operations §6.8`/iteration machinery than to either equational-law or order-relational buckets — worth scoping as its own small sub-plan rather than forcing it into this table's two columns |

**Overall reading:** the equational fraction rises sharply from Chapter II
(~13%) to Chapter V (~50%), because the later chapters are dominated by
*derived arithmetic identities* (sign rules, conjugate homomorphism laws,
quotient algebra) of exactly the shape Landau proves by hand and
`landaureview.md` §27–28 already flags as ideal transport/derivation-chain
material, while the order/relational content shrinks as a fraction (though
not in absolute count) because order and trichotomy are established once
per number system rather than re-derived per operation.

---

## 3. Ordered plan

### 3.1 The two missing transport theorems — exact statement, location, name

Both go in `LRA/UniversalAlgebra/Satisfaction/`, as a new file
`LRA/UniversalAlgebra/Satisfaction/Transport.lean` (new file, since neither
`Product/Definition.lean` nor `Quotient/Definition.lean` currently imports
`Satisfaction/Definition.lean` — the transport lemmas are the first thing to
need both `Satisfaction` and `Product`/`Quotient` in the same file, so they
should not be added to either existing file without also adding a
possibly-unwanted new import edge in the wrong direction).

**Product transport.**

```lean
import LRA.UniversalAlgebra.Satisfaction.Definition
import LRA.UniversalAlgebra.Quotient.Definition  -- for productModel; actually in Product/Definition.lean

namespace LRA.UniversalAlgebra

theorem productModel_satisfiesEquation_of_both_satisfy
    {S : Signature} {Variable : Type}
    {M : Model.{u} S} {N : Model.{v} S}
    (equation : Equation S Variable)
    (satisfiesM : SatisfiesEquation M equation)
    (satisfiesN : SatisfiesEquation N equation) :
    SatisfiesEquation (productModel M N) equation
```

with the `Index`-indexed generalization against `piModel` stated alongside
it (both, not just the binary case — `07-algebraic-structures.md`'s
eventual `ℝ^n` and indexed-family use cases need the `piModel` form, and
proving the binary case first as a warm-up then generalizing is the right
order, not a reason to skip the general one):

```lean
theorem piModel_satisfiesEquation_of_all_satisfy
    {S : Signature} {Variable : Type} {Index : Type w}
    {family : Index → Model.{u} S}
    (equation : Equation S Variable)
    (allSatisfy : ∀ i, SatisfiesEquation (family i) equation) :
    SatisfiesEquation (piModel family) equation
```

Proof sketch (both): unfold `SatisfiesEquation`, take an arbitrary
assignment into the product/pi domain, push `evaluateTerm` through
`productModel`/`piModel`'s componentwise `interpretFunction` by induction on
the `Term` structure (this needs a small helper lemma —
`evaluateTerm_productModel` / `evaluateTerm_piModel`, stating that
evaluating a term in the product model equals the pair of evaluating it in
each factor — this helper does not currently exist either and should be
proved first, as a `Consequences.lean`-level lemma in `Product/Consequences.lean`
before the transport theorem itself, since the transport proof is otherwise
not a one-liner induction but a re-derivation of it inline), then apply
`satisfiesM`/`satisfiesN` (or `allSatisfy i`) pointwise and recombine.

**Quotient transport.**

```lean
import LRA.UniversalAlgebra.Satisfaction.Definition
import LRA.UniversalAlgebra.Quotient.Definition

namespace LRA.UniversalAlgebra

theorem quotientModel_satisfiesEquation_of_satisfies
    {S : Signature} {Variable : Type}
    {M : Model.{u} S} (congruence : Congruence M)
    (equation : Equation S Variable)
    (satisfiesM : SatisfiesEquation M equation) :
    SatisfiesEquation (quotientModel congruence) equation
```

**Sequencing decision, flagged explicitly.** `quotientProjectionIsHomomorphism`
(`Quotient/Definition.lean:205`) is itself `sorry`, and
`equationTransportsAlongSurjection` (`Homomorphism/Definition.lean:468`) is
also `sorry` — so *composing* those two general lemmas is not currently a
route to a working quotient-transport proof. Recommend proving
`quotientModel_satisfiesEquation_of_satisfies` **directly** against
`Quot.mk`/`Quot.ind`/`Congruence.compatible` (every element of
`Quot congruence.rel` is `Quot.mk _ x` for some `x` by `Quot.exists_rep`, so
an arbitrary assignment into the quotient domain lifts along a section, and
`Congruence.compatible` is exactly what's needed to show the operation on
representatives descends) — a genuinely independent, ~20–30 line proof, not
blocked on either of the two other `sorry`s. Once `equationTransportsAlongSurjection`
and `quotientProjectionIsHomomorphism` are separately discharged (both are
real proof debt worth closing on their own merits, since other things
already cite them), a second, shorter proof of the same theorem via
composition becomes possible and could replace the direct one if desired —
but do not block the quotient-transport theorem on that.

**Priority relative to Chapter I:** **not blocking.** ℕ is the base case
(no transport target — see §1.1 finding 1, which is the actual blocker for
Chapter I's citability, not these two lemmas). These two lemmas become
load-bearing starting at Chapter II (whichever ℤ construction is chosen —
see open question in §4) and should be sequenced as parallel, independent
work, not gating Chapter I.

### 3.2 Chapter I: per-theorem disposition

Legend: **(a)** direct proof against the Landau/`PeanoSystem` carrier —
either currently `sorry` (discharge it) or currently undeclared (add and
prove it); **(b)** obtained as a `Cert_*_via_*` citation once §3.1's
transport theorems exist — **not applicable to any Chapter I theorem**,
since ℕ is the equational base case with nothing to transport from (noted
per theorem below only where it might look tempting and isn't); **(c)**
trivial consequence of an already-established (a)-theorem, not worth a
separate `Cert_*` name.

| # | Statement | Disposition | Cert / declaration name | Why (boundary justification) |
|---|---|---|---|---|
| 1 | x=y → x'=y' | (c) | none — cite `congrArg` directly | Not a named law at all; already correctly marked `n/a` in the crosswalk |
| 2 | x'≠x | (a), discharge existing `sorry` | `NoObjectIsItsOwnSuccessor` (`PeanoSystem/Theorems/Successor.lean`) | Peano-axiom-level fact about the successor relation, not equational — stays a direct interface-generic proof |
| 3 | x≠1 → ∃u, x=u' | (a), discharge existing `sorry` | `NonOneElementsHaveAPredecessor` / `PredecessorExistsUniqueAwayFromOne` | Existential, not equational; interface-generic |
| 4 | + exists, uniquely defined by recursion clauses | (a), discharge 4 existing `sorry`s | `LandauAdditionClauses`, `LandauAdditionWellDefined`, `LandauAdditionWithOne`, `LandauAdditionSuccessorOnRight` | Definitional/existence groundwork — establishes the operation itself; nothing to transport an operation *from* |
| 5 | (x+y)+z=x+(y+z) | (a), discharge `sorry` | **`Cert_N0_Add_Associative`** | Pure term equation, base case — proved by induction once, never transported (06a §1) |
| 6 | x+y=y+x | (a), discharge `sorry` | **`Cert_N0_Add_Commutative`** | Same as 5 |
| 7 | y+x≠x | (a) new declaration | descriptive name, e.g. `LandauAdditionNeverFixesArgument` — **no `Cert_*` name** | Uses `≠`; not equational. Once Theorem 18 (x+y>x) and irreflexivity of `<` exist, this becomes provable as a one-line corollary, but it is still a relational fact, not eligible for `Cert_*` |
| 8 | y≠z → x+y≠x+z (cancellation) | (a) new declaration, instantiating `LRA/Operation/Laws/Cancellation`'s generic predicate at `LandauAddition` | e.g. `LandauAdditionIsLeftCancellative` — **no `Cert_*` name** | **Flagged boundary case.** Cancellativity is `∀x,y,z (x*y=x*z → y=z)` — the `→` disqualifies it from the equational template in `06b-model-theory-boundary.md` §1 even though every symbol involved is an operation symbol. This is a real, previously-unstated corollary of the boundary rule worth recording explicitly: **not every property built purely from operation symbols is equational** — implication-shaped operation properties (cancellation, and by the same argument left/right-inverse-existence-without-a-chosen-witness) also route outside `SatisfiesEquation`, alongside the relation-involving properties `06b` already lists |
| 9 | exactly one of x=y, x=y+u, y=x+v | (c) | none needed | Underlies the definition of `LandauLessThan` itself; stating it separately would restate the definition, which the `StructCert_*` binding rule already forbids for structure certs and which is equally poor practice for a definitional lemma |
| 10 | trichotomy of <,=,> | (a), discharge `sorry` | `LandauLessThanTrichotomous` — **no `Cert_*` name** | Textbook `06b` example of a relational property (needs `∨`,`¬`); explicitly not preserved under products even in the abstract (the `(ℤ,<)×(ℤ,<)` counterexample in `06b` §2), so it could never have been a transport target regardless of ℕ being the base case |
| 11–14 | order-relation conversions (x>y↔y<x, etc.) | (c) | none needed — `Iff.symm`/`unfold` one-liners once `LandauLessThan`/`LandauGreaterThan` defs are in scope | Definitional unfolding, not independent theorems |
| 15 | < transitive | (a), discharge `sorry` | `LandauLessThanTransitive` | Relational (`Relations`/`Order` territory per `06b` §3 item 1) |
| 16 | mixed strict/non-strict transitivity | (c) | corollary of 15 + 13/14 | — |
| 17 | ≤ transitive | (c) | corollary of 15 + strict/non-strict conversion | — |
| 18 | x+y>x | (a) new declaration | e.g. `LandauAdditionStrictlyIncreasesArgument` | This is `RespectsRelation`/order-compatibility shaped (`Operations` §6.7.1), explicitly the kind of fact `06b` routes to `Operations`'s relation-vs-operation machinery rather than the equational fragment |
| 19–20 | + preserves & reflects < (iff) | (a), discharge `sorry` | `LandauAdditionPreservesAndReflectsLandauLessThan` (one `Iff` covers both) | Same as 18 — `RespectsRelation` instance |
| 21 | x>y ∧ z>u → x+z>y+u | (c) | corollary chaining 19/20 with itself | — |
| 22–23 | mixed/non-strict variants of 21 | (c) | corollaries | — |
| 24 | x≥1 | (c) or (a) short direct | corollary of Peano base case + order def | — |
| 25–26 | y>x → y≥x+1; y<x+1 → y≤x | (c) | corollaries of 19/20 + successor behavior | — |
| 27 | well-ordering | (a), discharge `sorry`, **plus the misfiling fix below** | `well_ordering` | Genuinely second-order (quantifies over arbitrary nonempty subsets) — correctly never treated as equational anywhere in the docs; stays a direct `Relations`/`Order`-style proof |
| 28 | · exists, uniquely defined by recursion clauses | (a), discharge 4 existing `sorry`s | `LandauMultiplicationClauses`, `...WellDefined`, `...WithOne`, `...SuccessorOnRight` | Same shape as Theorem 4 |
| 29 | xy=yx | (a), discharge `sorry` | **`Cert_N0_Mul_Commutative`** | Base case, direct |
| 30 | x(y+z)=xy+xz | (a), discharge `sorry`(s) — 3 declarations currently share this theorem | **`Cert_N0_MulAdd_Distributive`** | Binary-law cert (two operators) per the naming table |
| 31 | (xy)z=x(yz) | (a), discharge `sorry` | **`Cert_N0_Mul_Associative`** | Base case, direct |
| 32–33 | · preserves & reflects < (iff) | (a), discharge `sorry` | `LandauMultiplicationPreservesAndReflectsLandauLessThan` | `RespectsRelation` instance, same reasoning as 19–20 |
| 34 | x>y ∧ z>u → xz>yu | (c) | corollary chaining 32/33 | — |
| 35–36 | mixed/non-strict variants of 34 | (c) | corollaries | — |

**Resulting structure cert**, once 5/6/29/30/31 are proved (and only then —
per the binding rule, this must be a bare conjunction):

```
StructCert_N0_CommutativeSemiring :=
  [ Cert_N0_Add_Commutative, Cert_N0_Add_Associative,
    Cert_N0_Mul_Commutative, Cert_N0_Mul_Associative,
    Cert_N0_MulAdd_Distributive ]
```

named `CommutativeSemiring` rather than `CommutativeMonoid` (06a's name)
because `AlgebraicStructures/CommutativeSemiringWithoutZero` is the
structure `NaturalNumbers/Interface/Signature`'s own `NaturalNumbersFunctionSymbol`
already points at (§1.1 finding 2) — prefer matching what the repo's
existing signature wiring calls it over introducing a second name for the
same target structure.

**Blocking dependency, restated.** Theorems 16–17, 21–26, 34–36 (11
consequence-only theorems) cannot be added until their prerequisites
(15/19-20 and 32-33 respectively) are discharged — this is the concrete
sense in which "the transport theorems and Peano-generic successor/predecessor
theorems are currently blocking dependencies for most of Chapter I," except
substitute "transport theorems" with §1.1 finding 1's `NaturalNumberModel`
bridge for the handful of theorems (5/6/29/30/31) that need a `Cert_*` name
to mean something citable rather than just a locally-scoped `Landau*` lemma.

### 3.3 The Theorem 27 misfiling fix

`well_ordering` currently lives at
`LRA/NumberSystems/WholeNumbers/Constructions/Landau/Laws.lean:570` (with a
duplicate-looking second declaration at line 597 — same pattern as the
docstring/declaration pairing seen throughout this codebase's generated
files, not a real duplicate). Landau's book states well-ordering as a
Chapter I (natural-number) theorem. Fix: add a genuine
`NaturalNumbers/Constructions/Landau/Laws.lean` (or a new file in that
directory) declaration of `well_ordering` stated directly against the
Landau ℕ carrier, proved independently (not by re-exporting the
`WholeNumbers` one, since — per §1.1 finding 3 — `WholeNumbers`'s
carrier is a different, more axiomatically-abstracted structure than plain
Landau ℕ, so an import/re-export would be importing the wrong direction of
generality). Leave the existing `WholeNumbers` declaration in place (it may
still be independently useful there, restated for ℤ's ordering) rather than
deleting it — this fix adds the correctly-placed ℕ declaration, it does not
relocate the ℤ one. **Do not fold this into the Chapter I proof-discharge
pass** — it's an independent structural fix the task explicitly asked to
keep visible rather than silently bundled.

### 3.4 Deviations from `docs/foundations/*` this plan requires, flagged

1. **§1.1 finding 1** (no `NaturalNumberModel` bridge for Landau ℕ) means
   `06a-satisfaction-certificates.md` §1's claim that ℕ's certs are simply
   "proved directly by induction" understates the work: proving the
   induction is necessary but not sufficient for the cert to be a citable
   `SatisfiesEquation` fact — the bridge itself (a `CommutativeSemiringLaws`
   instance + `NaturalNumberModel.ofCarrier` + a new
   `Satisfy_Generic.lean`/`Instances.lean` pair for `NaturalNumbers/Constructions/Landau/`,
   mirroring every sibling construction) is new work `06a` doesn't mention.
2. **§1.1 finding 3** means this plan does **not** assume
   `WholeNumbers/Constructions/Landau` is the transport-theorem worked
   example from `06a` §2 — it isn't. Chapter II (and any future
   "Chapter I but for ℤ") crosswalk work should target
   `Integers/Constructions/QuotientOrderedPairs` for the literal quotient
   construction the transport theorems apply to, and treat
   `WholeNumbers/Constructions/Landau`'s relationship to that as an open
   question (§4) rather than assumed identity.
3. This plan does **not** attempt to resolve the `Interface/UniversalAlgebra/Signature`
   vs. `Interface/Signature` naming ambiguity (§1.1 finding 2) — that is
   squarely `docs/interface-model-standardization-inventory.md`'s track, a
   different, already-scoped refactor effort, and mixing the two would
   violate this task's own scope boundary.

---

## 4. Open questions requiring a human call before implementation starts

1. **Which ℤ construction does "Chapter I but for integers" actually
   target?** `WholeNumbers/Constructions/Landau` (axiomatic, closer to what
   the task prompt named) vs. `Integers/Constructions/QuotientOrderedPairs`
   (literal quotient, matches `06a`'s worked transport example) vs.
   `Integers/Constructions/{Tao,Mendelson}` (two more ℤ constructions found
   during the survey, not evaluated here at all). This determines which
   file the Chapter II crosswalk extension and the first real use of the
   quotient-transport theorem should target, and it's a genuine design
   choice, not a naming call — the four constructions are not proved
   equivalent to each other in this repo (that itself would be a natural,
   currently-absent theorem: "these four ℤ constructions are isomorphic
   models of the same `IntegerStructure` interface").
2. **Naming: `StructCert_N0_CommutativeSemiring` vs. `06a`'s
   `StructCert_N0_CommutativeMonoid`.** §3.2 picked the former to match the
   existing `NaturalNumbers/Interface/Signature` wiring; confirm this is
   the intended resolution rather than updating `06a` instead, since `06a`
   currently only bundles the additive monoid, not the full semiring.
3. **Should cancellation (Theorem 8) and similar implication-shaped
   operation properties get their own cert-naming sub-convention** (e.g.
   `RelCert_*` for "relational-but-purely-operation-symbol" facts), or stay
   uncertified proper nouns as this plan assumes? This is a real
   documentation-convention gap `16-landau-cert-naming-history.md` doesn't
   currently address — the existing four cert kinds (atomic/binary-law/
   structure/transport) all presuppose the equational template.
4. **Scope call: does this plan's Chapter II–V table (§2) need to become
   theorem-by-theorem precision like Chapter I's**, extending
   `LANDAU-CROSSWALK.md` fully, before implementation on those chapters
   starts, or is chapter-level sizing (as delivered here) sufficient to
   greenlight Chapter I implementation now and defer the fine-grained
   Chapters II–V crosswalk to a follow-up planning pass once Chapter I is
   actually closed out? This plan assumes the latter (Chapter I first,
   fully) but that sequencing choice belongs to a human, not this survey.
5. **Priority ordering between finishing `modelsOfEquationalTheoryIsVariety`'s
   sorry, the `Operation/Laws/*` sorry burndown (112 sorries), and the
   Chapter I discharge work in §3.2** — none of these strictly block each
   other, so which gets a session's attention first is a scheduling call,
   not a dependency-graph one. This plan recommends Chapter I first (it's
   the smallest, most self-contained, and has the clearest existing
   checklist), but does not assume that priority is obviously correct for
   every future session's goals.
6. **The `Operations/Iteration` / indexed-sum-product re-homing
   `landaureview.md` §29 already recommended**, and this plan's §2 Chapter
   V note that Theorems 274–289 are their own sub-topic, point at the same
   underlying gap from two directions (algebraic-structures review and
   Landau-crosswalk survey). Worth deciding whether that re-homing happens
   as prerequisite infrastructure before Chapter V crosswalk work, or
   whether Chapter V's iteration theorems get a bespoke treatment instead
   of waiting on it.
