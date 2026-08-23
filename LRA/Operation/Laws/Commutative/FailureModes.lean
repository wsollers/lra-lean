import LRA.Operation.Laws.Commutative.Definition

namespace LRA.Operation.Laws.Commutative

open LRA.Operation

universe u

                                                            
def FailsCommutative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  Not (Commutative operation)

                                                                          
def NaturalSubtraction : BinaryEndoOperation Nat :=
  fun left right => left - right

                                                     
theorem NaturalSubtractionFailsCommutative :
    FailsCommutative NaturalSubtraction := by
  sorry

end LRA.Operation.Laws.Commutative
