# Landau Satisfaction Plan

Planning document produced in response to
`docs/tool-prompts/landau-generic-operation-proving-plan.md`. **No `.lean`
file was edited to produce this document.**

**Revision note.** The first version of this document organized itself
around Landau's book-theorem numbering (a 36-row Chapter I table as the
spine). That was the wrong spine. The actual ask — confirmed in discussion
— is a **fixed, small cert vocabulary** (`Add_Commutative`, `Add_Associative`,
`Add_HasIdentity`, ...) checked off, as the *same* columns, across four
different levels: the generic law vocabulary itself, the named algebraic
structures that bundle it, the generic (carrier-agnostic) number-system
interfaces, and every concrete construction. Landau's theorem numbers are
now a footnote layer (§6), not the organizing device. This version leads
with a finding the theorem-number framing never surfaced: **there are
currently three separate, non-communicating mechanisms in this repo that
all claim to answer "does this carrier satisfy this law," and reconciling
them — or deliberately not reconciling them — is the actual prerequisite
decision for everything downstream.**

Companion documents: [`LANDAU-THEOREMS.md`](LANDAU-THEOREMS.md),
[`LANDAU-CROSSWALK.md`](LANDAU-CROSSWALK.md),
[`docs/foundations/16-landau-cert-naming-history.md`](docs/foundations/16-landau-cert-naming-history.md).

---

## 0. The central finding: three parallel satisfaction mechanisms

Verified by reading the actual instance declarations, not inferred from
naming.

| # | Mechanism | What a "cert" actually is | Lives in | Confirmed users |
|---|---|---|---|---|
| **1** | **Equational satisfaction** | A value of type `SatisfiesEquation M equation` — `M : Logic.FirstOrder.Model S`, `equation : Equation S Variable` a pair of `Term`s. Generic over *any* `Logic.Signature`. | `LRA/UniversalAlgebra/Satisfaction/Definition.lean` | **Nothing in `NumberSystems/*` currently constructs a value of this type against any concrete carrier.** It underlies only `Interface/UniversalAlgebra/*` scaffolding (§3), which nothing else imports. |
| **2** | **Bundled Lean typeclasses** | A value of type `CommutativeSemiringLaws R` — a `class abbrev` (Lean 4 typeclass conjunction) over raw `[Add R] [Mul R] [OfNat R 0] [OfNat R 1]` instances, bottoming out in hand-written classes like `class AdditiveCommutativeLaws (R) [Add R] : Prop where add_comm : ∀ a b, a + b = b + a`. No reference to `Logic.Signature`/`Model`/`Term` anywhere in the chain. | `LRA/AlgebraicStructures/*/Laws/Definition.lean` | **This is the one every generic number-system interface actually requires** — `NaturalNumberModel`, `PositiveNaturalsModel` need `CommutativeSemiringLaws`; `WholeNumberModel`, `ZeroBasedNaturalsModel` need `OrderedSemiringLaws`; `IntegerModel` (the `Integers` subject) needs `IntegralDomainLaws` + order laws; `RationalModel`/`RealModel` need `OrderedFieldLaws`; `ComplexNumberModel` needs `FieldLaws`. See Matrix 3. |
| **3** | **Henkin second-order theory satisfaction** | A value of type `satisfiesTheory : PeanoTheory toHenkinModel` — `toHenkinModel : HenkinModel PeanoFirstOrderSignature`. Full first/second-order sentences, not equations. | `PeanoSystem/Interface/ModelTheory/Model.lean`, `IntegerStructure/Interface/ModelTheory/Model.lean` | `PeanoModel`, `IntegerStructureModel` — a **second, independent** integer-structure interface, distinct from `Integers.Interface.ModelTheory.IntegerModel` (mechanism 2). Also (a still-different signature, but the same shape of mechanism) `PresburgerArithmeticModel`, `FirstOrderArithmeticModel`, `SuccessorArithmeticModel` — these three are legitimately out of scope for mechanisms 1/2 regardless, since their whole point is a restricted signature without general multiplication. |

