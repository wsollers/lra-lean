import LRA.NumberSystems.Integers.Interface.ModelTheory.Theory
import LRA.NumberSystems.Integers.Interface.ModelTheory.Model

namespace LRA.NumberSystems.Integers.Interface.ModelTheory

/--
`genericTheory` The discretely-ordered-integral-domain theory carried by any `IntegerModel`'s own signature — generic over every backend, not tied to a specific carrier.

Predicate logic:

  ∀ (M : LRA.NumberSystems.Integers.Interface.ModelTheory.IntegerModel), LRA.NumberSystems.Integers.Interface.ModelTheory.IntegersTheory M.signature

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.NumberSystems.Integers.Interface.ModelTheory.IntegersTheory { carrier := M.1, zero := 0, one := 1, add := fun x1 x2 => { hAdd := fun a b => M.2.add a b }.hAdd x1 x2, multiply := fun x1 x2 => { hMul := fun a b => M.3.mul a b }.hMul x1 x2, neg := fun x => M.4.neg x, le := fun x1 x2 => M.8.le x1 x2, StrictOrder := fun x1 x2 => M.7.lt x1 x2 }

Logical form (Lean):

```lean
def genericTheory (M : IntegerModel) : Prop :=
  IntegersTheory M.signature
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def genericTheory (M : IntegerModel) : Prop :=
  IntegersTheory M.signature

/--
`satisfiesModelTheory` Every `IntegerModel` satisfies `genericTheory` at its own signature: `M.domainCert`, `M.orderCert`, `M.strictCert`, `M.addOrderCert`, `M.mulOrderCert`, and `M.discreteCert` already carry the laws `IntegersTheory` states.

Predicate logic:

  ∀ (M : LRA.NumberSystems.Integers.Interface.ModelTheory.IntegerModel), LRA.NumberSystems.Integers.Interface.ModelTheory.genericTheory M

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    M : IntegerModel
  Prove
    LRA.NumberSystems.Integers.Interface.ModelTheory.IntegersTheory { carrier := M.1, zero := 0, one := 1, add := fun x1 x2 => { hAdd := fun a b => M.2.add a b }.hAdd x1 x2, multiply := fun x1 x2 => { hMul := fun a b => M.3.mul a b }.hMul x1 x2, neg := fun x => M.4.neg x, le := fun x1 x2 => M.8.le x1 x2, StrictOrder := fun x1 x2 => M.7.lt x1 x2 }

Logical form (Lean):

```lean
theorem satisfiesModelTheory (M : IntegerModel) : genericTheory M
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem satisfiesModelTheory (M : IntegerModel) : genericTheory M := by
  sorry
end LRA.NumberSystems.Integers.Interface.ModelTheory
