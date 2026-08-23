import LRA.Operation.Laws.Commutative.Definition

namespace LRA.Operation.Laws.Commutative

open LRA.Operation

universe u

                                                 
theorem Commutative.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Commutative operation)
    (first second : Carrier) :
    operation first second = operation second first := by
  sorry

                                                                    
theorem Commutative.symm_apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Commutative operation)
    (first second : Carrier) :
    operation second first = operation first second := by
  sorry

end LRA.Operation.Laws.Commutative
