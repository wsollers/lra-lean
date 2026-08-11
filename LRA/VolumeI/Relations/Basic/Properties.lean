import LRA.VolumeI.Relations.Basic.CoreProperties

namespace LRA.VolumeI.Relations

universe u v

/-- A minimal element of a subset with respect to an endorelation: it belongs
to the subset, and no member of the subset sits strictly below it. Generic
over any set backend with membership -- the backend is inferred from
`subset`'s type. -/
def MinimalElement {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : Endorelation Element)
    (subset : SetObject)
    (minimum : Element) : Prop :=
  minimum ∈ subset /\
    forall element, element ∈ subset -> Not (relation element minimum)

/-- Well-foundedness of an endorelation in the omnibus subset-minimal sense:
every nonempty subset has a minimal element.

`SetObject` is explicit because nothing else in the signature determines
which backend's subsets are quantified over -- the choice of backend is
part of what is being asserted. -/
def WellFounded {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : Endorelation Element) : Prop :=
  forall subset : SetObject,
    (exists element, element ∈ subset) ->
      exists minimum, MinimalElement relation subset minimum

end LRA.VolumeI.Relations
