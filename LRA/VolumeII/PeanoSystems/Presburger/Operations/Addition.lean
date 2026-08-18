import LRA.VolumeII.PeanoSystems.Presburger.PresburgerModel
import LRA.VolumeII.PeanoSystems.Recursion.BinaryIterator
import LRA.Logic.Model.Model

namespace LRA.NumberSystems.PeanoSystems

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
**[Definition - Addition in a Presburger Model]**

Presburger addition is the zero-based binary iterator whose value at zero in
the second coordinate is the first coordinate, and whose successor step applies
successor.


Logical form:

```lean
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
```
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

/--
`PresburgerAdditionClauses` states presburger addition clauses.

Logical form:

```lean
theorem PresburgerAdditionClauses
    (model : PresburgerModel Element SetObject) :
    BinaryIteratorOperationClauses
      model.toPeanoSystem
      Element
      Element
      (fun left => left)
      (fun _ value => model.successor value)
      (PresburgerAddition model)
```
-/
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

/--
`PresburgerAdditionWellDefined` states presburger addition well defined.

Logical form:

```lean
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
        otherAddition = addition
```
-/
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

/--
`PresburgerModel.toFirstOrderModel` defines the displayed object for to first order model.

Logical form:

```lean
noncomputable def PresburgerModel.toFirstOrderModel
    (model : PresburgerModel Element SetObject) :
    LRA.Logic.FirstOrder.Model PresburgerSignature where
  Domain
```
-/
noncomputable def PresburgerModel.toFirstOrderModel
    (model : PresburgerModel Element SetObject) :
    LRA.Logic.FirstOrder.Model PresburgerSignature where
  Domain := Element
  domainNonempty := ⟨model.zero⟩
  interpretFunction
    | .successor, args => model.successor (args ⟨0, by decide⟩)
    | .addition, args =>
        PresburgerAddition model (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation
    | .lessThan, args =>
        model.lessThan (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .zero => model.zero

end LRA.NumberSystems.PeanoSystems
