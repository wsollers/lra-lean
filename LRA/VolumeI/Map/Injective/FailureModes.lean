import LRA.VolumeI.Map.Injective.Definition
import LRA.VolumeI.Map.Examples.Canonical

namespace LRA.Map.Injective

open LRA.Map.Typed
open LRA.Map.Examples.Canonical

universe u v

/--
A map has a collision when two distinct domain elements have the same image.
-/
def HasCollision {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) : Prop :=
  exists first second : Domain, first ≠ second /\ map first = map second

/--
A collision is exactly a failure of injectivity.
-/
theorem HasCollisionIffNotInjective
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    HasCollision map <-> ¬ Injective map := by
  classical
  constructor
  · intro collision injective
    obtain ⟨first, second, distinct, equalValues⟩ := collision
    exact distinct (injective first second equalValues)
  · intro notInjective
    by_cases collision : HasCollision map
    · exact collision
    · exfalso
      apply notInjective
      intro first second equalValues
      by_cases equalInputs : first = second
      · exact equalInputs
      · exfalso
        exact collision ⟨first, second, equalInputs, equalValues⟩

/--
The Boolean collapse map has a collision.
-/
theorem CollapseHasCollision :
    HasCollision collapse := by
  exact ⟨true, false, by decide, rfl⟩

/--
The Boolean collapse map is not injective.
-/
theorem CollapseNotInjective :
    ¬ Injective collapse :=
  (HasCollisionIffNotInjective collapse).mp CollapseHasCollision

end LRA.Map.Injective
