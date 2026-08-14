import LRA.VolumeI.Relations.Basic.CoreProperties

namespace LRA.VolumeI.Relations

universe u v

/-- A minimal element of a subset with respect to an endorelation: it belongs
to the subset, and no member of the subset sits strictly below it. Generic
over any set backend with membership -- the backend is inferred from
`subset`'s type.

Logical form:

```lean
def MinimalElement {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : Endorelation Element)
    (subset : SetObject)
    (minimum : Element) : Prop :=
  minimum ∈ subset /\
    forall element, element ∈ subset -> Not (relation element minimum)

/-- A maximal element of a subset with respect to an endorelation. -/
def MaximalElement {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : Endorelation Element)
    (subset : SetObject)
    (maximum : Element) : Prop :=
  maximum ∈ subset /\
    forall element, element ∈ subset -> Not (relation maximum element)
```
-/
def MinimalElement {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : Endorelation Element)
    (subset : SetObject)
    (minimum : Element) : Prop :=
  minimum ∈ subset /\
    forall element, element ∈ subset -> Not (relation element minimum)

end LRA.VolumeI.Relations
