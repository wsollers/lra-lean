import LRA.Function.Properties

namespace LRA.Carrier

universe u

/-!
Enderton's convention: "countable" includes the finite case (an
injection into `Nat` -- a finite type trivially has one), and
"countably infinite" is the proper-infinite sub-case (a bijection with
`Nat`). Mirrors `LRA.Cardinality.Properties.Countability`'s own
convention note, one hop below the `Dominates`/`Equinumerous` naming
layer it used. `LRA.Cardinality.IsCountable`/`IsCountablyInfinite`/
`IsUncountable` now alias these.
-/

/-- `A` is countable when it injects into `Nat`: finite or countably
infinite.

Logical form:

```lean
def IsCountable (A : Type u) : Prop :=
  ∃ f : A → Nat, LRA.Function.Injective f
```
-/
def IsCountable (A : Type u) : Prop :=
  ∃ f : A → Nat, LRA.Function.Injective f

/-- `A` is countably infinite when it is bijective with `Nat`.

Logical form:

```lean
def IsCountablyInfinite (A : Type u) : Prop :=
  ∃ f : A → Nat, LRA.Function.Bijective f
```
-/
def IsCountablyInfinite (A : Type u) : Prop :=
  ∃ f : A → Nat, LRA.Function.Bijective f

/-- `A` is uncountable when it is not countable.

Logical form:

```lean
def IsUncountable (A : Type u) : Prop :=
  ¬ IsCountable A
```
-/
def IsUncountable (A : Type u) : Prop :=
  ¬ IsCountable A

end LRA.Carrier
