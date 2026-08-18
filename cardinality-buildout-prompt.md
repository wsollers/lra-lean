# LRA Cardinality Subject — Buildout Specification

Work in the `lra-lean` repository, on the `standardization` line.

Read `subject-architecture-prompt.md` first. Every convention in it applies here:
subject/group/concept layout (§2.1–2.3), naming and notation (§3), no
doc-comments required (§4), **every proof left as `sorry`** (§5), the Mathlib
quarantine (§6), and the standing prohibition on compatibility shims (§7.0.1).
This document adds only what is specific to cardinality.

Do not commit or push unless the user separately authorizes it.

---

## 1. Placement

`LRA.Cardinality` is a **top-level subject**, importing `LRA.Set` and
`LRA.Function`.

It cannot live under `LRA.Set`: cardinality is defined by *functions between
sets*, `LRA.Function.SetTheoretic` already imports `LRA.Set.Interface`, and
nesting cardinality under `Set` would force `Set → Function` and invert that
dependency. The reasoning is the same as for `LRA.Morphism`.

### 1.1 A dependency inversion to fix first

`LRA/VolumeI/Map/Image/` currently owns four finiteness notions:

```text
FinitelyEnumerates      HasFiniteEnumeration      FiniteImage      FiniteRange
```

described in-file as a "project-local finiteness witness … without importing
Mathlib's finite-set API". These are **cardinality claims about images**, not
image definitions. Leaving them where they are and defining `LRA.Cardinality.Finite`
separately would create two owners of finiteness — precisely what §7.2 forbids —
and moving `Finite` into the function subject instead would create a cycle,
since `Cardinality` imports `Function`.

Move all four into `LRA.Cardinality`. The function subject keeps `IsImageOf`,
`IsPreimageOf`, and the rest of the image calculus; the claim "this image is
finite" belongs to cardinality. Update `Map/Image/Theorems.lean`'s
`FiniteImageIff` and `FiniteRangeIffFiniteImage` accordingly.

### 1.2 A name that is already taken

`Countable` is in use across `LRA.Set` and `LRA.SetSystems` as σ-algebra
vocabulary — `countableUnion`, `countableIntersection`, `CountableMembershipLaws`,
and roughly 110 further occurrences. That sense is *"countably many operands"*,
an arity, and has nothing to do with cardinality.

The two families are semantically distinct and must **not** be merged. They live
in different namespaces so Lean is unambiguous, but the review must record them
as a deliberately distinct family sharing a word, per §7.2. Do not rename the
σ-algebra vocabulary.

---

## 2. Two presentations, again

Cardinality is developed twice, deliberately, mirroring §1.2 of the architecture
document.

**The working presentation — over types and arrows.** This is the theory that
gets used. Every later subject that needs countability or finiteness consumes
this one.

```lean
def Equinumerous (Domain : Type u) (Codomain : Type v) : Prop :=
  ∃ function : LRA.Function Domain Codomain, LRA.Function.Bijective function
```

**The structural presentation — over set objects and set-theoretic functions.**
This exists **to be seen, not to be used.** Rendering the same definition against
the set backend makes visible what the arrow notation hides: there is no `f x`,
only `Relates graph input output`; injectivity and surjectivity have to be
stated at the graph level; and the domain and codomain are *data carried by the
triple* rather than implicit in a type.

```lean
def SetEquinumerous
    {Element Pair : Type u} {SetObject GraphObject : Type v}
    [HasPairing Element Element Pair]
    [Membership Element SetObject] [Membership Pair GraphObject]
    (left right : SetObject) : Prop :=
  ∃ triple : SetTheoreticFunctionTriple SetObject SetObject GraphObject,
    triple.domain = left ∧
    triple.codomain = right ∧
    IsSetTheoreticFunction triple ∧
    GraphInjectiveOnDomain triple ∧
    GraphOntoCodomain triple
```

Binding rules for the structural presentation:

- No subject outside `LRA.Cardinality.SetTheoretic` may consume it.
- It introduces **no new bridge**. `TypedFunctionGraphRepresentation` remains the
  single typed-to-set representation theorem in the repository (§1.5). Do not add
  a cardinality-specific correspondence theorem, coercion, or instance.
