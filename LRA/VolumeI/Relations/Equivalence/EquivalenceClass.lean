import LRA.VolumeI.Relations.Equivalence.EquivalenceRelation

namespace LRA.VolumeI.Relations

universe u

/-- The equivalence class of a representative with respect to a relation. -/
def EquivalenceClass {Alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation Alpha)
    (representative : Alpha) : LRA.VolumeI.Set.LRASet Alpha :=
  fun candidate => relation candidate representative

/-- Two representatives determine the same class when they are related. -/
theorem RelatedRepresentativesHaveSameEquivalenceClass
    {Alpha : LRA.VolumeI.Set.LRACarrier}
    {relation : Endorelation Alpha}
    (relationIsEquivalence : EquivalenceRelation relation)
    {firstRepresentative secondRepresentative : Alpha}
    (representativesRelated :
      relation firstRepresentative secondRepresentative) :
    EquivalenceClass relation firstRepresentative =
      EquivalenceClass relation secondRepresentative := by
  sorry

end LRA.VolumeI.Relations
