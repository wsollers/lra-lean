-- LRA/Cardinality/Properties/Finiteness/Definition.lean
-- Finiteness, now owned by LRA.Carrier and aliased here, plus the
-- choice-free Dedekind pair (which stays -- it is genuinely a
-- cardinality-comparison notion, not a bare carrier predicate).

import LRA.Cardinality.Theorems
import LRA.Carrier.Finiteness

namespace LRA.Cardinality

universe u

/-!
Volume I label: cardinality-finiteness-definition
Lean module: LRA.Cardinality.Properties.Finiteness.Definition
Verification status: checked definitions

`IsFinite`/`IsInfinite` moved to `LRA.Carrier` (built directly from
`LRA.Function.Bijective`, without routing through `Equinumerous`): they
are predicates about a bare carrier type, not comparisons between two
types, so they belong beside `LRA.Function` rather than inside the
cardinal-comparison apparatus this subject owns. Aliased here rather
than restated, so there is one definition, not two that happen to
agree; `LRA.Carrier.IsFinite A` unfolds to exactly `∃ n, Equinumerous A
(Fin n)` once `Equinumerous` itself is unfolded, so nothing downstream
changes meaning.

`IsDedekindInfinite`/`IsDedekindFinite` are the choice-free pair:
Dedekind-infinite (injects into a proper self-subset, witnessed by an
injection that misses a value) implies infinite outright, and the
converse needs choice -- see `FiniteImpliesDedekindFinite` in
`Theorems.lean` for the direction that holds unconditionally. These
stay here: Dedekind-(in)finiteness is a comparison between `A` and its
own self-injections, not a bare carrier predicate.
-/

/-- **[Definition — IsFinite]**

`A` is finite when it is equinumerous with `Fin n` for some `n`. See
`LRA.Carrier.IsFinite`.

Logical form:

```lean
def IsFinite (A : Type u) : Prop :=
  LRA.Carrier.IsFinite A
```
-/
def IsFinite (A : Type u) : Prop :=
  LRA.Carrier.IsFinite A

/-- **[Definition — IsInfinite]**

`A` is infinite when it is not finite. See `LRA.Carrier.IsInfinite`.

Logical form:

```lean
def IsInfinite (A : Type u) : Prop :=
  LRA.Carrier.IsInfinite A
```
-/
def IsInfinite (A : Type u) : Prop :=
  LRA.Carrier.IsInfinite A

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