**Why this matters for "one small set of certs everywhere."** All of
`docs/foundations/06-operations.md`, `06a`, `06b`, and this document's first
draft implicitly assumed the cert-naming convention (`Cert_⟨Carrier⟩_⟨Op⟩_⟨Law⟩`)
would point at mechanism 1 (`SatisfiesEquation`), because that's the
Signature/Model-generic machinery the design-history doc (`16-...md`)
describes. **But every number system that actually exists and works today
gets its genericity from mechanism 2 instead** — plain Lean typeclasses,
checked by ordinary instance resolution, no `Signature`/`Term`/`evaluateTerm`
in sight. Mechanism 1 is real, sorry-light, and well-designed, but it is
currently a generic layer with **zero concrete instances** anywhere in
`NumberSystems/`. Mechanism 2 is the one actually load-bearing across ℕ,
𝕎, ℤ, ℚ, ℝ, ℂ today. This is the single biggest thing the theorem-number
framing hid: the "generic operation-proving" the project already has and
uses is mechanism 2, not the one the design docs spent the most words on.

**This plan's recommendation, stated up front (see §7 for the open
question this still leaves).** Point `Cert_*`/`StructCert_*` at mechanism 2
— the `AlgebraicStructures/*/Laws` typeclasses — as the primary, working
cert layer, since that's what every generic interface actually consumes.
Keep mechanism 1 (`SatisfiesEquation`) as a secondary, Signature-level
restatement worth having for Birkhoff-style reasoning (varieties, HSP,
the product/quotient transport theorems from the first draft — still real,
still worth building, see §4), but stop treating it as *the* cert referent.
Treat mechanism 3 (Henkin/`PeanoTheory`) as intentionally out of scope for
the equational cert vocabulary — it's a strictly more expressive layer for
axioms that aren't equations at all — and flag the `PeanoModel` /
`IntegerModel` duplication as its own open question (§7.1), not something
this plan resolves by picking one silently.

---

## 1. Matrix 1 — The generic law vocabulary itself

One row per law family in `LRA/Operation/Laws/*` — this is the alphabet
every other matrix's columns are drawn from. "Equational?" is the `06b`
boundary test (pure `∀x̄(t₁≈t₂)`, no `→/∨/∃`).

