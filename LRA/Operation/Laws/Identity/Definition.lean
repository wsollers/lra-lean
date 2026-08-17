import LRA.Operation.Definition

namespace LRA.Operation.Laws.Identity

open LRA.Operation

universe u

/-- Left-identity law for a binary endo-operation. -/
def LeftIdentity {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop :=
  forall element, operation identity element = element

/-- Right-identity law for a binary endo-operation. -/
def RightIdentity {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop :=
  forall element, operation element identity = element

/-- Two-sided identity law for a binary endo-operation. -/
def TwoSidedIdentity {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop :=
  LeftIdentity operation identity /\ RightIdentity operation identity

end LRA.Operation.Laws.Identity
