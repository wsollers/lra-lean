import LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.Theory
import LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RationalNumbers.Interface.ModelTheory

/--
`genericTheory` The densely-ordered-field theory carried by any `RationalModel`'s own signature — generic over every backend, not tied to a specific carrier.

Predicate logic:

  ∀ (M : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalNumbersTheory M.signature

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalNumbersTheory { carrier := M.1, zero := 0, one := 1, add := fun x1 x2 => { hAdd := fun a b => M.2.add a b }.hAdd x1 x2, multiply := fun x1 x2 => { hMul := fun a b => M.3.mul a b }.hMul x1 x2, neg := fun x => M.4.neg x, le := fun x1 x2 => M.9.le x1 x2, StrictOrder := fun x1 x2 => M.8.lt x1 x2, inv := fun x => M.invInst.1 x }

Logical form (Lean):

```lean
def genericTheory (M : RationalModel) : Prop :=
  RationalNumbersTheory M.signature
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
def genericTheory (M : RationalModel) : Prop :=
  RationalNumbersTheory M.signature

/--
`satisfiesModelTheory` Every `RationalModel` satisfies `genericTheory` at its own signature: `M.fieldCert`, `M.orderCert`, `M.strictCert`, `M.addOrderCert`, `M.mulOrderCert`, and `M.denseCert` already carry the laws `RationalNumbersTheory` states.

Predicate logic:

  ∀ (M : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.genericTheory M

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    M : RationalModel
  Prove
    LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalNumbersTheory { carrier := M.1, zero := 0, one := 1, add := fun x1 x2 => { hAdd := fun a b => M.2.add a b }.hAdd x1 x2, multiply := fun x1 x2 => { hMul := fun a b => M.3.mul a b }.hMul x1 x2, neg := fun x => M.4.neg x, le := fun x1 x2 => M.9.le x1 x2, StrictOrder := fun x1 x2 => M.8.lt x1 x2, inv := fun x => M.invInst.1 x }

Logical form (Lean):

```lean
theorem satisfiesModelTheory (M : RationalModel) : genericTheory M
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
theorem satisfiesModelTheory (M : RationalModel) : genericTheory M := by
  sorry
end LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