- It is not a compatibility layer and §7.0.1 does not apply to it: it is a second
  *mathematical* presentation of the same notion, kept for what it shows, not a
  forwarding alias for a name that moved.

Scope: state `SetEquinumerous`, `SetDominated`, the graph-level injectivity and
surjectivity predicates they need, `SetFinite`, and `SetCountable`. Prove the
handful of facts that make the shape legible — that `SetEquinumerous` is
reflexive, symmetric, and transitive. Do not mirror the whole development.

---

## 3. Marking the axiom of choice

Where choice enters is **content in a foundations text, not a footnote.** But a
theorem belongs beside the mathematics it is about, not beside the other theorems
that happen to share an axiom. Both requirements are met by marking in place and
indexing separately.

### 3.1 Theorems stay where they belong pedagogically

A choice-dependent theorem lives in the `Theorems.lean` of its own concept,
beside its siblings. Do **not** create a `ChoiceTheorems.lean`, and do not move
a theorem away from its topic because of its axiom.

This matters most where a choice-free and a choice-dependent result are two
directions of one biconditional. `Dedekind-infinite → infinite` needs nothing;
`infinite → Dedekind-infinite` needs ACω. They are one idea and must be read
together.

### 3.2 Each such theorem carries a required marker

Doc-comments are not required in this repository (architecture document §4).
**This is the one exception.** Every theorem whose mathematical content depends
on a choice principle carries a one-line marker as the first line of its
doc-comment:

```lean
/-- Requires ACω. -/
theorem InfiniteImpliesDedekindInfinite … := by
  sorry

/-- Equivalent to AC. -/
theorem CardinalComparability … := by
  sorry
```

Name the principle, not just "choice" — they are genuinely different:

| Marker | Meaning |
|---|---|
| `Requires AC.` | full axiom of choice |
| `Requires ACω.` | countable choice |
| `Requires DC.` | dependent choice |
| `Equivalent to AC.` | equivalent, not merely implied — a stronger claim |

### 3.3 `Choice.lean` is a name-checked index that declares nothing

Each subject gets one `LRA/<Subject>/Choice.lean`. It imports the modules holding
the marked theorems and lists them with anonymous `example`s grouped by principle:

```lean
import LRA.Cardinality.Comparison
import LRA.Cardinality.Finiteness
import LRA.Cardinality.Countability
import LRA.Cardinality.Arithmetic

/-!
The choice surface of `LRA.Cardinality`.

This file declares nothing. It is an index: each entry names a theorem whose
mathematical content depends on a choice principle, so the whole surface is
visible in one place without moving any theorem away from its topic.
-/

section Equivalent_to_AC
example := @LRA.Cardinality.CardinalComparability
example := @LRA.Cardinality.InfiniteCardinalSquareAbsorption
end Equivalent_to_AC

section Requires_CountableChoice
example := @LRA.Cardinality.InfiniteImpliesDedekindInfinite
example := @LRA.Cardinality.InfiniteHasDenumerableSubset
example := @LRA.Cardinality.CountableUnionOfCountableIsCountable
end Requires_CountableChoice
```

`example` is anonymous, so no name enters the environment and §7.0.1 is not
violated — this is an index, not a re-export. But the reference is elaborated, so
renaming or removing a listed theorem **fails the build** with an unknown
identifier. The index cannot silently rot.

### 3.4 The marking is a documentation convention, not a verified property

`#print axioms` will **not** agree with these markers, and nobody should
"correct" them against it.

In Lean, `Classical.choice` is a kernel axiom and excluded middle is derived from
it, so any theorem proved by contradiction reports `Classical.choice` whether or
not its mathematics needs choice. Cantor–Schröder–Bernstein will report it. And
while proofs are `sorry`, `#print axioms` reports only `sorryAx` and says nothing
about choice at all.

What is being recorded is *mathematical* dependence on a choice principle — the
thing a textbook flags — which is finer than the axioms of a particular Lean
proof term. Prior art for tracking it at all is Metamath's `set.mm`, which marks
theorems proved using `ax-ac`, and Coq's opt-in `ClassicalChoice` modules.
Mathlib does not track it.

