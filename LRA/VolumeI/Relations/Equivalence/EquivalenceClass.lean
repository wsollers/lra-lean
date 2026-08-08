import LRA.VolumeI.Relations.Equivalence.EquivalenceRelation
import LRA.VolumeI.Identity.Theory
import LRA.VolumeI.Set.Operations.Comprehension

namespace LRA.VolumeI.Relations

universe u v

/-- A set `classSet` is the equivalence class of `representative` in `ambient`
when its members are exactly the ambient elements related to that
representative. -/
def IsEquivalenceClassOf
    (operations : LRA.VolumeI.Set.Operations.ComprehensionSetOperations.{u, v})
    (classSet ambient : operations.SetObject)
    (relation : Endorelation operations.Element)
    (representative : operations.Element) : Prop :=
  ∀ candidate,
    operations.member candidate classSet ↔
      operations.member candidate ambient ∧ relation candidate representative

/-- The equivalence class of a representative with respect to a relation. -/
def EquivalenceClass
    (operations : LRA.VolumeI.Set.Operations.ComprehensionSetOperations.{u, v})
    (ambient : operations.SetObject)
    (relation : Endorelation operations.Element)
    (representative : operations.Element) : operations.SetObject :=
  operations.separation ambient (fun candidate => relation candidate representative)

/-- For each representative, its equivalence class exists. -/
theorem EquivalenceClassExists
    (operations : LRA.VolumeI.Set.Operations.ComprehensionSetOperations.{u, v})
    (laws : LRA.VolumeI.Set.Operations.ComprehensionSetInterfaceLaws operations)
    (ambient : operations.SetObject)
    (relation : Endorelation operations.Element)
    (representative : operations.Element) :
    LRA.VolumeI.Identity.Exists
      (fun classSet : operations.SetObject =>
        IsEquivalenceClassOf operations classSet ambient relation representative) := by
  sorry

/-- An equivalence class is uniquely determined by its representative and
membership specification. -/
theorem EquivalenceClassUnique
    (operations : LRA.VolumeI.Set.Operations.ComprehensionSetOperations.{u, v})
    (laws : LRA.VolumeI.Set.Operations.ComprehensionSetInterfaceLaws operations)
    (ambient : operations.SetObject)
    (relation : Endorelation operations.Element)
    (representative : operations.Element) :
    LRA.VolumeI.Identity.Unique
      (fun classSet : operations.SetObject =>
        IsEquivalenceClassOf operations classSet ambient relation representative) := by
  sorry

/-- For each representative, there is exactly one equivalence class satisfying
the memberwise specification. -/
theorem EquivalenceClassExistsAndUnique
    (operations : LRA.VolumeI.Set.Operations.ComprehensionSetOperations.{u, v})
    (laws : LRA.VolumeI.Set.Operations.ComprehensionSetInterfaceLaws operations)
    (ambient : operations.SetObject)
    (relation : Endorelation operations.Element)
    (representative : operations.Element) :
    LRA.VolumeI.Identity.ExistsAndUnique
      (fun classSet : operations.SetObject =>
        IsEquivalenceClassOf operations classSet ambient relation representative) := by
  sorry

/-- The constructed equivalence class satisfies its defining membership
specification. -/
theorem EquivalenceClassMembershipIff
    (operations : LRA.VolumeI.Set.Operations.ComprehensionSetOperations.{u, v})
    (laws : LRA.VolumeI.Set.Operations.ComprehensionSetInterfaceLaws operations)
    (ambient : operations.SetObject)
    (relation : Endorelation operations.Element)
    (representative candidate : operations.Element) :
    operations.member candidate
        (EquivalenceClass operations ambient relation representative) ↔
      operations.member candidate ambient ∧ relation candidate representative := by
  sorry

/-- Two representatives determine the same class when they are related. -/
theorem RelatedRepresentativesHaveSameEquivalenceClass
    {operations : LRA.VolumeI.Set.Operations.ComprehensionSetOperations.{u, v}}
    {relation : Endorelation operations.Element}
    (relationIsEquivalence : EquivalenceRelation relation)
    {firstRepresentative secondRepresentative : operations.Element}
    (representativesRelated :
      relation firstRepresentative secondRepresentative) :
    ∀ ambient,
      EquivalenceClass operations ambient relation firstRepresentative =
        EquivalenceClass operations ambient relation secondRepresentative := by
  sorry

end LRA.VolumeI.Relations
