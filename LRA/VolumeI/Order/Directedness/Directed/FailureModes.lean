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

end LRA.Order
