import LRA.VolumeI.Order.Density.DenseLinearOrder.Definition

namespace LRA.Order

universe u

/--
`FailsDenseLinearOrder`

Statement: A relation fails the dense-linear-order laws.

Logical form: `Not (DenseLinearOrder relation)`.
-/
def FailsDenseLinearOrder
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (DenseLinearOrder relation)

/--
`IntegerStrictOrderIsNotDenseLinearOrder`

Statement: The integer strict order is linear but not dense.

Logical form: `FailsDenseLinearOrder (fun left right : Int => left < right)`.
-/
theorem IntegerStrictOrderIsNotDenseLinearOrder :
    FailsDenseLinearOrder (fun left right : Int => left < right) := by
  sorry

end LRA.Order
