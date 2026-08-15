import Mathlib.Logic.Function.Defs
import LRA.VolumeI.Order.Morphisms.OrderEmbedding.Definition

namespace LRA.Order

universe u v

/--
`FailsOrderEmbedding`

Statement: A map fails to preserve and reflect the displayed relations.

Logical form: `Not (OrderEmbedding sourceRelation targetRelation map)`.
-/
def FailsOrderEmbedding
    {Source : Type u} {Target : Type v}
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target)
    (map : Source -> Target) : Prop :=
  Not (OrderEmbedding sourceRelation targetRelation map)

/--
`BooleanChainRelation`

Statement: The canonical two-element non-strict chain orders `false` below
`true`.

Logical form: `left = false ∨ right = true`.
-/
def BooleanChainRelation : LRA.Relation.Endorelation Bool :=
  fun left right => left = false \/ right = true

/--
`MonotoneBijectionNeedNotHaveMonotoneInverse`

Statement: The identity from the two-element antichain to the two-element
chain is a monotone bijection, but its inverse is not monotone and the map is
not an order embedding.

Logical form: bijectivity and forward monotonicity hold, inverse monotonicity
fails, and `FailsOrderEmbedding` holds.
-/
theorem MonotoneBijectionNeedNotHaveMonotoneInverse :
    Function.Bijective (fun value : Bool => value) /\
      Monotone (fun left right : Bool => left = right)
        BooleanChainRelation (fun value => value) /\
      Not (Monotone BooleanChainRelation
        (fun left right : Bool => left = right) (fun value => value)) /\
      FailsOrderEmbedding
        (fun left right : Bool => left = right)
        BooleanChainRelation (fun value => value) := by
  sorry

end LRA.Order
