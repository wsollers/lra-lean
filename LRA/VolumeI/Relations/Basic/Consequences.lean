import LRA.VolumeI.Relations.Basic.Theorems

namespace LRA.Relation

/-!
Derived consequences between elementary relation properties.
-/

universe u

/-- Asymmetry implies irreflexivity. -/
theorem Asymmetric.implies_irreflexive
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (asymmetric : Asymmetric relation) :
    Irreflexive relation := by
  intro element relatedSelf
  exact asymmetric element element relatedSelf relatedSelf

/-- An irreflexive transitive relation is asymmetric. -/
theorem Irreflexive.transitive_implies_asymmetric
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (irreflexive : Irreflexive relation)
    (transitive : Transitive relation) :
    Asymmetric relation := by
  intro left right leftRelatedRight rightRelatedLeft
  exact irreflexive left
    (transitive left right left leftRelatedRight rightRelatedLeft)

/-- Asymmetry implies antisymmetry. -/
theorem Asymmetric.implies_antisymmetric
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (asymmetric : Asymmetric relation) :
    Antisymmetric relation := by
  intro left right leftRelatedRight rightRelatedLeft
  exact False.elim (asymmetric left right leftRelatedRight rightRelatedLeft)

/--
A relation that is both symmetric and antisymmetric can only relate equal
elements.
-/
theorem Symmetric.antisymmetric_related_implies_equal
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (symmetric : Symmetric relation)
    (antisymmetric : Antisymmetric relation)
    {left right : Alpha}
    (related : relation left right) :
    left = right := by
  exact antisymmetric left right related (symmetric left right related)

/-- A reflexive relation cannot be asymmetric at a displayed element. -/
theorem Reflexive.asymmetric_contradiction_at
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (reflexive : Reflexive relation)
    (asymmetric : Asymmetric relation)
    (element : Alpha) :
    False := by
  exact asymmetric element element (reflexive element) (reflexive element)

end LRA.Relation
