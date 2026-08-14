import Mathlib.Logic.Function.Defs
import LRA.VolumeI.Order.Morphisms.OrderEmbedding.Definition

namespace LRA.VolumeI.Order

/-- The canonical two-element non-strict chain. -/
def BooleanChainRelation : LRA.VolumeI.Relations.Endorelation Bool :=
  fun left right => left = false \/ right = true

/--
The identity from the two-element antichain to the two-element chain is a
monotone bijection, but its inverse is not monotone. Thus bijective monotonicity
does not replace reflection in the definition of an order embedding.
-/
theorem MonotoneBijectionNeedNotHaveMonotoneInverse :
    Function.Bijective (fun value : Bool => value) /\
      Monotone (fun left right : Bool => left = right)
        BooleanChainRelation (fun value => value) /\
      Not (Monotone BooleanChainRelation
        (fun left right : Bool => left = right) (fun value => value)) := by
  sorry

end LRA.VolumeI.Order
