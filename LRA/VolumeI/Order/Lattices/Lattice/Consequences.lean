import LRA.VolumeI.Order.Lattices.Lattice.Theorems
import LRA.VolumeI.Order.Lattices.Join.Theorems
import LRA.VolumeI.Order.Lattices.Meet.Theorems
import LRA.VolumeI.Operations.Laws.Absorption.Definition
import LRA.VolumeI.Operations.Laws.Associative.Definition
import LRA.VolumeI.Operations.Laws.Commutative.Definition
import LRA.VolumeI.Operations.Laws.Idempotent.Definition

namespace LRA.Order

open LRA.Operation

universe u

/--
A binary operation is a join operation for an order when it chooses a join for
each ordered pair.
-/
def IsJoinOperation {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier)
    (joinOperation : BinaryEndoOperation Carrier) : Prop :=
  forall left right,
    Join relation left right (joinOperation left right)

/--
A binary operation is a meet operation for an order when it chooses a meet for
each ordered pair.
-/
def IsMeetOperation {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier)
    (meetOperation : BinaryEndoOperation Carrier) : Prop :=
  forall left right,
    Meet relation left right (meetOperation left right)

/-- A chosen join operation in a partial order is commutative. -/
theorem JoinOperationCommutative
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {joinOperation : BinaryEndoOperation Carrier}
    (isJoinOperation : IsJoinOperation relation joinOperation) :
    LRA.Operation.Laws.Commutative.Commutative joinOperation := by
  sorry

/-- A chosen meet operation in a partial order is commutative. -/
theorem MeetOperationCommutative
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {meetOperation : BinaryEndoOperation Carrier}
    (isMeetOperation : IsMeetOperation relation meetOperation) :
    LRA.Operation.Laws.Commutative.Commutative meetOperation := by
  sorry

/-- A chosen join operation in a partial order is idempotent. -/
theorem JoinOperationIdempotent
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {joinOperation : BinaryEndoOperation Carrier}
    (isJoinOperation : IsJoinOperation relation joinOperation) :
    LRA.Operation.Laws.Idempotent.Idempotent joinOperation := by
  sorry

/-- A chosen meet operation in a partial order is idempotent. -/
theorem MeetOperationIdempotent
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {meetOperation : BinaryEndoOperation Carrier}
    (isMeetOperation : IsMeetOperation relation meetOperation) :
    LRA.Operation.Laws.Idempotent.Idempotent meetOperation := by
  sorry

/-- A chosen join operation in a partial order is associative. -/
theorem JoinOperationAssociative
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {joinOperation : BinaryEndoOperation Carrier}
    (isJoinOperation : IsJoinOperation relation joinOperation) :
    LRA.Operation.Laws.Associative.Associative joinOperation := by
  sorry

/-- A chosen meet operation in a partial order is associative. -/
theorem MeetOperationAssociative
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {meetOperation : BinaryEndoOperation Carrier}
    (isMeetOperation : IsMeetOperation relation meetOperation) :
    LRA.Operation.Laws.Associative.Associative meetOperation := by
  sorry

/-- Chosen lattice join and meet satisfy the join-over-meet absorption law. -/
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

/-- Chosen lattice meet and join satisfy the meet-over-join absorption law. -/
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

/-- Chosen lattice join and meet satisfy mutual absorption. -/
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
