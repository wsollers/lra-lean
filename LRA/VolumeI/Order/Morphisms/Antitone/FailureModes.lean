import LRA.VolumeI.Order.Morphisms.Antitone.Definition

namespace LRA.Order

universe u v

/--
`FailsAntitone`

Statement: A map fails to reverse the displayed relations.

Logical form: `Not (Antitone sourceRelation targetRelation map)`.
-/
def FailsAntitone
    {Source : Type u} {Target : Type v}
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target)
    (map : Source -> Target) : Prop :=
  Not (Antitone sourceRelation targetRelation map)

section NaturalNumbers

/--
`NaturalIdentityFailsAntitone`

Statement: The identity map on natural numbers is not antitone.

Logical form: `FailsAntitone (fun left right : Nat => left ≤ right) (fun left right : Nat => left ≤ right) id`.
-/
theorem NaturalIdentityFailsAntitone :
    FailsAntitone
      (fun left right : Nat => left ≤ right)
      (fun left right : Nat => left ≤ right)
      (fun value => value) := by
  sorry

end NaturalNumbers

end LRA.Order
