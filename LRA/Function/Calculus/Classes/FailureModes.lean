import LRA.Function.Calculus.Classes.Definition
import LRA.Set.SetClass.Operations

/-!
Where the image–preimage adjunction is strict.

The unit `source ⊆ preimage (image source)` and the counit
`image (preimage target) ⊆ target` always hold. These two predicates name the
cases where the inclusion is *proper* — the adjunction does not collapse to an
equality — which is what fails for a function that is not injective, or not
surjective, respectively.
-/

namespace LRA.Function

open LRA.Set
universe u v

/-- The unit of the adjunction is a proper inclusion at this source class. -/
def UnitProper {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (source : SetClass Domain) : Prop :=
  SetClass.Included source
      (PreimageClass function (ImageClass function source)) ∧
    PreimageClass function (ImageClass function source) ≠ source

/-- The counit of the adjunction is a proper inclusion at this target class. -/
def CounitProper {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (target : SetClass Codomain) : Prop :=
  SetClass.Included
      (ImageClass function (PreimageClass function target)) target ∧
    ImageClass function (PreimageClass function target) ≠ target

end LRA.Function