### 3.5 The choice map for this subject

| Result | Marker |
|---|---|
| Cantor–Schröder–Bernstein | *none* |
| Cantor's theorem | *none* |
| ℝ ≈ 𝒫(ℕ) | *none* |
| finite pigeonhole | *none* |
| Dedekind-infinite → infinite | *none* |
| infinite → Dedekind-infinite | `Requires ACω.` |
| every infinite set has a denumerable subset | `Requires ACω.` |
| countable union of countable sets is countable | `Requires ACω.` |
| cardinal comparability | `Equivalent to AC.` |
| κ + κ ≈ κ for infinite κ | `Requires AC.` |
| κ · κ ≈ κ for infinite κ | `Equivalent to AC.` (Tarski) |

That Cantor–Schröder–Bernstein needs nothing while comparability is equivalent to
AC is the single most instructive fact in the section. Both are theorems about
comparing cardinalities, they sit in the same group, and the markers are what
make the contrast visible.

## 4. File layout

```text
LRA/Cardinality.lean                                subject router
LRA/Cardinality/Choice.lean                         name-checked index, declares nothing
LRA/Cardinality/Definition.lean                     Equinumerous, Dominated, StrictlyDominated

LRA/Cardinality/Comparison.lean
LRA/Cardinality/Comparison/Equinumerosity/Definition.lean
LRA/Cardinality/Comparison/Equinumerosity/Theorems.lean
LRA/Cardinality/Comparison/Dominance/Definition.lean
LRA/Cardinality/Comparison/Dominance/Theorems.lean
LRA/Cardinality/Comparison/SchroederBernstein/Theorems.lean

LRA/Cardinality/Finiteness.lean
LRA/Cardinality/Finiteness/Finite/Definition.lean
LRA/Cardinality/Finiteness/Finite/Theorems.lean
LRA/Cardinality/Finiteness/Finite/FailureModes.lean
LRA/Cardinality/Finiteness/Dedekind/Definition.lean
LRA/Cardinality/Finiteness/Dedekind/Theorems.lean
LRA/Cardinality/Finiteness/Pigeonhole/Theorems.lean
LRA/Cardinality/Finiteness/Enumeration/Definition.lean      the four notions moved from Map/Image
LRA/Cardinality/Finiteness/Enumeration/Theorems.lean

LRA/Cardinality/Countability.lean
LRA/Cardinality/Countability/Countable/Definition.lean
LRA/Cardinality/Countability/Countable/Theorems.lean
LRA/Cardinality/Countability/Denumerable/Definition.lean
LRA/Cardinality/Countability/Denumerable/Theorems.lean
LRA/Cardinality/Countability/NumberSystems/Theorems.lean   ℕ×ℕ ≈ ℕ, ℤ ≈ ℕ, ℚ ≈ ℕ

LRA/Cardinality/Cantor.lean
LRA/Cardinality/Cantor/Diagonal/Theorems.lean
LRA/Cardinality/Cantor/PowerSet/Theorems.lean
LRA/Cardinality/Cantor/Continuum/Definition.lean
LRA/Cardinality/Cantor/Continuum/Theorems.lean

LRA/Cardinality/Arithmetic.lean
LRA/Cardinality/Arithmetic/Sum/Definition.lean
LRA/Cardinality/Arithmetic/Sum/Theorems.lean
LRA/Cardinality/Arithmetic/Product/Definition.lean
LRA/Cardinality/Arithmetic/Product/Theorems.lean
LRA/Cardinality/Arithmetic/Exponentiation/Definition.lean
LRA/Cardinality/Arithmetic/Exponentiation/Theorems.lean

LRA/Cardinality/SetTheoretic.lean
LRA/Cardinality/SetTheoretic/Definition.lean
LRA/Cardinality/SetTheoretic/Theorems.lean
```

---

## 5. Declaration inventory

### 5.1 Comparison

