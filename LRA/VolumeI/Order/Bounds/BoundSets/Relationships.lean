import LRA.VolumeI.Order.Bounds.BoundSets.Theorems

namespace LRA.Order

open LRA.Set

universe u v

section GaloisRelationships

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [Union SetObject] [Inter SetObject] [SDiff SetObject]
variable [EmptyCollection SetObject] [HasSubset SetObject]
variable [HasSeparation Element SetObject]
variable [HasUniversal SetObject] [HasComplement SetObject]
variable [MembershipLaws Element SetObject]
variable [SeparationLaws Element SetObject]
variable [UniversalMembershipLaws Element SetObject]
variable [ExtensionalityLaw Element SetObject]
variable [SubsetLaws SetObject]

/--
`SubsetOfLowerBoundsOfUpperBounds`

Statement: Every represented subset is contained in the lower bounds of all
of its upper bounds.

Logical form: `subset ⊆ LowerBounds relation (UpperBounds relation subset)`.
-/
theorem SubsetOfLowerBoundsOfUpperBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    subset ⊆ LowerBounds relation (UpperBounds relation subset) := by
  sorry

/--
`SubsetOfUpperBoundsOfLowerBounds`

Statement: Every represented subset is contained in the upper bounds of all
of its lower bounds.

Logical form: `subset ⊆ UpperBounds relation (LowerBounds relation subset)`.
-/
theorem SubsetOfUpperBoundsOfLowerBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    subset ⊆ UpperBounds relation (LowerBounds relation subset) := by
  sorry

/--
`UpperBoundsLowerBoundsUpperBounds`

Statement: Applying upper, lower, and upper-bound formation in succession
returns the original upper-bound set.

Logical form: `U (L (U subset)) = U subset`.
-/
theorem UpperBoundsLowerBoundsUpperBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    UpperBounds relation
        (LowerBounds relation (UpperBounds relation subset)) =
      UpperBounds relation subset := by
  sorry

/--
`LowerBoundsUpperBoundsLowerBounds`

Statement: Applying lower, upper, and lower-bound formation in succession
returns the original lower-bound set.

Logical form: `L (U (L subset)) = L subset`.
-/
theorem LowerBoundsUpperBoundsLowerBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    LowerBounds relation
        (UpperBounds relation (LowerBounds relation subset)) =
      LowerBounds relation subset := by
  sorry

/--
`LowerUpperClosureIsExtensive`

Statement: Lower-upper closure contains the represented subset.

Logical form: `subset ⊆ LowerUpperClosure relation subset`.
-/
theorem LowerUpperClosureIsExtensive
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    subset ⊆ LowerUpperClosure relation subset := by
  sorry

/--
`LowerUpperClosureIsMonotone`

Statement: Lower-upper closure preserves represented subset inclusion.

Logical form: `smaller ⊆ larger → LowerUpperClosure relation smaller ⊆ LowerUpperClosure relation larger`.
-/
theorem LowerUpperClosureIsMonotone
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject}
    (smallerIsContained : smaller ⊆ larger) :
    LowerUpperClosure relation smaller ⊆
      LowerUpperClosure relation larger := by
  sorry

/--
`LowerUpperClosureIsIdempotent`

Statement: Applying lower-upper closure twice has the same effect as applying
it once.

Logical form: `LowerUpperClosure relation (LowerUpperClosure relation subset) = LowerUpperClosure relation subset`.
-/
theorem LowerUpperClosureIsIdempotent
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    LowerUpperClosure relation (LowerUpperClosure relation subset) =
      LowerUpperClosure relation subset := by
  sorry

/--
`UpperLowerClosureIsExtensive`

Statement: Upper-lower closure contains the represented subset.

Logical form: `subset ⊆ UpperLowerClosure relation subset`.
-/
theorem UpperLowerClosureIsExtensive
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    subset ⊆ UpperLowerClosure relation subset := by
  sorry

/--
`UpperLowerClosureIsMonotone`

Statement: Upper-lower closure preserves represented subset inclusion.

Logical form: `smaller ⊆ larger → UpperLowerClosure relation smaller ⊆ UpperLowerClosure relation larger`.
-/
theorem UpperLowerClosureIsMonotone
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject}
    (smallerIsContained : smaller ⊆ larger) :
    UpperLowerClosure relation smaller ⊆
      UpperLowerClosure relation larger := by
  sorry

/--
`UpperLowerClosureIsIdempotent`

Statement: Applying upper-lower closure twice has the same effect as applying
it once.

Logical form: `UpperLowerClosure relation (UpperLowerClosure relation subset) = UpperLowerClosure relation subset`.
-/
theorem UpperLowerClosureIsIdempotent
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    UpperLowerClosure relation (UpperLowerClosure relation subset) =
      UpperLowerClosure relation subset := by
  sorry

end GaloisRelationships

end LRA.Order
