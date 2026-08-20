import LRA.Relation.Operations.Converse.Theorems

namespace LRA.Relation

universe u v

/-- Asymmetry implies irreflexivity. -/
theorem Asymmetric.implies_irreflexive
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (asymmetric : Asymmetric relation) :
    Irreflexive relation := by
  sorry

/-- An irreflexive transitive relation is asymmetric. -/
theorem Irreflexive.transitive_implies_asymmetric
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (irreflexive : Irreflexive relation)
    (transitive : Transitive relation) :
    Asymmetric relation := by
  sorry

/-- Asymmetry implies antisymmetry. -/
theorem Asymmetric.implies_antisymmetric
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (asymmetric : Asymmetric relation) :
    Antisymmetric relation := by
  sorry

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
  sorry

/-- A reflexive relation cannot be asymmetric at a displayed element. -/
theorem Reflexive.asymmetric_contradiction_at
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (reflexive : Reflexive relation)
    (asymmetric : Asymmetric relation)
    (element : Alpha) :
    False := by
  sorry

end LRA.Relation
