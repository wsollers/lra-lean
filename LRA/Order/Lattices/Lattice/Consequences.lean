import LRA.Order.Lattices.Lattice.Theorems
import LRA.Order.Lattices.Join.Theorems
import LRA.Order.Lattices.Meet.Theorems
import LRA.Operation.Laws.Absorption.Definition
import LRA.Operation.Laws.Associative.Definition
import LRA.Operation.Laws.Commutative.Definition
import LRA.Operation.Laws.Idempotent.Definition

namespace LRA.Order

open LRA.Operation

universe u

   
                                                                              
                  
  
def IsJoinOperation {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier)
    (joinOperation : BinaryEndoOperation Carrier) : Prop :=
  forall left right,
    Join relation left right (joinOperation left right)

   
                                                                              
                  
  
def IsMeetOperation {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier)
    (meetOperation : BinaryEndoOperation Carrier) : Prop :=
  forall left right,
    Meet relation left right (meetOperation left right)

                                                                 
theorem JoinOperationCommutative
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {joinOperation : BinaryEndoOperation Carrier}
    (isJoinOperation : IsJoinOperation relation joinOperation) :
    LRA.Operation.Laws.Commutative.Commutative joinOperation := by
  sorry

                                                                 
theorem MeetOperationCommutative
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {meetOperation : BinaryEndoOperation Carrier}
    (isMeetOperation : IsMeetOperation relation meetOperation) :
    LRA.Operation.Laws.Commutative.Commutative meetOperation := by
  sorry

                                                                
theorem JoinOperationIdempotent
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {joinOperation : BinaryEndoOperation Carrier}
    (isJoinOperation : IsJoinOperation relation joinOperation) :
    LRA.Operation.Laws.Idempotent.Idempotent joinOperation := by
  sorry

                                                                
theorem MeetOperationIdempotent
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {meetOperation : BinaryEndoOperation Carrier}
    (isMeetOperation : IsMeetOperation relation meetOperation) :
    LRA.Operation.Laws.Idempotent.Idempotent meetOperation := by
  sorry

                                                                 
theorem JoinOperationAssociative
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {joinOperation : BinaryEndoOperation Carrier}
    (isJoinOperation : IsJoinOperation relation joinOperation) :
    LRA.Operation.Laws.Associative.Associative joinOperation := by
  sorry

                                                                 
theorem MeetOperationAssociative
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {meetOperation : BinaryEndoOperation Carrier}
    (isMeetOperation : IsMeetOperation relation meetOperation) :
    LRA.Operation.Laws.Associative.Associative meetOperation := by
  sorry

                                                                              
theorem JoinMeetOperationAbsorption
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {joinOperation meetOperation : BinaryEndoOperation Carrier}
    (isJoinOperation : IsJoinOperation relation joinOperation)
    (isMeetOperation : IsMeetOperation relation meetOperation) :
    LRA.Operation.Laws.Absorption.AbsorptionLaw
      joinOperation meetOperation := by
  sorry

                                                                              
theorem MeetJoinOperationAbsorption
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {joinOperation meetOperation : BinaryEndoOperation Carrier}
    (isJoinOperation : IsJoinOperation relation joinOperation)
    (isMeetOperation : IsMeetOperation relation meetOperation) :
    LRA.Operation.Laws.Absorption.AbsorptionLaw
      meetOperation joinOperation := by
  sorry

                                                              
theorem JoinMeetOperationMutualAbsorption
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {joinOperation meetOperation : BinaryEndoOperation Carrier}
    (isJoinOperation : IsJoinOperation relation joinOperation)
    (isMeetOperation : IsMeetOperation relation meetOperation) :
    LRA.Operation.Laws.Absorption.MutualAbsorptionLaw
      joinOperation meetOperation := by
  sorry

end LRA.Order
