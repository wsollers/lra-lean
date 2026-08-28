import LRA.NumberSystems.Integers.Interface.Definition
import LRA.NumberSystems.Interface.ModelTheory.CanonicalEmbeddings

namespace LRA.NumberSystems.Integers

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.Interface.ModelTheory.CanonicalEmbeddings

universe u

/--
`IntegerInitiality` TODO

Predicate logic:

  ∃! map : integerSystem.Model.Carrier → target.Carrier, EmbeddingPreservesOrderedRing integerSystem.Model.signature target.signature map

Predicate logic (unfolded):

  ∀ (integerSystem : LRA.NumberSystems.Integers.IntegerNumberSystem) (target : LRA.NumberSystems.Interface.ModelTheory.DiscretelyOrderedIntegralDomainModel), Exists fun x => ((fun map => LRA.NumberSystems.Interface.ModelTheory.CanonicalEmbeddings.EmbeddingPreservesOrderedRing { carrier := integerSystem.Model.1, zero := integerSystem.Model.zeroInst.1, one := integerSystem.Model.oneInst.1, add := fun x1 x2 => instHAdd.1 x1 x2, multiply := fun x1 x2 => instHMul.1 x1 x2, neg := fun x => integerSystem.Model.negInst.1 x, le := fun x1 x2 => integerSystem.Model.leInst.1 x1 x2, StrictOrder := fun x1 x2 => integerSystem.Model.ltInst.1 x1 x2 } { carrier := target.1, zero := target.zeroInst.1, one := target.oneInst.1, add := fun x1 x2 => instHAdd.1 x1 x2, multiply := fun x1 x2 => instHMul.1 x1 x2, neg := fun x => target.negInst.1 x, le := fun x1 x2 => target.leInst.1 x1 x2, StrictOrder := fun x1 x2 => target.ltInst.1 x1 x2 } map) x ∧ ∀ (y : integerSystem.Model.1 → target.1), LRA.NumberSystems.Interface.ModelTheory.CanonicalEmbeddings.EmbeddingPreservesOrderedRing { carrier := integerSystem.Model.1, zero := integerSystem.Model.zeroInst.1, one := integerSystem.Model.oneInst.1, add := fun x1 x2 => instHAdd.1 x1 x2, multiply := fun x1 x2 => instHMul.1 x1 x2, neg := fun x => integerSystem.Model.negInst.1 x, le := fun x1 x2 => integerSystem.Model.leInst.1 x1 x2, StrictOrder := fun x1 x2 => integerSystem.Model.ltInst.1 x1 x2 } { carrier := target.1, zero := target.zeroInst.1, one := target.oneInst.1, add := fun x1 x2 => instHAdd.1 x1 x2, multiply := fun x1 x2 => instHMul.1 x1 x2, neg := fun x => target.negInst.1 x, le := fun x1 x2 => target.leInst.1 x1 x2, StrictOrder := fun x1 x2 => target.ltInst.1 x1 x2 } y → y = x)

Logical form (Lean):

```lean
theorem IntegerInitiality
    (integerSystem : IntegerNumberSystem.{u})
    (target : DiscretelyOrderedIntegralDomainModel.{u}) :
    ∃! map : integerSystem.Model.Carrier → target.Carrier,
      EmbeddingPreservesOrderedRing
        integerSystem.Model.signature target.signature map
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem IntegerInitiality
    (integerSystem : IntegerNumberSystem.{u})
    (target : DiscretelyOrderedIntegralDomainModel.{u}) :
    ∃! map : integerSystem.Model.Carrier → target.Carrier,
      EmbeddingPreservesOrderedRing
        integerSystem.Model.signature target.signature map := by
  sorry

end LRA.NumberSystems.Integers
