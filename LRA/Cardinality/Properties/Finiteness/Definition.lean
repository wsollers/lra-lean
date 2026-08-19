-- LRA/Cardinality/Properties/Finiteness/Definition.lean
-- Finiteness, stated through equinumerosity with a canonical
-- finite-size representative, plus the choice-free Dedekind pair.

import LRA.Cardinality.Theorems

namespace LRA.Cardinality

universe u

/-!
Volume I label: cardinality-finiteness-definition
Lean module: LRA.Cardinality.Properties.Finiteness.Definition
Verification status: checked definitions

`IsFinite` uses Lean core's `Fin n` as the canonical size-`n`
representative -- infrastructure, not a competing number-system
construction, the same way `Nat` already appears freely as an index
type in `LRA.Set.Interface.Operations`'s `HasCountableUnion`.

`IsDedekindInfinite`/`IsDedekindFinite` are the choice-free pair:
Dedekind-infinite (injects into a proper self-subset, witnessed by an
injection that misses a value) implies infinite outright, and the
converse needs choice -- see `FiniteImpliesDedekindFinite` in
`Theorems.lean` for the direction that holds unconditionally.
-/

/-- **[Definition — IsFinite]**

`A` is finite when it is equinumerous with `Fin n` for some `n`.

Logical form:

```lean
def IsFinite (A : Type u) : Prop :=
  ∃ n : Nat, Equinumerous A (Fin n)
```
-/
def IsFinite (A : Type u) : Prop :=
  ∃ n : Nat, Equinumerous A (Fin n)

/-- **[Definition — IsInfinite]**

`A` is infinite when it is not finite.

Logical form:

```lean
def IsInfinite (A : Type u) : Prop :=
  ¬ IsFinite A
```
-/
def IsInfinite (A : Type u) : Prop :=
  ¬ IsFinite A

/-- **[Definition — IsDedekindInfinite]**

`A` is Dedekind-infinite when it injects into itself without covering
itself -- an injection that misses at least one value, witnessing a
proper self-subset of the same cardinality. Choice-free.

Logical form:

```lean
def IsDedekindInfinite (A : Type u) : Prop :=
  ∃ f : A → A, LRA.Function.Injective f ∧ ¬ LRA.Function.Surjective f
```
-/
def IsDedekindInfinite (A : Type u) : Prop :=
  ∃ f : A → A, LRA.Function.Injective f ∧ ¬ LRA.Function.Surjective f

/-- **[Definition — IsDedekindFinite]**

`A` is Dedekind-finite when it is not Dedekind-infinite.

Logical form:

```lean
def IsDedekindFinite (A : Type u) : Prop :=
  ¬ IsDedekindInfinite A
```
-/
def IsDedekindFinite (A : Type u) : Prop :=
  ¬ IsDedekindInfinite A

end LRA.Cardinality
