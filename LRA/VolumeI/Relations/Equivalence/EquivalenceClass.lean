import LRA.VolumeI.Relations.Equivalence.EquivalenceRelation
import LRA.VolumeI.Set.Operations.Comprehension

namespace LRA.VolumeI.Relations

universe u v

/-- The equivalence class of a representative with respect to a relation. -/
def EquivalenceClass
    (operations : LRA.VolumeI.Set.Operations.ComprehensionSetOperations.{u, v})
    (ambient : operations.SetObject)
    (relation : Endorelation operations.Element)
    (representative : operations.Element) : operations.SetObject :=
  operations.separation ambient (fun candidate => relation candidate representative)

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
