import LRA.VolumeI.Map.Operation.Definition

namespace LRA.Map.Operation.Laws.Inverse

open LRA.Map.Operation

universe u

/--
Left-inverse law for a unary endo-operation relative to a binary
endo-operation and identity element.
-/
def LeftInverse {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier)
    (inverse : UnaryEndoOperation Carrier) : Prop :=
  forall element, operation (inverse element) element = identity

/--
Right-inverse law for a unary endo-operation relative to a binary
endo-operation and identity element.
-/
def RightInverse {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier)
    (inverse : UnaryEndoOperation Carrier) : Prop :=
  forall element, operation element (inverse element) = identity

/--
Two-sided inverse law for a unary endo-operation relative to a binary
endo-operation and identity element.
-/
def TwoSidedInverse {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier)
    (inverse : UnaryEndoOperation Carrier) : Prop :=
  LeftInverse operation identity inverse /\
    RightInverse operation identity inverse

end LRA.Map.Operation.Laws.Inverse
