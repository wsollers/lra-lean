import LRA.VolumeI.Relations.Equivalence.EquivalenceRelation
import LRA.VolumeI.Identity.Model.Theory
import LRA.VolumeI.Set.Interface.Membership

namespace LRA.VolumeI.Relations

open LRA.VolumeI.Set

universe u v

/-!
Equivalence classes, generically over any set backend with separation.

Everything here separates from an explicit ambient set -- no universal set
is involved -- so this vocabulary is available for Enderton sets and
predicate sets alike.
-/

section EquivalenceClasses

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-- A set `classSet` is the equivalence class of `representative` in
`ambient` when its members are exactly the ambient elements related to that
representative. -/
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

/-- For each representative, its equivalence class exists. -/
theorem EquivalenceClassExists
    (ambient : SetObject)
    (relation : Endorelation Element)
    (representative : Element) :
    LRA.VolumeI.Identity.Exists
      (fun classSet : SetObject =>
        IsEquivalenceClassOf classSet ambient relation representative) := by
  sorry

/-- An equivalence class is uniquely determined by its representative and
membership specification. -/
theorem EquivalenceClassUnique
    (ambient : SetObject)
    (relation : Endorelation Element)
    (representative : Element) :
    LRA.VolumeI.Identity.Unique
      (fun classSet : SetObject =>
        IsEquivalenceClassOf classSet ambient relation representative) := by
  sorry

/-- For each representative, there is exactly one equivalence class
satisfying the memberwise specification. -/
theorem EquivalenceClassExistsAndUnique
    (ambient : SetObject)
    (relation : Endorelation Element)
    (representative : Element) :
    LRA.VolumeI.Identity.ExistsAndUnique
      (fun classSet : SetObject =>
        IsEquivalenceClassOf classSet ambient relation representative) := by
  sorry

/-- The constructed equivalence class satisfies its defining membership
specification. -/
theorem EquivalenceClassMembershipIff
    (ambient : SetObject)
    (relation : Endorelation Element)
    (representative candidate : Element) :
    candidate ∈ EquivalenceClass ambient relation representative ↔
      candidate ∈ ambient ∧ relation candidate representative := by
  sorry

/-- Two representatives determine the same class when they are related. -/
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

end LRA.VolumeI.Relations
