import LRA.Relation.Structures.Equivalence.Definition
import LRA.Identity.ExistenceAndUniqueness
import LRA.Set.Interface.Membership

namespace LRA.Relation

open LRA.Set

universe u v

section EquivalenceClasses

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-- `classSet` is the equivalence class of `representative` in `ambient`. -/
def IsEquivalenceClassOf
    (classSet ambient : SetObject)
    (relation : Endorelation Element)
    (representative : Element) : Prop :=
  ∀ candidate : Element,
    candidate ∈ classSet ↔
      candidate ∈ ambient ∧ relation candidate representative

section WithSeparation

variable [HasSeparation Element SetObject]

/-- The equivalence class of a representative with respect to a relation. -/
def EquivalenceClass
    (ambient : SetObject)
    (relation : Endorelation Element)
    (representative : Element) : SetObject :=
  HasSeparation.separation ambient
    (fun candidate => relation candidate representative)

section Laws

variable [SeparationLaws Element SetObject]
variable [ExtensionalityLaw Element SetObject]

theorem EquivalenceClassExists
    (ambient : SetObject)
    (relation : Endorelation Element)
    (representative : Element) :
    ∃ classSet : SetObject,
      IsEquivalenceClassOf classSet ambient relation representative := by
  sorry


theorem EquivalenceClassUnique
    (ambient : SetObject)
    (relation : Endorelation Element)
    (representative : Element) :
    LRA.Identity.Unique
      (fun classSet : SetObject =>
        IsEquivalenceClassOf classSet ambient relation representative) := by
  sorry


theorem EquivalenceClassExistsAndUnique
    (ambient : SetObject)
    (relation : Endorelation Element)
    (representative : Element) :
    LRA.Identity.ExistsAndUnique
      (fun classSet : SetObject =>
        IsEquivalenceClassOf classSet ambient relation representative) := by
  sorry


theorem EquivalenceClassMembershipIff
    (ambient : SetObject)
    (relation : Endorelation Element)
    (representative candidate : Element) :
    candidate ∈ EquivalenceClass ambient relation representative ↔
      candidate ∈ ambient ∧ relation candidate representative := by
  sorry


theorem RelatedRepresentativesHaveSameEquivalenceClass
    {relation : Endorelation Element}
    (relationIsEquivalence : EquivalenceRelation relation)
    {firstRepresentative secondRepresentative : Element}
    (representativesRelated :
      relation firstRepresentative secondRepresentative) :
    ∀ ambient : SetObject,
      EquivalenceClass ambient relation firstRepresentative =
        EquivalenceClass ambient relation secondRepresentative := by
  sorry

end Laws
end WithSeparation
end EquivalenceClasses

end LRA.Relation
