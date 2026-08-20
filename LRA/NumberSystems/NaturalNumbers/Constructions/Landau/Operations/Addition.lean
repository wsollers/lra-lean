import LRA.Operation
import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.WellFoundedness
import LRA.NumberSystems.PeanoSystem.Recursion.BinaryIterator

/-!
Addition, defined for any one-based Peano system -- not hard-committed to
`LandauElement` specifically, matching how `WholeNumbers/Construction/Model.lean`
already consumes this content generically (it adjoins a zero to "the active
one-based natural carrier," not to `LandauElement` by name). `LandauPeanoSystem`
(`WellFoundedness.lean`) is the canonical witness that a `model` satisfying
these obligations actually exists.

Moved and renamed from `LRA.NumberSystems.NaturalNumbers.NAddition` etc.
(`N` prefix -> `Landau` prefix) when `NModel` was retired -- `NModel` added
nothing over `LRA.NumberSystems.PeanoSystem.PeanoSystem`, so `model` here
*is* a `PeanoSystem` value directly; every former `model.toPeanoSystem` call
is simply `model`.
-/

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Landau

open LRA.NumberSystems.PeanoSystem
open LRA.NumberSystems.PeanoSystem.Recursion

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]


/--
**[Definition - Addition on N]**

Addition on a one-based Peano system is the binary iterator whose value at the
distinguished element of the second coordinate is the successor of the first
coordinate, and whose successor step applies successor.
-/
noncomputable def LandauAddition
    (model : PeanoSystem Element SetObject) :
    Element -> Element -> Element :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model
      Element
      Element
      (fun left => model.successor left)
      (fun _ value => model.successor value))

/-- `LandauAdditionClauses` states landau addition clauses. -/
theorem LandauAdditionClauses
    (model : PeanoSystem Element SetObject) :
    BinaryIteratorOperationClauses
      model
      Element
      Element
      (fun left => model.successor left)
      (fun _ value => model.successor value)
      (LandauAddition model) := by
  sorry

/-- `LandauAdditionWellDefined` states landau addition well defined. -/
theorem LandauAdditionWellDefined
    (model : PeanoSystem Element SetObject) :
    exists addition : Element -> Element -> Element,
      BinaryIteratorOperationClauses
        model
        Element
        Element
        (fun left => model.successor left)
        (fun _ value => model.successor value)
        addition /\
      forall otherAddition : Element -> Element -> Element,
        BinaryIteratorOperationClauses
          model
          Element
          Element
          (fun left => model.successor left)
          (fun _ value => model.successor value)
          otherAddition ->
        otherAddition = addition := by
  sorry

/-- `LandauAdditionWithOne` states landau addition with one. -/
theorem LandauAdditionWithOne
    (model : PeanoSystem Element SetObject)
    (left : Element) :
    LandauAddition model left model.one = model.successor left := by
  sorry

/-- `LandauAdditionSuccessorOnRight` states landau addition successor on right. -/
theorem LandauAdditionSuccessorOnRight
    (model : PeanoSystem Element SetObject)
    (left right : Element) :
    LandauAddition model left (model.successor right) =
      model.successor (LandauAddition model left right) := by
  sorry

/-- `LandauAdditionIsAssociative` states landau addition is associative. -/
theorem LandauAdditionIsAssociative
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Laws.Associative.Associative (LandauAddition model) := by
  sorry

/-- `LandauAdditionIsCommutative` states landau addition is commutative. -/
theorem LandauAdditionIsCommutative
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Laws.Commutative.Commutative (LandauAddition model) := by
  sorry

end LRA.NumberSystems.NaturalNumbers.Constructions.Landau