```text
Equinumerous          ∃ a bijective arrow
Dominated             ∃ an injective arrow
StrictlyDominated     Dominated ∧ ¬ Equinumerous
```

Theorems: equinumerosity is reflexive, symmetric, transitive; dominance is
reflexive and transitive; equinumerous implies dominated in both directions;
**Cantor–Schröder–Bernstein** as antisymmetry up to equinumerosity.

Marked `Equivalent to AC.`: cardinal comparability.

### 5.2 Finiteness

```text
Finite                equinumerous to an initial segment of ℕ
Infinite              ¬ Finite
DedekindInfinite      equinumerous to a proper subset of itself
FinitelyEnumerates    moved from Map/Image
HasFiniteEnumeration  moved from Map/Image
FiniteImage           moved from Map/Image
FiniteRange           moved from Map/Image
```

Theorems: a subset of a finite set is finite; the image of a finite set is
finite; pigeonhole; Dedekind-infinite → infinite. `HasFiniteEnumeration` agrees
with `Finite` — state it, since it is the theorem that retires the second notion.

`FailureModes`: a set can be infinite without an obvious enumeration failing;
the converse of pigeonhole fails for infinite sets.

Marked `Requires ACω.`: infinite → Dedekind-infinite (ACω); every infinite set has a
countably infinite subset (ACω).

### 5.3 Countability

```text
Countable       Dominated by ℕ — the finite-or-countably-infinite notion
Denumerable     Equinumerous to ℕ
Uncountable     ¬ Countable
```

Theorems: `Countable ↔ Finite ∨ Denumerable`; a subset of a countable set is
countable; ℕ × ℕ ≈ ℕ; ℤ ≈ ℕ; ℚ ≈ ℕ; a finite union of countable sets is
countable.

Marked `Requires ACω.`: a countable union of countable sets is countable (ACω).

### 5.4 Cantor

Theorems: the diagonal argument; **Cantor's theorem**, `A ≺ 𝒫(A)`; there is no
surjection `A → 𝒫(A)`; `𝒫(ℕ) ≈ ℝ`; ℝ is uncountable.

`Continuum/Definition.lean` names the continuum. `Continuum/Theorems.lean` holds
the uncountability results **and one statement-only declaration**: the continuum
hypothesis, stated precisely and annotated as independent of ZFC — neither
provable nor refutable. Mark it clearly so no one attempts a proof. This is the
natural endpoint of the section.

Replace the ad-hoc `ClosedUnitIntervalUncountable` in
`LRA/VolumeIII/Analysis/StructureOfRealLine/Cardinality.lean`, currently stated
as `¬ ∃ enumerate : ℕ → ℝ, …`, with a statement in terms of `Uncountable`. Delete
the ad-hoc form; §7.0.1 applies.

### 5.5 Arithmetic

Sum, product, and exponentiation of cardinalities, defined on equinumerosity
classes via disjoint union, product, and function space. Theorems: each operation
is well defined with respect to equinumerosity; commutativity; associativity;
distributivity; `2 ^ κ ≈ 𝒫(κ)`.

Marked `Requires AC.`: `κ + κ ≈ κ` for infinite κ. Marked `Equivalent to AC.`:
`κ · κ ≈ κ` for infinite κ.

### 5.6 SetTheoretic

```text
GraphInjectiveOnDomain    graph-level injectivity, stated through Relates
GraphOntoCodomain         graph-level surjectivity
SetEquinumerous
SetDominated
SetFinite
SetCountable
```

Theorems: `SetEquinumerous` is reflexive, symmetric, and transitive. Nothing
further. This layer exists to show the shape, not to carry the development.

---

## 6. Deferred, with homes already assigned

None of the following is built in this phase. Each is named here with its owner
so the placement decision is made once, now, rather than improvised when the work
arrives.

**Nothing below may be imported, stubbed, or partially introduced during this
phase.** If a statement in layers 1–6 turns out to need one of them, stop and
report it rather than reaching forward.

### 6.1 Maximality and well-ordering → `LRA.Order`

