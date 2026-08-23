import LRA.Operation.Definition

namespace LRA.Operation

universe u

                                         
abbrev NaryOperation (arity : Nat) (Alpha : Type u) :=
  (Fin arity → Alpha) → Alpha

                                                             
def NullaryAsNary {Alpha : Type u}
    (constant : NullaryOperation Alpha) : NaryOperation 0 Alpha :=
  fun _ => constant

                                                          
def UnaryAsNary {Alpha : Type u}
    (operation : UnaryOperation Alpha) : NaryOperation 1 Alpha :=
  fun input => operation (input ⟨0, by decide⟩)

                                                           
def BinaryAsNary {Alpha : Type u}
    (operation : BinaryOperation Alpha) : NaryOperation 2 Alpha :=
  fun input => operation (input ⟨0, by decide⟩) (input ⟨1, by decide⟩)

end LRA.Operation
