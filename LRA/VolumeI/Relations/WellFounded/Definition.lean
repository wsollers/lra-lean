import LRA.VolumeI.Relations.Basic.Properties

namespace LRA.Relation

universe u v

/-- Well-foundedness in the subset-minimal sense: every nonempty represented
subset has a minimal element. `SetObject` is explicit because the chosen set
backend is part of the assertion. -/
def WellFounded {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : Endorelation Element) : Prop :=
  forall subset : SetObject,
    (exists element, element ∈ subset) ->
      exists minimum, MinimalElement relation subset minimum

end LRA.Relation
