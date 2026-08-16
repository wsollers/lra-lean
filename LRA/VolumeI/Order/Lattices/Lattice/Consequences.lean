import LRA.VolumeI.Order.Lattices.Lattice.Theorems
import LRA.VolumeI.Order.Lattices.Join.Theorems
import LRA.VolumeI.Order.Lattices.Meet.Theorems
import LRA.VolumeI.Map.Operation.Laws.Absorption.Definition
import LRA.VolumeI.Map.Operation.Laws.Associative.Definition
import LRA.VolumeI.Map.Operation.Laws.Commutative.Definition
import LRA.VolumeI.Map.Operation.Laws.Idempotent.Definition

namespace LRA.Order

open LRA.Map.Operation

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
    LRA.Map.Operation.Laws.Commutative.Commutative joinOperation := by
  intro left right
  exact
    JoinUnique relationIsPartialOrder.2.1
      (isJoinOperation left right)
      ((JoinCommutes relation right left (joinOperation right left)).mp
        (isJoinOperation right left))

/-- A chosen meet operation in a partial order is commutative. -/
theorem MeetOperationCommutative
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {meetOperation : BinaryEndoOperation Carrier}
    (isMeetOperation : IsMeetOperation relation meetOperation) :
    LRA.Map.Operation.Laws.Commutative.Commutative meetOperation := by
  intro left right
  exact
    MeetUnique relationIsPartialOrder.2.1
      (isMeetOperation left right)
      ((MeetCommutes relation right left (meetOperation right left)).mp
        (isMeetOperation right left))

/-- A chosen join operation in a partial order is idempotent. -/
theorem JoinOperationIdempotent
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {joinOperation : BinaryEndoOperation Carrier}
    (isJoinOperation : IsJoinOperation relation joinOperation) :
    LRA.Map.Operation.Laws.Idempotent.Idempotent joinOperation := by
  intro element
  exact
    JoinUnique relationIsPartialOrder.2.1
      (isJoinOperation element element)
      (JoinIdempotent relationIsPartialOrder.1 element)

/-- A chosen meet operation in a partial order is idempotent. -/
theorem MeetOperationIdempotent
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {meetOperation : BinaryEndoOperation Carrier}
    (isMeetOperation : IsMeetOperation relation meetOperation) :
    LRA.Map.Operation.Laws.Idempotent.Idempotent meetOperation := by
  intro element
  exact
    MeetUnique relationIsPartialOrder.2.1
      (isMeetOperation element element)
      (MeetIdempotent relationIsPartialOrder.1 element)

/-- A chosen join operation in a partial order is associative. -/
theorem JoinOperationAssociative
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {joinOperation : BinaryEndoOperation Carrier}
    (isJoinOperation : IsJoinOperation relation joinOperation) :
    LRA.Map.Operation.Laws.Associative.Associative joinOperation := by
  intro left middle right
  exact
    JoinAssociative relationIsPartialOrder
      (isJoinOperation left middle)
      (isJoinOperation (joinOperation left middle) right)
      (isJoinOperation middle right)
      (isJoinOperation left (joinOperation middle right))

/-- A chosen meet operation in a partial order is associative. -/
theorem MeetOperationAssociative
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {meetOperation : BinaryEndoOperation Carrier}
    (isMeetOperation : IsMeetOperation relation meetOperation) :
    LRA.Map.Operation.Laws.Associative.Associative meetOperation := by
  intro left middle right
  exact
    MeetAssociative relationIsPartialOrder
      (isMeetOperation left middle)
      (isMeetOperation (meetOperation left middle) right)
      (isMeetOperation middle right)
      (isMeetOperation left (meetOperation middle right))

/-- Chosen lattice join and meet satisfy the join-over-meet absorption law. -/
theorem JoinMeetOperationAbsorption
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {joinOperation meetOperation : BinaryEndoOperation Carrier}
    (isJoinOperation : IsJoinOperation relation joinOperation)
    (isMeetOperation : IsMeetOperation relation meetOperation) :
    LRA.Map.Operation.Laws.Absorption.AbsorptionLaw
      joinOperation meetOperation := by
  intro left right
  exact
    JoinWithMeetAbsorbs relationIsPartialOrder
      (isMeetOperation left right)
      (isJoinOperation left (meetOperation left right))

/-- Chosen lattice meet and join satisfy the meet-over-join absorption law. -/
theorem MeetJoinOperationAbsorption
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {joinOperation meetOperation : BinaryEndoOperation Carrier}
    (isJoinOperation : IsJoinOperation relation joinOperation)
    (isMeetOperation : IsMeetOperation relation meetOperation) :
    LRA.Map.Operation.Laws.Absorption.AbsorptionLaw
      meetOperation joinOperation := by
  intro left right
  exact
    MeetWithJoinAbsorbs relationIsPartialOrder
      (isJoinOperation left right)
      (isMeetOperation left (joinOperation left right))

/-- Chosen lattice join and meet satisfy mutual absorption. -/
theorem JoinMeetOperationMutualAbsorption
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {joinOperation meetOperation : BinaryEndoOperation Carrier}
    (isJoinOperation : IsJoinOperation relation joinOperation)
    (isMeetOperation : IsMeetOperation relation meetOperation) :
    LRA.Map.Operation.Laws.Absorption.MutualAbsorptionLaw
      joinOperation meetOperation :=
  ⟨JoinMeetOperationAbsorption
      relationIsPartialOrder isJoinOperation isMeetOperation,
    MeetJoinOperationAbsorption
      relationIsPartialOrder isJoinOperation isMeetOperation⟩

end LRA.Order
