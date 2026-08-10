import LRA.VolumeI.Set.Foundation.Axioms

universe u

namespace LRA.VolumeI.Set.Foundation

/-!
Empty set existence, uniqueness, and chosen witness.
-/

/-- There exists an empty set. -/
theorem EmptySetExist
    {setUniverse : Universe.{u}}
    (emptySetAxiom : EmptySetAxiom setUniverse) :
    ∃ emptySet : setUniverse.SetObject,
      IsEmptySet setUniverse emptySet := by
  exact emptySetAxiom

/-- Any two empty sets are equal. -/
theorem EmptySetUnique
    {setUniverse : Universe.{u}}
    (extensionality : ExtensionalityAxiom setUniverse)
    {left right : setUniverse.SetObject}
    (leftEmpty : IsEmptySet setUniverse left)
    (rightEmpty : IsEmptySet setUniverse right) :
    left = right := by
  apply extensionality
  intro w
  constructor
  · intro wInLeft
    exact False.elim (leftEmpty w wInLeft)
  · intro wInRight
    exact False.elim (rightEmpty w wInRight)

/-- There exists a unique empty set. -/
theorem EmptySetExistsUnique
    {setUniverse : Universe.{u}}
    (extensionality : ExtensionalityAxiom setUniverse)
    (emptySetAxiom : EmptySetAxiom setUniverse) :
    ExistsUnique (fun emptySet : setUniverse.SetObject =>
      IsEmptySet setUniverse emptySet) := by
  rcases emptySetAxiom with ⟨emptySet, emptySetIsEmpty⟩
  refine ⟨emptySet, emptySetIsEmpty, ?_⟩
  intro otherEmptySet otherEmptySetIsEmpty
  exact EmptySetUnique extensionality otherEmptySetIsEmpty emptySetIsEmpty

/-- The empty set chosen from the empty set axiom. -/
noncomputable def emptySet
    {setUniverse : Universe.{u}}
    (emptySetAxiom : EmptySetAxiom setUniverse) :
    setUniverse.SetObject :=
  Classical.choose emptySetAxiom

/-- The chosen empty set is empty. -/
theorem emptySet_isEmpty
    {setUniverse : Universe.{u}}
    (emptySetAxiom : EmptySetAxiom setUniverse) :
    IsEmptySet setUniverse (emptySet emptySetAxiom) := by
  exact Classical.choose_spec emptySetAxiom

/-- Every empty set is equal to the chosen empty set. -/
theorem emptySet_unique
    {setUniverse : Universe.{u}}
    (extensionality : ExtensionalityAxiom setUniverse)
    (emptySetAxiom : EmptySetAxiom setUniverse)
    {otherEmptySet : setUniverse.SetObject}
    (otherEmptySetIsEmpty : IsEmptySet setUniverse otherEmptySet) :
    otherEmptySet = emptySet emptySetAxiom := by
  exact EmptySetUnique extensionality
    otherEmptySetIsEmpty
    (emptySet_isEmpty emptySetAxiom)

end LRA.VolumeI.Set.Foundation
