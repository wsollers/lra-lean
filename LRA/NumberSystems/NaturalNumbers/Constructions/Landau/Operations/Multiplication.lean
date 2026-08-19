import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.Operations.Addition

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Landau

open LRA.NumberSystems.PeanoSystem
open LRA.NumberSystems.PeanoSystem.Recursion

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]


/--
**[Definition - Multiplication on N]**

Multiplication on a one-based Peano system is the binary iterator whose value
at the distinguished element of the second coordinate is the first
coordinate, and whose successor step adds the first coordinate.
-/
noncomputable def LandauMultiplication
    (model : PeanoSystem Element SetObject) :
    Element -> Element -> Element :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model
      Element
      Element
      (fun left => left)
      (fun left value => LandauAddition model value left))

/-- `LandauMultiplicationClauses` states landau multiplication clauses. -/
theorem LandauMultiplicationClauses
    (model : PeanoSystem Element SetObject) :
    BinaryIteratorOperationClauses
      model
      Element
      Element
      (fun left => left)
      (fun left value => LandauAddition model value left)
      (LandauMultiplication model) :=
  Classical.choose_spec
    (ExistenceOfBinaryIteratorOperation
      model
      Element
      Element
      (fun left => left)
      (fun left value => LandauAddition model value left))

/-- `LandauMultiplicationWellDefined` states landau multiplication well defined. -/
theorem LandauMultiplicationWellDefined
    (model : PeanoSystem Element SetObject) :
    exists multiplication : Element -> Element -> Element,
      BinaryIteratorOperationClauses
        model
        Element
        Element
        (fun left => left)
        (fun left value => LandauAddition model value left)
        multiplication /\
      forall otherMultiplication : Element -> Element -> Element,
        BinaryIteratorOperationClauses
          model
          Element
          Element
          (fun left => left)
          (fun left value => LandauAddition model value left)
          otherMultiplication ->
        otherMultiplication = multiplication :=
  BinaryIteratorOperationWellDefined
    model
    Element
    Element
    (fun left => left)
    (fun left value => LandauAddition model value left)

/-- `LandauMultiplicationWithOne` states landau multiplication with one. -/
theorem LandauMultiplicationWithOne
    (model : PeanoSystem Element SetObject)
    (left : Element) :
    LandauMultiplication model left model.one = left :=
  (LandauMultiplicationClauses model left).1

/-- `LandauMultiplicationSuccessorOnRight` states landau multiplication successor on right. -/
theorem LandauMultiplicationSuccessorOnRight
    (model : PeanoSystem Element SetObject)
    (left right : Element) :
    LandauMultiplication model left (model.successor right) =
      LandauAddition model (LandauMultiplication model left right) left :=
  (LandauMultiplicationClauses model left).2 right

/-- `LandauMultiplicationDistributesOverAddition` states landau multiplication distributes over addition. -/
theorem LandauMultiplicationDistributesOverAddition
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Laws.Distributive.RightDistributive
      (LandauMultiplication model)
      (LandauAddition model) := by
  sorry

/-- `LandauLeftDistributivityOfMultiplicationOverAddition` states landau left distributivity of multiplication over addition. -/
theorem LandauLeftDistributivityOfMultiplicationOverAddition
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Laws.Distributive.LeftDistributive
      (LandauMultiplication model)
      (LandauAddition model) := by
  sorry

/-- `LandauMultiplicationDistributesOverAdditionBothSides` states landau multiplication distributes over addition both sides. -/
theorem LandauMultiplicationDistributesOverAdditionBothSides
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Laws.Distributive.TwoSidedDistributive
      (LandauMultiplication model)
      (LandauAddition model) := by
  sorry

/-- `LandauMultiplicationIsAssociative` states landau multiplication is associative. -/
theorem LandauMultiplicationIsAssociative
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Laws.Associative.Associative (LandauMultiplication model) := by
  sorry

/-- `LandauMultiplicationIsCommutative` states landau multiplication is commutative. -/
theorem LandauMultiplicationIsCommutative
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Laws.Commutative.Commutative (LandauMultiplication model) := by
  sorry

end LRA.NumberSystems.NaturalNumbers.Constructions.Landau
