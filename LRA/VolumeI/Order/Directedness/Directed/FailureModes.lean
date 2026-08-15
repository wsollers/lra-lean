import LRA.VolumeI.Set.MathlibPredicateSet
import LRA.VolumeI.Order.Directedness.Directed.Definition
import LRA.VolumeI.Order.Directedness.Chain.Definition

namespace LRA.Order

universe u v

/--
`DirectednessFailsToImplyChain`

Statement: A concrete subset is directed but is not a chain.

Logical form: `Directed relation subset ∧ Not (Chain relation subset)`.
-/
def DirectednessFailsToImplyChain
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Directed relation subset /\ Not (Chain relation subset)

/--
`DirectednessFailsUnderSubset`

Statement: A directed ambient set has a represented subset that is not directed.

Logical form: `Directed relation ambient ∧ (∀ element, element ∈ subset → element ∈ ambient) ∧ Not (Directed relation subset)`.
-/
def DirectednessFailsUnderSubset
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (ambient subset : SetObject) : Prop :=
  Directed relation ambient /\
    (forall element, element ∈ subset -> element ∈ ambient) /\
      Not (Directed relation subset)

/--
`DirectedDoesNotImplyChain`

Statement: The divisibility-directed subset `{2, 3, 6}` is not a chain.

Logical form: `DirectednessFailsToImplyChain (fun left right : Nat => left ∣ right) {2, 3, 6}`.
-/
theorem DirectedDoesNotImplyChain :
    let subset : Set Nat := {element | element = 2 \/ element = 3 \/ element = 6}
    DirectednessFailsToImplyChain
      (fun left right : Nat => left ∣ right) subset := by
  sorry

/--
`SubsetOfDirectedSetNeedNotBeDirected`

Statement: A represented subset of a directed set need not itself be directed.

Logical form: `DirectednessFailsUnderSubset (fun left right : Nat => left ∣ right) Set.univ {2, 3}`.
-/
theorem SubsetOfDirectedSetNeedNotBeDirected :
    let relation := fun left right : Nat => left ∣ right
    let ambient : Set Nat := Set.univ
    let subset : Set Nat := {element | element = 2 \/ element = 3}
    DirectednessFailsUnderSubset relation ambient subset := by
  sorry

end LRA.Order
