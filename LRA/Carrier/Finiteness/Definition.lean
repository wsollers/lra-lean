import LRA.Function.Properties

namespace LRA.Carrier

universe u

/-!
Size predicates about a bare carrier type, built directly from
`LRA.Function`'s `Bijective` -- one hop down from where these lived
before (`LRA.Cardinality.Properties.Finiteness`, via the `Equinumerous`
naming layer). `LRA.Cardinality.IsFinite`/`IsInfinite` now alias these
rather than restating them, so there is one definition, not two that
happen to agree.
-/

/-- `A` is finite when it is bijective with `Fin n` for some `n`.

Logical form:

```lean
def IsFinite (A : Type u) : Prop :=
  ∃ n : Nat, ∃ f : A → Fin n, LRA.Function.Bijective f
```
-/
def IsFinite (A : Type u) : Prop :=
  ∃ n : Nat, ∃ f : A → Fin n, LRA.Function.Bijective f

/-- `A` is infinite when it is not finite.

Logical form:

```lean
def IsInfinite (A : Type u) : Prop :=
  ¬ IsFinite A
```
-/
def IsInfinite (A : Type u) : Prop :=
  ¬ IsFinite A

end LRA.Carrier
