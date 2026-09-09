import LRA.NumberSystems.RealNumbers.Interface.ModelTheory.Theory
import LRA.NumberSystems.RealNumbers.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RealNumbers.Interface.ModelTheory

/--
`genericTheory` The complete-ordered-field theory carried by any `RealModel`'s own signature — generic over every backend, not tied to a specific carrier.

Predicate logic:

  ∀ (M : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel), LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealNumbersTheory M.signature

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealNumbersTheory { carrier := M.1, zero := 0, one := 1, add := fun x1 x2 => { hAdd := fun a b => M.2.add a b }.hAdd x1 x2, multiply := fun x1 x2 => { hMul := fun a b => M.3.mul a b }.hMul x1 x2, neg := fun x => M.4.neg x, le := fun x1 x2 => M.9.le x1 x2, StrictOrder := fun x1 x2 => M.8.lt x1 x2, inv := fun x => M.invInst.1 x }

Logical form (Lean):

```lean
def genericTheory (M : RealModel) : Prop :=
  RealNumbersTheory M.signature
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
def genericTheory (M : RealModel) : Prop :=
  RealNumbersTheory M.signature

/--
`satisfiesModelTheory` Every `RealModel` satisfies `genericTheory` at its own signature: `M.fieldCert`, `M.strictCert`, `M.denseCert`, and `M.completeCert` already carry the laws `RealNumbersTheory` states.

Predicate logic:

  ∀ (M : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel), LRA.NumberSystems.RealNumbers.Interface.ModelTheory.genericTheory M

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    M : RealModel
  Prove
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealNumbersTheory { carrier := M.1, zero := 0, one := 1, add := fun x1 x2 => { hAdd := fun a b => M.2.add a b }.hAdd x1 x2, multiply := fun x1 x2 => { hMul := fun a b => M.3.mul a b }.hMul x1 x2, neg := fun x => M.4.neg x, le := fun x1 x2 => M.9.le x1 x2, StrictOrder := fun x1 x2 => M.8.lt x1 x2, inv := fun x => M.invInst.1 x }

Logical form (Lean):

```lean
theorem satisfiesModelTheory (M : RealModel) : genericTheory M
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
theorem satisfiesModelTheory (M : RealModel) : genericTheory M := by
  sorry
end LRA.NumberSystems.RealNumbers.Interface.ModelTheory
