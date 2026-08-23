import LRA.Operation.Laws.Associative.Definition

namespace LRA.Operation.Laws.Associative

open LRA.Operation

universe u

                                                    
theorem Associative.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Associative operation)
    (first second third : Carrier) :
    operation (operation first second) third =
      operation first (operation second third) := by
  sorry

                                                               
theorem Associative.reassociate_left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Associative operation)
    (first second third : Carrier) :
    operation (operation first second) third =
      operation first (operation second third) := by
  sorry

                                                               
theorem Associative.reassociate_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Associative operation)
    (first second third : Carrier) :
    operation first (operation second third) =
      operation (operation first second) third := by
  sorry

                                                                                          
theorem Associative.four_left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Associative operation)
    (first second third fourth : Carrier) :
    operation (operation (operation first second) third) fourth =
      operation first (operation second (operation third fourth)) := by
  sorry

                                                                                          
theorem Associative.four_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Associative operation)
    (first second third fourth : Carrier) :
    operation first (operation second (operation third fourth)) =
      operation (operation (operation first second) third) fourth := by
  sorry

end LRA.Operation.Laws.Associative
