import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.WellFoundedness
import LRA.NumberSystems.PeanoSystem.Recursion.BinaryIterator

/-!
Addition for a generic `PresburgerModel` -- moved, unchanged in substance,
from `LRA.VolumeII.PeanoSystems.Presburger.Operations.Addition` when that
generic tree was collapsed into this construction. Presburger arithmetic
is additive-only by definition; there is no multiplication here to move.
-/

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Presburger

open LRA.NumberSystems.PeanoSystem.Recursion

universe u v
variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
**[Definition - Addition in a Presburger Model]**

Presburger addition is the zero-based binary iterator whose value at zero in
the second coordinate is the first coordinate, and whose successor step
applies successor.
-/
noncomputable def PresburgerAddition
    (model : PresburgerModel Element SetObject) :
    Element -> Element -> Element :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model.toPeanoSystem
      Element
      Element
      (fun left => left)
      (fun _ value => model.successor value))

/-- `PresburgerAdditionClauses` states presburger addition clauses. -/
theorem PresburgerAdditionClauses
    (model : PresburgerModel Element SetObject) :
    BinaryIteratorOperationClauses
      model.toPeanoSystem
      Element
      Element
      (fun left => left)
      (fun _ value => model.successor value)
      (PresburgerAddition model) :=
  Classical.choose_spec
    (ExistenceOfBinaryIteratorOperation
      model.toPeanoSystem
      Element
      Element
      (fun left => left)
      (fun _ value => model.successor value))

/-- `PresburgerAdditionWellDefined` states presburger addition well defined. -/
theorem PresburgerAdditionWellDefined
    (model : PresburgerModel Element SetObject) :
    exists addition : Element -> Element -> Element,
      BinaryIteratorOperationClauses
        model.toPeanoSystem
        Element
        Element
        (fun left => left)
        (fun _ value => model.successor value)
        addition /\
      forall otherAddition : Element -> Element -> Element,
        BinaryIteratorOperationClauses
          model.toPeanoSystem
          Element
          Element
          (fun left => left)
          (fun _ value => model.successor value)
          otherAddition ->
        otherAddition = addition := by
  sorry

end LRA.NumberSystems.NaturalNumbers.Constructions.Presburger