Zorn's lemma is one statement away, not a construction project: `LRA.Order.Chain`,
`LRA.Order.Bounds.MaximalElement`, and `LRA.Order.Bounds.UpperBound` are already
promoted and are exactly its ingredients. `WellOrder` still sits at
`LRA/VolumeI/Order/OrderedSets/WellOrder/` and is promoted by §7.1 of the
architecture document.

```text
LRA/Order/Choice.lean                                   name-checked index, as in Cardinality
LRA/Order/Maximality.lean
LRA/Order/Maximality/Zorn/Theorems.lean                 marked Equivalent to AC.
LRA/Order/Maximality/Hausdorff/Theorems.lean            marked Equivalent to AC.
LRA/Order/Maximality/Tukey/Theorems.lean                marked Equivalent to AC.
LRA/Order/OrderedSets/WellOrder/Theorems.lean           well-ordering theorem, marked Equivalent to AC.
```

`Maximality` is the group because Zorn, Hausdorff, and Tukey are maximality
principles; the well-ordering theorem stays with `WellOrder`, whose order
property it is. This confirms that the marker-plus-index convention of §3 is
repository-wide rather than cardinality-local.

### 6.2 Ordinals → a new top-level subject `LRA.Ordinal`

Ordinals need `LRA.Set` (the von Neumann construction), `LRA.Order` (well-ordering),
and `LRA.Cardinality` (initial ordinals), and nothing imports them back — the same
one-way shape that puts `Cardinality` at top level. Do **not** nest them under
`Set` or `Order`; either choice forces a false dependency.

Scope when it arrives: transitive sets and von Neumann ordinals; transfinite
induction; transfinite recursion; ordinal arithmetic; initial ordinals; cofinality.

Do not add `LRA.Ordinal` to the subject list in §1.1 of the architecture document
until it owns declarations. §1.1 forbids empty roots.

### 6.3 Alephs belong to `LRA.Ordinal`, not to `LRA.Cardinality`

An aleph is a cardinal indexed by an ordinal, so `Aleph` needs ordinals.
Defining it inside `LRA.Cardinality` would make `Cardinality` import `Ordinal`
while `Ordinal` imports `Cardinality` — a cycle. Alephs therefore land in
`LRA.Ordinal`, which is the later subject.

The direction is not arbitrary: cardinality needs nothing from ordinals, whereas
initial ordinals need both. Build in that order.

### 6.4 Equivalence families and where each one lives

Two large equivalence families run through this repository. Each deserves a
single named theorem file rather than being scattered, and the homes differ
because the dependency orders differ.

**The choice family.** Across `LRA.Order`, `LRA.Cardinality`, and eventually
`LRA.Ordinal`, six statements form one equivalence class:

```text
axiom of choice  ↔  Zorn's lemma  ↔  Hausdorff maximal principle
                 ↔  well-ordering theorem
                 ↔  cardinal comparability
                 ↔  κ · κ ≈ κ for infinite κ
```

Two of the six — comparability and κ·κ≈κ — come from this phase. Stating the
cycle needs a subject above both `Order` and `Cardinality`, and neither imports
the other, so it lands in `LRA.Ordinal.Choice.Equivalences`. Until `LRA.Ordinal`
exists, each subject's `Choice.lean` records its own principle and claims no
equivalence it cannot state.

**The completeness family.** `LRA/VolumeIII/Analysis/Completeness/CompletenessEquivalences.lean`
already owns this and already states LUB ↔ monotone convergence ↔ nested
intervals. It stays where it is, under `LRA.Analysis.Completeness`, which sits
above `LRA.Order.Bounds.LeastUpperBoundProperty` and `LRA.NumberSystems.RealNumbers`.

### 6.4.1 Choice and completeness are not equivalent — but they meet three times

There is **no** theorem "choice ↔ completeness". Dedekind completeness of ℝ is a
theorem of ZF, and AC is independent of ZF; neither implies the other. Do not
state such an equivalence.

There are, however, three genuine connections, and two of them are equivalences.
All three are deferred, but they are recorded here because the second is already
live in this repository.

