import Mathlib.SetTheory.ZFC.Basic
import LRA.Set.Constructions.ZFCSet.Interface.UniversalAlgebra
import LRA.Set.Constructions.Mathlib.ZFSet.Instances
import LRA.Identity.Interface.UniversalAlgebra

/-! Mathlib's ZFSet interprets ZFCSet's exported algebraic signature. -/

namespace LRA.Set.MathlibZFSet

open LRA.Set.Constructions.ZFCSet.Interface.UniversalAlgebra

/--
`ZFSetAlgebra` TODO

Predicate logic:

  noncomputable def ZFSetAlgebra : LRA.Identity.AlgebraicStructure SetAlgebraicSignature where
    Carrier

Predicate logic (unfolded):

  noncomputable def ZFSetAlgebra : LRA.Identity.AlgebraicStructure SetAlgebraicSignature where
    Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def ZFSetAlgebra : LRA.Identity.AlgebraicStructure SetAlgebraicSignature where
  Carrier
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
noncomputable def ZFSetAlgebra : LRA.Identity.AlgebraicStructure SetAlgebraicSignature where
  Carrier := ZFSet
  carrierNonempty := ⟨∅⟩
  interpretOperation := fun symbol args =>
    match symbol with
    | .union => args ⟨0, by decide⟩ ∪ args ⟨1, by decide⟩
    | .inter => args ⟨0, by decide⟩ ∩ args ⟨1, by decide⟩
    | .difference => args ⟨0, by decide⟩ \ args ⟨1, by decide⟩
    | .symmDiff => HasSymmDiff.symmDiff (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .powerSet => HasPowerset.powerset (args ⟨0, by decide⟩)
    | .collectionUnion => HasCollectionUnion.collectionUnion (args ⟨0, by decide⟩)
    | .collectionIntersection =>
        HasCollectionIntersection.collectionIntersection (args ⟨0, by decide⟩)
  interpretConstant := fun constant =>
    match constant with
    | .emptySet => ∅

/--
`ZFSetAlgebraEqualityIsCongruence` TODO

Predicate logic:

  LRA.Identity.IsCongruence LRA.Set.MathlibZFSet.ZFSetAlgebra fun x1 x2 => x1 = x2

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Identity.IsCongruence LRA.Set.MathlibZFSet.ZFSetAlgebra fun x1 x2 => x1 = x2

Logical form (Lean):

```lean
theorem ZFSetAlgebraEqualityIsCongruence :
    LRA.Identity.IsCongruence ZFSetAlgebra (· = ·)
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
theorem ZFSetAlgebraEqualityIsCongruence :
    LRA.Identity.IsCongruence ZFSetAlgebra (· = ·) := by
  sorry

end LRA.Set.MathlibZFSet
