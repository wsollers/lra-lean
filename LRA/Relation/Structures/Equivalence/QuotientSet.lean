import LRA.Relation.Structures.Equivalence.Partition
import LRA.Identity.ExistenceAndUniqueness

namespace LRA.Relation

open LRA.Set

universe u v w

section QuotientSets

variable {Element : Type u} {SetObject : Type v} {Collection : Type w}
variable [Membership Element SetObject]
variable [Membership SetObject Collection]
variable [HasSeparation Element SetObject]

section WithPowerset

variable [HasPowerset SetObject Collection]

/-- `quotient` is the quotient set of `ambient` by `relation`. -/
def IsQuotientSetOf
    (quotient : Collection)
    (ambient : SetObject)
    (relation : Endorelation Element) : Prop :=
  ∀ candidate : SetObject,
    candidate ∈ quotient ↔
      candidate ∈ (HasPowerset.powerset ambient : Collection) ∧
        ∃ representative : Element,
          representative ∈ ambient ∧
            candidate = EquivalenceClass ambient relation representative

section WithCollectionSeparation

variable [HasSeparation SetObject Collection]

/-- The quotient collection of equivalence classes. -/
def QuotientSet
    (ambient : SetObject)
    (relation : Endorelation Element) : Collection :=
  HasSeparation.separation (HasPowerset.powerset ambient : Collection)
    (fun candidate =>
      ∃ representative : Element,
        representative ∈ ambient ∧
          candidate = EquivalenceClass ambient relation representative)

section Laws

variable [SeparationLaws SetObject Collection]
variable [ExtensionalityLaw SetObject Collection]
variable [HasSubset SetObject]
variable [PowersetMembershipLaws SetObject Collection]
variable [SeparationLaws Element SetObject]
variable [ExtensionalityLaw Element SetObject]

theorem QuotientSetExists
    (ambient : SetObject)
    (relation : Endorelation Element) :
    ∃ quotient : Collection,
      IsQuotientSetOf quotient ambient relation := by
  sorry

theorem QuotientSetUnique
    (ambient : SetObject)
    (relation : Endorelation Element) :
    LRA.Identity.Unique
      (fun quotient : Collection =>
        IsQuotientSetOf quotient ambient relation) := by
  sorry

theorem QuotientSetExistsAndUnique
    (ambient : SetObject)
    (relation : Endorelation Element) :
    LRA.Identity.ExistsAndUnique
      (fun quotient : Collection =>
        IsQuotientSetOf quotient ambient relation) := by
  sorry

theorem QuotientSetMembership
    (ambient : SetObject)
    (relation : Endorelation Element)
    (candidate : SetObject) :
    candidate ∈ QuotientSet (Collection := Collection) ambient relation ↔
      candidate ∈ (HasPowerset.powerset ambient : Collection) ∧
        ∃ representative : Element,
          representative ∈ ambient ∧
            candidate = EquivalenceClass ambient relation representative := by
  sorry

end Laws
end WithCollectionSeparation
end WithPowerset

/-- The canonical projection to equivalence classes. -/
def QuotientProjection
    (ambient : SetObject)
    (relation : Endorelation Element) :
    Element -> SetObject :=
  fun element => EquivalenceClass ambient relation element

/-- Collection-facing synonym for the quotient projection. -/
def QuotientClassElement
    (ambient : SetObject)
    (relation : Endorelation Element) :
    Element -> SetObject :=
  QuotientProjection ambient relation

section WellDefined

variable [SeparationLaws Element SetObject]
variable [ExtensionalityLaw Element SetObject]

theorem QuotientProjectionWellDefined
    {ambient : SetObject}
    {relation : Endorelation Element}
    (relationIsEquivalence : EquivalenceRelation relation)
    {firstRepresentative secondRepresentative : Element}
    (representativesRelated : relation firstRepresentative secondRepresentative) :
    QuotientProjection ambient relation firstRepresentative =
      QuotientProjection ambient relation secondRepresentative := by
  sorry

theorem QuotientClassElementWellDefined
    {ambient : SetObject}
    {relation : Endorelation Element}
    (relationIsEquivalence : EquivalenceRelation relation)
    {firstRepresentative secondRepresentative : Element}
    (representativesRelated : relation firstRepresentative secondRepresentative) :
    QuotientClassElement ambient relation firstRepresentative =
      QuotientClassElement ambient relation secondRepresentative := by
  sorry

end WellDefined
end QuotientSets

end LRA.Relation
