import LRA.Set.Constructions.ZFCSet.Interface.UniversalAlgebra
import LRA.Set.Constructions.TGSet.Instances
import LRA.Identity.Interface.UniversalAlgebra

/-! TGSet interprets ZFCSet's exported algebraic signature. -/

namespace LRA.Set.Constructions.TGSet

open LRA.Set.Constructions.ZFCSet.Interface.UniversalAlgebra

/--
`TGSetAlgebra` TODO

Predicate logic:

  noncomputable def TGSetAlgebra : LRA.Identity.AlgebraicStructure SetAlgebraicSignature where
    Carrier

Predicate logic (unfolded):

  noncomputable def TGSetAlgebra : LRA.Identity.AlgebraicStructure SetAlgebraicSignature where
    Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TGSetAlgebra : LRA.Identity.AlgebraicStructure SetAlgebraicSignature where
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
noncomputable def TGSetAlgebra : LRA.Identity.AlgebraicStructure SetAlgebraicSignature where
  Carrier := LRA.Set.Constructions.TGSet
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
`TGSetAlgebraEqualityIsCongruence` TODO

Predicate logic:

  LRA.Identity.IsCongruence LRA.Set.Constructions.TGSet.TGSetAlgebra fun x1 x2 => x1 = x2

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Identity.IsCongruence LRA.Set.Constructions.TGSet.TGSetAlgebra fun x1 x2 => x1 = x2

Logical form (Lean):

```lean
theorem TGSetAlgebraEqualityIsCongruence :
    LRA.Identity.IsCongruence TGSetAlgebra (· = ·)
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
theorem TGSetAlgebraEqualityIsCongruence :
    LRA.Identity.IsCongruence TGSetAlgebra (· = ·) := by
  sorry

end LRA.Set.Constructions.TGSet
