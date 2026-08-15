import LRA.VolumeI.Map.Operation.Definition

namespace LRA.Map.Operation.Laws.Distributive

open LRA.Map.Operation

universe u

/--
Left-distributivity of one binary endo-operation over another.
-/
def LeftDistributive {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  forall left right third,
    outer left (inner right third) =
      inner (outer left right) (outer left third)

/--
Right-distributivity of one binary endo-operation over another.
-/
def RightDistributive {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  forall left right third,
    outer (inner left right) third =
      inner (outer left third) (outer right third)

/--
Two-sided distributivity of one binary endo-operation over another.
-/
def TwoSidedDistributive {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  LeftDistributive outer inner /\ RightDistributive outer inner

end LRA.Map.Operation.Laws.Distributive
