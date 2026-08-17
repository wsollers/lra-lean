import LRA.Operation.Definition

namespace LRA.Operation.Laws.Cancellation

open LRA.Operation

universe u

/-- Left-cancellation law for a binary endo-operation. -/
def LeftCancellative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall fixed first second,
    operation fixed first = operation fixed second -> first = second

/-- Right-cancellation law for a binary endo-operation. -/
def RightCancellative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall first second fixed,
    operation first fixed = operation second fixed -> first = second

/-- A fixed element is left-regular when left translation by that element cancels. -/
def LeftRegular {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (fixed : Carrier) : Prop :=
  forall first second,
    operation fixed first = operation fixed second -> first = second

/-- A fixed element is right-regular when right translation by that element cancels. -/
def RightRegular {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (fixed : Carrier) : Prop :=
  forall first second,
    operation first fixed = operation second fixed -> first = second

/-- Left cancellation restricted to elements satisfying an eligibility predicate. -/
def LeftCancellativeOn {Carrier : Type u}
    (eligible : Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall fixed, eligible fixed -> LeftRegular operation fixed

/-- Right cancellation restricted to elements satisfying an eligibility predicate. -/
def RightCancellativeOn {Carrier : Type u}
    (eligible : Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall fixed, eligible fixed -> RightRegular operation fixed

/-- Two-sided cancellation restricted to elements satisfying an eligibility predicate. -/
def TwoSidedCancellativeOn {Carrier : Type u}
    (eligible : Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  LeftCancellativeOn eligible operation /\
    RightCancellativeOn eligible operation

/-- Two-sided cancellation law for a binary endo-operation. -/
def TwoSidedCancellative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  LeftCancellative operation /\ RightCancellative operation

end LRA.Operation.Laws.Cancellation
