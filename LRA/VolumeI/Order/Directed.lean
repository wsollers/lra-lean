import LRA.VolumeI.Order.Bounds
import LRA.VolumeI.Order.Relations

namespace LRA.VolumeI.Order

universe u v

section Directedness

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-- A directed subset: every pair has an upper bound inside the subset.

This convention requires nonemptiness, following Davey--Priestley.

Logical form:

```lean
def Directed
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject) : Prop :=
  (exists element : Element, element ∈ subset) /\
    forall first second,
      first ∈ subset ->
        second ∈ subset ->
          exists upper,
            upper ∈ subset /\
              relation first upper /\ relation second upper
```
-/
def Directed
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject) : Prop :=
  (exists element : Element, element ∈ subset) /\
    forall first second,
      first ∈ subset ->
        second ∈ subset ->
          exists upper,
            upper ∈ subset /\
              relation first upper /\ relation second upper

/-- A chain is a subset whose elements are pairwise comparable.

The empty subset is a chain under this convention; unlike directedness,
nonemptiness is not part of the definition.

Logical form:

```lean
def Chain
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject) : Prop :=
  forall first second,
    first ∈ subset ->
      second ∈ subset ->
        Comparable relation first second

/-- Every nonempty chain for a reflexive relation is directed. -/
theorem NonemptyChainIsDirected
    {relation : LRA.VolumeI.Relations.Endorelation Element}
    {subset : SetObject}
    (relationIsReflexive : LRA.VolumeI.Relations.Reflexive relation)
    (subsetIsChain : Chain relation subset)
    (subsetIsNonempty : exists element : Element, element ∈ subset) :
    Directed relation subset := by
  sorry

/-- The subset `{2, 3, 6}` is directed by divisibility but is not a chain. -/
theorem DirectedDoesNotImplyChain :
    let subset : Set Nat := {element | element = 2 \/ element = 3 \/ element = 6}
    Directed (fun left right : Nat => left ∣ right) subset /\
      Not (Chain (fun left right : Nat => left ∣ right) subset) := by
  sorry
```
-/
def Chain
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject) : Prop :=
  forall first second,
    first ∈ subset ->
      second ∈ subset ->
        Comparable relation first second

end Directedness

end LRA.VolumeI.Order
