import LRA.Operation.Laws.Associative.Definition

namespace LRA.Operation.Laws.Associative

open LRA.Operation

universe u

                                                            
def FailsAssociative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  ¬ Associative operation

                                                                                    
def NaturalSubtraction : BinaryEndoOperation Nat :=
  fun left right => left - right

                                                     
theorem NaturalSubtractionFailsAssociative :
    FailsAssociative NaturalSubtraction := by
  sorry

end LRA.Operation.Laws.Associative