**(a) Baire category theorem ↔ dependent choice.** For complete metric spaces,
BCT is equivalent to DC over ZF. This is the closest thing to a completeness–choice
equivalence and it is a real theorem. Home: `LRA/Analysis/MetricSpaces/Baire/Theorems.lean`, marked `Equivalent to DC.`
Nothing named `Baire` exists in the repository yet.

**(b) The Cauchy reals and the Dedekind reals need ACω to agree.** In ZF alone
the Cauchy reals may be a *proper subfield* of the Dedekind reals, and the Cauchy
reals need not even be Cauchy complete — you cannot choose representatives without
countable choice. ZF + ACω proves the two constructions isomorphic.

This repository builds ℝ **both ways**, in `LRA/VolumeII/RealNumbers/Cauchy.lean`
and `LRA/VolumeII/RealNumbers/Dedekind.lean`. So "our two constructions of ℝ
agree" is **not** a ZF theorem here; it requires ACω, and the statement that they
agree carries `Requires ACω.` and is indexed by a `Choice.lean` under
`LRA.NumberSystems.RealNumbers`.
This is the most consequential instance of the choice-marking policy in the whole
project, because it concerns the object every later volume depends on.

**(c) Sequential notions in metric spaces need ACω.** "Sequentially closed
implies closed", "sequentially continuous implies continuous", and "sequentially
compact iff compact" each require countable choice for metric spaces.

This has a consequence for existing work that should be **audited, not assumed**:
`CompletenessEquivalences.lean` states `BolzanoWeierstrassProperty` via
subsequences and `CauchySequencesConverge` via sequences. The implications among
LUB, monotone convergence, and the nested interval property are choice-free, but
*Cauchy completeness plus Archimedean implies LUB* is not. When the completeness
family is revisited, check each implication individually and mark the ones that
need ACω and index them. Do not audit it during this
phase; record it as pending.

### 6.5 Not deferred — genuinely excluded

- The continuum hypothesis is **stated once** in this phase (§5.4) and never
  proved in either direction. It is independent of ZFC. Restating it with alephs
  is a §6.2 concern.
- No cardinal *carrier type*. Cardinalities are compared by the relations of §5.1,
  not reified into a type. Reification needs ordinals.

## 7. Acceptance gates

- `LRA.Cardinality` is a top-level subject with a working router, importing
  `LRA.Set` and `LRA.Function` and imported by neither.
- The four finiteness notions no longer exist under the function subject, and
  their former consumers use `LRA.Cardinality`.
- Exactly one owner of finiteness and one of countability across the repository.
- Every choice-dependent theorem carries a first-line marker naming AC, ACω, or
  DC, or stating equivalence.
- No `ChoiceTheorems.lean` exists; no theorem was moved away from its topic
  because of its axiom.
- `LRA/Cardinality/Choice.lean` indexes every marked theorem, declares nothing,
  and would fail the build if a listed name were renamed or removed.
- Comparability and `κ · κ ≈ κ` are marked *equivalent* to AC, not merely
  requiring it.
- Cantor–Schröder–Bernstein and Cantor's theorem are in choice-free files.
- The continuum hypothesis appears exactly once, stated, marked independent, and
  unproved.
- The structural set-backed presentation exists, is consumed by nothing outside
  `LRA.Cardinality.SetTheoretic`, and introduces no second typed-to-set bridge.
- The σ-algebra `countable*` vocabulary is untouched, and the review records the
  two `Countable` families as semantically distinct.
- No `LRA/VolumeIII/.../Cardinality.lean` ad-hoc enumeration statement survives.
- `lake build` succeeds.
- Nothing from §6 was imported, stubbed, or partially introduced.
- Every proof is `sorry`. No proof was completed.

---

## 8. Required handoff

1. the declaration inventory as built, against §5;
2. the choice map as built, against §3.3, noting any result whose principle you
   determined differs from the table and why;
3. the four notions moved out of the function subject and every consumer updated;
4. what the structural presentation revealed that the arrow presentation hides —
   a short prose note, since that is the reason it exists;
5. anything in layers 1–6 that turned out to need ordinals, Zorn, or the
   well-ordering theorem — reported, not reached for;
6. verification commands and results.