| Law family | `Definition`/`Consequences` | Equational? | Sorry count (`Theorems`/`Relationships`/`FailureModes`) | Generic theorem this family owns |
|---|---|---|---|---|
| `Associative` | sorry-free | yes | 7 | generalized-associativity (any parenthesization agrees) |
| `Commutative` | sorry-free | yes | 7 | commuting-factors (assoc+comm → any permutation agrees) |
| `Identity` | sorry-free | yes (`e*x≈x ∧ x*e≈x`, packaged) | 9 | uniqueness (needs one left + one right, not two of the same side) |
| `Inverse` | sorry-free | yes, relative to a witness constant | 26 (heaviest) | uniqueness (needs associativity, unlike Identity); inverse map is an involution; socks-and-shoes law |
| `Cancellation` | sorry-free | **no** — `x*y=x*z → y=z` has a `→`, fails the template despite being operation-symbols-only | 23 (2nd heaviest) | — (flagged in the first draft's Theorem 8 discussion; the boundary consequence is general, not Landau-specific) |
| `Distributive` | sorry-free | yes (binary-law, two operator symbols) | 9 | `0*x=0` as a theorem, not a primitive |
| `Idempotent` | sorry-free | yes | 3 | — |
| `Absorbing` | sorry-free | yes | 9 | dual to Identity (uniqueness, same proof shape) |
| `Absorption` | sorry-free | yes (lattice-style self-interaction) | 6 | — |
| `Nilpotent` | sorry-free | yes, but presupposes associativity for the usual meaning (flagged in `landaureview.md` §30) | 7 | — |
| `Closure` | sorry-free | trivial/definitional (`S^n → S` typing) | 6 | — |
| `QuotientCompatible` | **3 sorries in `Definition.lean` itself** | n/a — this is `RespectsRelation`/`RespectsEquivalence`, not a law | 0 (downstream) | well-defined-quotient-operation theorem |

**Total: 112 sorries** across the twelve families (recount of the docs'
"~120" estimate). `QuotientCompatible` is flagged specially because it's
the one family with sorry debt in its *definition*, not just downstream —
worth prioritizing since `Operations §6.7.1`'s `RespectsRelation` machinery
sits underneath everything that eventually needs a quotient certificate.

---

## 2. Matrix 2 — Algebraic structures → which certs they bundle

One row per named structure in `LRA/AlgebraicStructures/`. Columns are the
mechanism-2 cert vocabulary. A cell is **✓** if the structure's own
`class abbrev` conjunction includes that law (verified directly for the
structures marked *checked*; the rest are read off `07-algebraic-structures.md`'s
formulas, which state the same conjunctions in prose — flagged where a
row hasn't been independently re-verified against its `Laws/Definition.lean`).

| Structure | Add Comm | Add Assoc | Add Id | Add Inv | Mul Comm | Mul Assoc | Mul Id | Mul Inv | Distrib | Order compat | Order complete |
|---|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| `Magma` | | | | | | | | | | | |
| `Semigroup` | | ✓ | | | | | | | | | |
| `CommutativeSemigroup` | ✓ | ✓ | | | | | | | | | |
| `Monoid` | | ✓ | ✓ | | | | | | | | |
| `CommutativeMonoid` | ✓ | ✓ | ✓ | | | | | | | | |
| `Group` | | ✓ | ✓ | ✓ | | | | | | | |
| `AbelianGroup` | ✓ | ✓ | ✓ | ✓ | | | | | | | |
| `AdditiveSemigroup`/`AdditiveGroup`/`AdditiveMonoid`/`AdditiveCommutativeSemigroup` | *(the `Add`-flavored aliases of the four rows above — same cert content, different symbol convention; not separately re-verified)* | | | | | | | | | | |
| `Semiring` | | ✓ | ✓ | | | ✓ | | | ✓ | | |
| `CommutativeSemiring`✓*checked* | ✓ | ✓ | ✓ | | ✓ | ✓ | ✓ | | ✓ | | |
| `CommutativeSemiringWithoutZero` | ✓ | ✓ | | | ✓ | ✓ | ✓ | | ✓ | | |
| `Ring` | | ✓ | ✓ | ✓ | | ✓ | | | ✓ | | |
| `CommutativeRing` | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | | | ✓ | | |
| `NontrivialRing` | *(`CommutativeRing` + `0≠1`, not a new cert column)* | | | | | | | | | | |
| `IntegralDomain` | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | | ✓ | | |
| `DivisionRing` | ✓ | ✓ | ✓ | ✓ | | ✓ | ✓ | ✓ (nonzero) | ✓ | | |
| `Field` | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ (nonzero) | ✓ | | |
| `OrderedGroup`/`LinearlyOrderedGroup` | ✓ | ✓ | ✓ | ✓ | | | | | | ✓ | |
| `OrderedRing`/`LinearlyOrderedRing` | ✓ | ✓ | ✓ | ✓ | | ✓ | | | ✓ | ✓ | |
| `OrderedSemiring`✓*checked (via `WholeNumberModel`)* | ✓ | ✓ | ✓ | | | ✓ | | | ✓ | ✓ | |
| `OrderedField`✓*checked (via `RationalModel`/`RealModel`)* | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | |
| `CompleteOrderedField` | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| `Archimedean` | *(a property of an ordered field, not an independent cert column — needs a second sort, ∃n:ℕ; routes like `06b` §1's Archimedean row)* | | | | | | | | | | |
| `Lattice`/`JoinSemilattice`/`MeetSemilattice`/`DistributiveLattice`/`BoundedLattice`/`BooleanAlgebra` | *(a genuinely separate cert vocabulary — join/meet, not add/mul; out of scope for this matrix's columns, would need its own matrix if pursued)* | | | | | | | | | | |

**Reading this matrix.** Every row is a `StructCert_*` definition, and per
the binding rule it must be a bare conjunction of the ✓ columns — nothing
here should ever be a freshly-restated `∀x,y(...)`. The empty rows
(`Magma`) are the base case with zero certs, correctly.

---

## 3. Matrix 3 — Generic number-system interfaces → required certs

One row per `*/Interface/ModelTheory/Model.lean` structure — the
carrier-agnostic contracts every concrete construction must satisfy to be
usable as "the" ℕ, ℤ, ℚ, etc. anywhere else in the repo. This is the
layer that actually determines which mechanism (§0) a number system's
certs run through.

| Interface | Mechanism | Required cert (Matrix&nbsp;2 row) | Extra requirements |
|---|---|---|---|
| `NaturalNumberModel` | 2 | `CommutativeSemiringLaws` | — |
| `PositiveNaturalsModel` | 2 | `CommutativeSemiringLaws` | — |
| `WholeNumberModel` | 2 | `OrderedSemiringLaws` | `StrictOrderCompatibilityLaw` |
| `ZeroBasedNaturalsModel` | 2 | `OrderedSemiringLaws` | `StrictOrderCompatibilityLaw` |
| `IntegerModel` (subject `Integers`) | 2 | `IntegralDomainLaws` + `LinearOrderLaws` | `StrictOrderCompatibilityLaw`, `AdditionRespectsOrderLaws`, `MultiplicationRespectsOrderLaws` |
| `RationalModel` | 2 | `OrderedFieldLaws` | `StrictOrderCompatibilityLaw`, (dense order) |
| `RealModel` | 2 | `OrderedFieldLaws` | `StrictOrderCompatibilityLaw`, `DenseOrderLaw`, `OrderCompletenessLaws` |
| `ComplexNumberModel` | 2 | `FieldLaws` | — |
| `PeanoModel` | **3** | *n/a — Henkin `PeanoTheory` satisfaction, not a Matrix&nbsp;2 cert at all* | — |
| `IntegerStructureModel` (subject `IntegerStructure`) | **3** | *n/a — Henkin theory satisfaction* | — |
| `PresburgerArithmeticModel` / `FirstOrderArithmeticModel` / `SuccessorArithmeticModel` | *(first-order theory satisfaction against a restricted signature — structurally like mechanism 3 but a different, smaller signature per subject; no general multiplication, so most Matrix 2 columns don't apply)* | n/a | — |
| `GaussianIntegers` | **no `ModelTheory/Model.lean` found at all** | — | flagged gap, not evaluated further here |

**Reading this matrix.** Everything using mechanism 2 (the top eight rows)
already points at the *same eight-structure vocabulary* from Matrix 2 —
this is the concrete evidence that "one small set of certs, every number
system certifies against it" **already exists and already works**, for
eight of the twelve number-system subjects. The two rows using mechanism 3
(`PeanoModel`, `IntegerStructureModel`) are the ones that don't participate
in that shared vocabulary at all — worth a real decision (§7.1), not a
silent gap.

---

## 4. Matrix 4 — Concrete constructions → actually wired?

One row per construction directory found under every `NumberSystems/*/Constructions/`.
**SatGen** = has `Satisfy_Generic.lean` (wires this construction's carrier
into its subject's `*Model` from Matrix 3). **Inst** = has `Instances.lean`.
**Laws** = has a local `Laws.lean` proving the cert obligations by hand.
Sorry counts are summed across every `.lean` file in the construction
directory (so include non-cert sorries too — a coarse but honest signal of
overall completeness, not a pure cert-debt count).

| Subject | Construction | SatGen | Inst | Laws | Sorries | Note |
|---|---|:-:|:-:|:-:|--:|---|
| NaturalNumbers | **Landau** | ✗ | ✗ | ✓ | 4 | **Not wired to `NaturalNumberModel` at all** — §0's first-draft finding, confirmed again here as the one from-scratch ℕ construction with zero bridge |
| NaturalNumbers | VonNeumann | ✗ | ✗ | ✗ | 8 | Not wired |
| NaturalNumbers | Presburger *(subject-local, not the top-level `PresburgerArithmetic` subject)* | ✗ | ✓ | ✗ | 5 | Not wired |
| NaturalNumbers | Mathlib | ✓ | — | — | 0 | Wired directly against Mathlib's own `Nat` instances — a legitimately different, zero-new-proof certification path (Mathlib already proves the typeclasses) |
| PositiveNaturals | Mathlib | ✓ | — | — | 0 | Same pattern |
| PositiveNaturals | LRAInHouse | ✓ | ✗ | ✗ | 0 | Wired with no local `Laws.lean` — likely derives instances from a shared source; not independently verified |
| ZeroBasedNaturals | Mathlib / LRAInHouse | ✓ / ✓ | — / ✗ | — / ✗ | 0 / 0 | Same two patterns as above |
| WholeNumbers | **Landau** | ✓ | ✓ | ✓ | 36 | Wired, but this is the axiomatic-interface construction (§0 of the first draft) — not the literal pair-quotient |
| WholeNumbers | Mathlib | ✓ | — | — | 0 | — |
| Integers | **QuotientOrderedPairs** | ✓ | ✓ | ✓ | 27 | The literal `(ℕ₀×ℕ₀)/~`-shaped construction |
| Integers | Tao | ✓ | ✓ | ✓ | 9 | — |
| Integers | Mendelson | ✓ | ✓ | ✓ | 8 | — |
| Integers | Polish | ✗ | ✗ | ✗ | 0 | Not wired |
| Integers | Mathlib | ✓ | — | — | 0 | — |
| IntegerStructure | *(routes through mechanism 3 — no `Constructions/` directory shaped like the others was surveyed here; separate follow-up)* | — | — | — | — | — |
| RationalNumbers | RationalQuotientFractions | ✓ | ✓ | ✓ | 31 | — |
| RationalNumbers | Mathlib | ✓ | — | — | 0 | — |
| RealNumbers | Dedekind | ✓ | ✓ | ✓ | 29 | — |
| RealNumbers | Cauchy | ✓ | ✓ | ✓ | 33 | Heaviest ℝ construction |
| RealNumbers | EffectiveCauchy | ✓ | ✓ | ✓ | 19 | — |
| RealNumbers | Dyadic | ✓ | ✓ | ✓ | 12 | Lightest ℝ construction |
| RealNumbers | Cantor | ✓ | ✓ | ✓ | 25 | — |
| RealNumbers | PrimitiveIntervals | ✓ | ✓ | ✓ | 30 | — |
| RealNumbers | Mathlib | ✓ | — | — | 0 | — |
| ComplexNumbers | OrderedPairs | ✓ | ✓ | ✓ | 32 | — |
| ComplexNumbers | Mathlib | ✓ | — | — | 0 | — |
| GaussianIntegers | OrderedPairs | ✗ | ✓ | ✓ | 15 | Not wired — consistent with §3's finding that this subject has no `ModelTheory/Model.lean` at all yet |
| PresburgerArithmetic / FirstOrderArithmetic / SuccessorArithmetic | Mathlib | ✓ | — | — | 0 | Wired against the restricted (mechanism-3-style) signature, not Matrix&nbsp;2's vocabulary — correctly out of scope for those columns |

**Reading this matrix.** Every `Mathlib`-backed construction across every
subject is wired with zero sorries — Mathlib's own proofs discharge the
cert obligations for free once the carrier is identified with Mathlib's
type. The real proof debt is concentrated entirely in the from-scratch
LRA constructions (four ℕ/ℤ/ℚ/ℝ/ℂ families, 6 real ℝ constructions alone),
totalling **~300 sorries** summed across the rows above (a materially
larger number than the first draft's Chapter-I-scoped view suggested,
because this view is per-construction-file, not per-Landau-theorem). Two
constructions (`NaturalNumbers/Landau`, `Integers/Polish`) plus one whole
subject (`GaussianIntegers`) are not wired to any generic interface at all.

**What this matrix does *not* yet do — flagged, not silently skipped.**
It records *whether* a construction is wired and *how much* sorry debt it
carries in aggregate, not which specific Matrix&nbsp;2 columns (`Add_Commutative`
vs. `Mul_Associative` vs. ...) are proved vs. `sorry` inside each
construction's `Laws.lean`. Producing that finer breakdown means reading
every `Laws.lean` file's individual declarations against the fixed
vocabulary — real, valuable follow-up work, sized at roughly 20
constructions × ~8 relevant cert columns each, not attempted in this pass.

---

## 5. The two missing generic theorems (mechanism 1, kept for Birkhoff-style reasoning)

Unchanged from the first draft's technical content — still real, still
worth building, still not blocking anything in Matrices&nbsp;1–4 (which run
on mechanism 2). Both belong in a new file,
`LRA/UniversalAlgebra/Satisfaction/Transport.lean`:

```lean
theorem productModel_satisfiesEquation_of_both_satisfy
    {S : Signature} {Variable : Type} {M : Model.{u} S} {N : Model.{v} S}
    (equation : Equation S Variable)
    (satisfiesM : SatisfiesEquation M equation)
    (satisfiesN : SatisfiesEquation N equation) :
    SatisfiesEquation (productModel M N) equation

theorem piModel_satisfiesEquation_of_all_satisfy
    {S : Signature} {Variable : Type} {Index : Type w} {family : Index → Model.{u} S}
    (equation : Equation S Variable)
    (allSatisfy : ∀ i, SatisfiesEquation (family i) equation) :
    SatisfiesEquation (piModel family) equation

theorem quotientModel_satisfiesEquation_of_satisfies
    {S : Signature} {Variable : Type} {M : Model.{u} S} (congruence : Congruence M)
    (equation : Equation S Variable)
    (satisfiesM : SatisfiesEquation M equation) :
    SatisfiesEquation (quotientModel congruence) equation
```

Proof sketch, sequencing, and the `quotientProjectionIsHomomorphism`
dependency note are unchanged from the first draft — see git history of
this file for the full writeup if mechanism 1 is picked up as real work.
**Given §0's finding, these three theorems are useful independent of which
mechanism wins the §7.1 decision** — they're the right shape regardless,
and mechanism 2's mostly-hand-proved certs could in principle be
*re-derived* via these once a bridge from typeclass-style laws to
`Equation` values exists (itself a real, currently-unscoped piece of work,
not assumed done by anything above).

---

## 6. Landau's theorem numbers — a footnote layer, not the spine

Landau's `LANDAU-THEOREMS.md`/`LANDAU-CROSSWALK.md` numbering still needs
tracking, because it's the actual source-fidelity check against the book —
but it should attach to Matrix&nbsp;2/3/4 cells as citations, not organize its
own document section. Concretely: `LANDAU-CROSSWALK.md`'s existing
Chapter&nbsp;I table should grow a **Cert** column pointing at Matrix&nbsp;2's
vocabulary (e.g. Theorem&nbsp;6 → `Add_Commutative`, checked in the
`NaturalNumbers/Landau` row of Matrix&nbsp;4 once that row is wired per §0),
and theorems that don't correspond to any cert column (trichotomy,
well-ordering, cancellation — see the first draft's full 36-row
disposition, preserved below in the interest of not deleting real analysis
work) get a plain descriptive Lean declaration name with no `Cert_*` at
all, exactly as before. **The Chapter&nbsp;II–V coarse crosswalk (equational
vs. relational fraction per chapter) from the first draft is unaffected by
this restructuring and still stands as written** — it was already
carrier/mechanism-agnostic sizing, not theorem-number bookkeeping.

*(The full 36-theorem Chapter&nbsp;I disposition table and the Chapter&nbsp;II–V
sizing table from the first draft are preserved in this repo's git history
on this file, and should be re-attached here as Matrix&nbsp;2/3/4 citations
once the mechanism-2-vs-1 decision in §7.1 is made — re-deriving them from
scratch would be wasted work, they don't need to change, only their
framing does.)*

---

## 7. Open questions

### 7.1 The mechanism decision (new, and the most consequential one)

**Does `Cert_*`/`StructCert_*` point at mechanism 2 (`AlgebraicStructures`
typeclasses, what's actually used today) or mechanism 1
(`SatisfiesEquation`, what the design docs assumed)?** This plan
recommends mechanism 2 as primary (§0), but that's a real architectural
call, not a survey finding — it means `docs/foundations/06a-satisfaction-certificates.md`'s
entire worked cert tree (§0 there, `Cert_N0_Add_Commutative` framed as a
`SatisfiesEquation` fact) would need updating to point at
`CommutativeSemiringLaws`-shaped citations instead. Confirm before either
this plan or `06a` gets treated as current.

### 7.2 `PeanoModel`/`IntegerStructureModel` vs. mechanism 2's interfaces

Two genuinely different formalizations of "what is ℤ" exist side by side
(`Integers.Interface.ModelTheory.IntegerModel`, mechanism 2, vs.
`IntegerStructure.Interface.ModelTheory.IntegerStructureModel`, mechanism 3)
— and similarly `PeanoModel` (mechanism 3) has no mechanism-2 counterpart
interface for ℕ at all; `NaturalNumberModel` is the only ℕ interface, and
it's mechanism 2. Are these two subjects (`Integers` vs. `IntegerStructure`)
meant to converge, stay permanently separate (one for equational
reasoning, one for full first-order axiom statements like Peano's own),
or is one simply stale? Not resolved by this survey.

### 7.3 Which ℤ construction is "the" one (carried over from the first draft)

`WholeNumbers/Constructions/Landau` (axiomatic) vs.
`Integers/Constructions/QuotientOrderedPairs` (literal quotient) vs.
`Tao`/`Mendelson` — four constructions, not proved equivalent to each
other anywhere in the repo.

### 7.4 Finer-grained Matrix 4

Should the per-construction sorry-count view in Matrix&nbsp;4 be broken down
per cert column (§4's "what this matrix does not yet do") before any
implementation session starts, or is the coarse view enough to sequence
work?

### 7.5 Naming: `StructCert_N0_CommutativeSemiring` vs. `06a`'s `CommutativeMonoid`

Carried over from the first draft, now sharpened: Matrix&nbsp;2 confirms
`CommutativeSemiring` (not `CommutativeMonoid`) is the structure
`NaturalNumberModel` actually requires — `06a` should be corrected to match,
once §7.1 is settled.

### 7.6 Cancellation and other implication-shaped operation properties

Carried over unchanged: does `y≠z → x+y≠x+z` get its own cert
sub-convention, or stay an uncertified proper noun? Neither mechanism 1
nor mechanism 2's typeclass style naturally names these — worth deciding
once, since it recurs across every number system's order-arithmetic
theorems.

### 7.7 The 12-subject scope

This plan's matrices cover all 12 `NumberSystems/*` subjects found, wider
than the first draft's ℕ/ℤ/ℚ/ℝ/ℂ scope. `GaussianIntegers` (no
`ModelTheory/Model.lean`), `PresburgerArithmetic`/`FirstOrderArithmetic`/
`SuccessorArithmetic` (restricted-signature, mechanism-3-style, correctly
out of Matrix&nbsp;2's scope) and `IntegerStructure` (mechanism 3) were
surveyed only enough to place them in Matrix&nbsp;3/4, not evaluated for
whether they need cert coverage at all. Confirm scope before committing
implementation effort to any of them.
