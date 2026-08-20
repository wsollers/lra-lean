# LRA.Cardinality — Proof Order

Ledger notation: see [`LRA/ProofOrderNotation.md`](../ProofOrderNotation.md).

## Narrative order

`LRA.Cardinality` (equinumerosity, domination, finiteness, countability,
Cantor) sits in `LRAStandardizedFoundations` and is Mathlib-free: every
proof here has to build on Lean 4 core plus this repo's own `LRA.Function`
and `LRA.Relation` lemma libraries, not on a Mathlib-shaped
`Function.Surjective`/`Set.Countable`.

Three files, in dependency order:

1. **`Theorems.lean`** — the core preorder/equivalence algebra
   (`Equinumerous`, `Dominates` and their closure properties), everything
   else in the subject builds on this. `CantorSchroederBernstein` and
   `CantorTheorem` are the two named theorems of the subject and the two
   genuinely hard proofs (a from-scratch back-and-forth/fixed-point
   construction and the diagonal argument, respectively, both written
   against this repo's own `Surjective := RightTotal (Graph f)`
   unfolding); everything else in the file is supporting algebra for them.
2. **`Properties/Finiteness/Theorems.lean`** — `IsFinite`/`IsInfinite` and
   their Dedekind-free cousins, transported along `Equinumerous` using
   `Theorems.lean`'s equivalence closure.
3. **`Properties/Countability/Theorems.lean`** — `IsCountable` and
   friends, imports both prior files. Its last theorem,
   `CountableSigmaOfCountableIndexCountableFibers`, is the one
   Choice-dependent theorem in the subject (its own doc comment says so:
   selecting an enumeration of each fiber simultaneously needs
   `Classical.choice`) and is placed last for that reason.

Within each file, entries are already in dependency order in the Lean
source (each theorem's own doc comment names what it builds on), so the
ledger below follows source order file-by-file rather than reordering.

## Per-theorem ledger

Status determined by direct inspection: every theorem below has a proof
body that is the single tactic `sorry` with no intermediate lemmas, so a
textual read and an axiom-closure check (`#print axioms`) agree exactly —
this is *not* a substitute for the axiom-closure check in general (see
[`ProofOrderNotation.md`](../ProofOrderNotation.md)); it happens to coincide
with it here because there is nothing between the statement and `sorry` for
the two checks to disagree about. Re-derive via
`scripts/GenerateProofOrderManifest.lean` once a Lean toolchain is
available, rather than trusting this by-eye pass for any future edit to
this subject.

### `Theorems.lean`

#### EquinumerousReflexive

∀ A : Type, Equinumerous(A, A)

**Status: PENDING**

#### EquinumerousSymmetric

∀ A : Type, ∀ B : Type, Equinumerous(A, B) → Equinumerous(B, A)

**Status: PENDING**

#### EquinumerousTransitive

∀ A : Type, ∀ B : Type, ∀ C : Type, Equinumerous(A, B) ∧ Equinumerous(B, C) → Equinumerous(A, C)

**Status: PENDING**

#### DominatesReflexive

∀ A : Type, Dominates(A, A)

**Status: PENDING**

#### DominatesTransitive

∀ A : Type, ∀ B : Type, ∀ C : Type, Dominates(A, B) ∧ Dominates(B, C) → Dominates(A, C)

**Status: PENDING**

#### DominatesOfEquinumerous

∀ A : Type, ∀ B : Type, Equinumerous(A, B) → Dominates(A, B)

**Status: PENDING**

#### CantorSchroederBernstein

∀ A : Type, ∀ B : Type, Dominates(A, B) ∧ Dominates(B, A) → Equinumerous(A, B)

**Status: PENDING**

#### CantorTheorem

∀ A : Type, ¬ ∃ f : A → (A → Prop), Surjective(f)

**Status: PENDING**

#### StrictlyDominatesPowerset

∀ A : Type, StrictlyDominates(A, A → Prop)

**Status: PENDING**

### `Properties/Finiteness/Theorems.lean`

#### IsFiniteCongr

∀ A : Type, ∀ B : Type, Equinumerous(A, B) → (IsFinite(A) ↔ IsFinite(B))

**Status: PENDING**

#### NotBothFiniteAndInfinite

∀ A : Type, ¬ (IsFinite(A) ∧ IsInfinite(A))

**Status: PENDING**

#### FiniteImpliesDedekindFinite

∀ A : Type, IsFinite(A) → IsDedekindFinite(A)

**Status: PENDING**

#### DedekindInfiniteImpliesInfinite

∀ A : Type, IsDedekindInfinite(A) → IsInfinite(A)

**Status: PENDING**

#### DominatesOfFiniteInfinite

∀ A : Type, ∀ B : Type, IsFinite(A) ∧ IsInfinite(B) → Dominates(A, B)

**Status: PENDING**

### `Properties/Countability/Theorems.lean`

#### FiniteImpliesCountable

∀ A : Type, IsFinite(A) → IsCountable(A)

**Status: PENDING**

#### CountablyInfiniteImpliesCountable

∀ A : Type, IsCountablyInfinite(A) → IsCountable(A)

**Status: PENDING**

#### CountablyInfiniteImpliesInfinite

∀ A : Type, IsCountablyInfinite(A) → IsInfinite(A)

**Status: PENDING**

#### IsCountableCongr

∀ A : Type, ∀ B : Type, Equinumerous(A, B) → (IsCountable(A) ↔ IsCountable(B))

**Status: PENDING**

#### DominatesCountableIsCountable

∀ A : Type, ∀ B : Type, Dominates(A, B) ∧ IsCountable(B) → IsCountable(A)

**Status: PENDING**

#### CountableSigmaOfCountableIndexCountableFibers

∀ Index : Type, ∀ family : Index → Type, IsCountable(Index) ∧ (∀ i : Index, IsCountable(family(i))) → IsCountable(Sigma(family))

Needs the Axiom of Choice (to select an enumeration of each fiber
simultaneously) — `Classical.choice` is in scope for this one theorem, per
its own doc comment.

**Status: PENDING**
