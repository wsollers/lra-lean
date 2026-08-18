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

Where choice enters is **content in a foundations text, not a footnote.** It must
be visible in the file layout, not discovered by reading a proof.

### 3.1 A new file role

Add one file role to §2.3 of the architecture document:

| File | Contents |
|---|---|
| `ChoiceTheorems.lean` | theorems requiring the axiom of choice or a weaker choice principle |

It sits inside the concept directory alongside `Theorems.lean`, so a theorem
stays with its topic. `LRA/Cardinality/Choice.lean` is a router importing every
`ChoiceTheorems.lean` in the subject, so the full choice surface is visible in
one place.

### 3.2 Name the principle, not just "choice"

Each `ChoiceTheorems.lean` states in its module comment which principle each
theorem needs. These are genuinely different and the differences are the point:

| Abbreviation | Principle |
|---|---|
| `AC` | full axiom of choice |
| `ACω` | countable choice |
| `DC` | dependent choice |

Where a statement is **equivalent** to a principle rather than merely implied by
it, say so — that is a stronger and more interesting fact.

### 3.3 The choice map for this subject

| Result | Needs |
|---|---|
| Cantor–Schröder–Bernstein | **nothing** |
| Cantor's theorem | **nothing** |
| ℝ ≈ 𝒫(ℕ) | **nothing** |
| finite pigeonhole | **nothing** |
| Dedekind-infinite → infinite | **nothing** |
| infinite → Dedekind-infinite | ACω |
| every infinite set has a countably infinite subset | ACω |
| countable union of countable sets is countable | ACω |
| cardinal comparability (any two cardinals are comparable) | **equivalent to AC** |
| κ + κ = κ for infinite κ | AC |
| κ · κ = κ for infinite κ | **equivalent to AC** (Tarski) |

That CSB is choice-free while comparability is equivalent to AC is the single
most instructive fact in the section. Both belong to the same layer, and the
layout should make the contrast impossible to miss: `Comparison/Theorems.lean`
holds CSB, `Comparison/ChoiceTheorems.lean` holds comparability.

---

## 4. File layout

```text
LRA/Cardinality.lean                                subject router
LRA/Cardinality/Choice.lean                         router over every ChoiceTheorems.lean
LRA/Cardinality/Definition.lean                     Equinumerous, Dominated, StrictlyDominated

LRA/Cardinality/Comparison.lean
LRA/Cardinality/Comparison/Equinumerosity/Definition.lean
LRA/Cardinality/Comparison/Equinumerosity/Theorems.lean
LRA/Cardinality/Comparison/Dominance/Definition.lean
LRA/Cardinality/Comparison/Dominance/Theorems.lean
LRA/Cardinality/Comparison/SchroederBernstein/Theorems.lean
LRA/Cardinality/Comparison/Comparability/ChoiceTheorems.lean

LRA/Cardinality/Finite.lean
LRA/Cardinality/Finite/Finite/Definition.lean
LRA/Cardinality/Finite/Finite/Theorems.lean
LRA/Cardinality/Finite/Finite/FailureModes.lean
LRA/Cardinality/Finite/Dedekind/Definition.lean
LRA/Cardinality/Finite/Dedekind/Theorems.lean
LRA/Cardinality/Finite/Dedekind/ChoiceTheorems.lean
LRA/Cardinality/Finite/Pigeonhole/Theorems.lean
LRA/Cardinality/Finite/Enumeration/Definition.lean      the four notions moved from Map/Image
LRA/Cardinality/Finite/Enumeration/Theorems.lean

LRA/Cardinality/Countable.lean
LRA/Cardinality/Countable/Countable/Definition.lean
LRA/Cardinality/Countable/Countable/Theorems.lean
LRA/Cardinality/Countable/Countable/ChoiceTheorems.lean
LRA/Cardinality/Countable/Denumerable/Definition.lean
LRA/Cardinality/Countable/Denumerable/Theorems.lean
LRA/Cardinality/Countable/NumberSystems/Theorems.lean   ℕ×ℕ ≈ ℕ, ℤ ≈ ℕ, ℚ ≈ ℕ

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
LRA/Cardinality/Arithmetic/Absorption/ChoiceTheorems.lean   κ+κ=κ, κ·κ=κ

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

`ChoiceTheorems`: comparability, recorded as *equivalent* to AC.

### 5.2 Finite

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

`ChoiceTheorems`: infinite → Dedekind-infinite (ACω); every infinite set has a
countably infinite subset (ACω).

### 5.3 Countable

```text
Countable       Dominated by ℕ — the finite-or-countably-infinite notion
Denumerable     Equinumerous to ℕ
Uncountable     ¬ Countable
```

Theorems: `Countable ↔ Finite ∨ Denumerable`; a subset of a countable set is
countable; ℕ × ℕ ≈ ℕ; ℤ ≈ ℕ; ℚ ≈ ℕ; a finite union of countable sets is
countable.

`ChoiceTheorems`: a countable union of countable sets is countable (ACω).

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

`ChoiceTheorems`: `κ + κ ≈ κ` for infinite κ (AC); `κ · κ ≈ κ` for infinite κ,
recorded as *equivalent* to AC.

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

## 6. Out of scope

- Ordinals, well-ordering, transfinite induction and recursion.
- Alephs, initial ordinals, cofinality.
- Any proof of the continuum hypothesis in either direction.
- Any cardinal *type* — cardinalities are compared by the relations above, not
  reified into a carrier. Reification needs ordinals.

If a statement in layers 1–6 cannot be made without ordinals, stop and report it
rather than importing an ordinal development.

---

## 7. Acceptance gates

- `LRA.Cardinality` is a top-level subject with a working router, importing
  `LRA.Set` and `LRA.Function` and imported by neither.
- The four finiteness notions no longer exist under the function subject, and
  their former consumers use `LRA.Cardinality`.
- Exactly one owner of finiteness and one of countability across the repository.
- Every choice-dependent theorem is in a `ChoiceTheorems.lean`, names its
  principle as AC, ACω, or DC, and says so in the module comment.
- Every theorem in a plain `Theorems.lean` is choice-free. If one is not, it is in
  the wrong file.
- Comparability and `κ · κ ≈ κ` are recorded as *equivalent* to AC, not merely
  implied by it.
- Cantor–Schröder–Bernstein and Cantor's theorem are in choice-free files.
- The continuum hypothesis appears exactly once, stated, marked independent, and
  unproved.
- The structural set-backed presentation exists, is consumed by nothing outside
  `LRA.Cardinality.SetTheoretic`, and introduces no second typed-to-set bridge.
- The σ-algebra `countable*` vocabulary is untouched, and the review records the
  two `Countable` families as semantically distinct.
- No `LRA/VolumeIII/.../Cardinality.lean` ad-hoc enumeration statement survives.
- `lake build` succeeds.
- Every proof is `sorry`. No proof was completed.

---

## 8. Required handoff

1. the declaration inventory as built, against §5;
2. the choice map as built, against §3.3, noting any result whose principle you
   determined differs from the table and why;
3. the four notions moved out of the function subject and every consumer updated;
4. what the structural presentation revealed that the arrow presentation hides —
   a short prose note, since that is the reason it exists;
5. anything in layers 1–6 that turned out to need ordinals;
6. verification commands and results.
