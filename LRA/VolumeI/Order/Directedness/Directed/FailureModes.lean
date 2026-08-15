import LRA.VolumeI.Set.MathlibPredicateSet
import LRA.VolumeI.Order.Directedness.Directed.Definition
import LRA.VolumeI.Order.Directedness.Chain.Definition

namespace LRA.Order

/-- The divisibility-directed subset `{2, 3, 6}` is not a chain. -/
theorem DirectedDoesNotImplyChain :
    let subset : Set Nat := {element | element = 2 \/ element = 3 \/ element = 6}
    Directed (fun left right : Nat => left ∣ right) subset /\
      Not (Chain (fun left right : Nat => left ∣ right) subset) := by
  sorry

/-- A represented subset of a directed set need not itself be directed. -/
theorem SubsetOfDirectedSetNeedNotBeDirected :
    let relation := fun left right : Nat => left ∣ right
    let ambient : Set Nat := Set.univ
    let subset : Set Nat := {element | element = 2 \/ element = 3}
    Directed relation ambient /\
      (forall element, element ∈ subset -> element ∈ ambient) /\
      Not (Directed relation subset) := by
  sorry

end LRA.Order
