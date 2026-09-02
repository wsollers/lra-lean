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

/--
`IsJoinOperation` TODO

Predicate logic:

  ∀ {Carrier : Type u} (relation : LRA.Relation.Endorelation Carrier) (joinOperation : LRA.Operation.BinaryEndoOperation Carrier) (left right : Carrier), LRA.Order.Join relation left right (joinOperation left right)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (joinOperation : Carrier → Carrier → Carrier) (left right : Carrier), (relation left (joinOperation left right) ∧ (relation right (joinOperation left right) ∧ ∀ (upper : Carrier), relation left upper → relation right upper → relation (joinOperation left right) upper))

Logical form (Lean):

```lean
def IsJoinOperation {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier)
    (joinOperation : BinaryEndoOperation Carrier) : Prop :=
  forall left right,
    Join relation left right (joinOperation left right)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def IsJoinOperation {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier)
    (joinOperation : BinaryEndoOperation Carrier) : Prop :=
  forall left right,
    Join relation left right (joinOperation left right)

/--
`IsMeetOperation` TODO

Predicate logic:

  ∀ {Carrier : Type u} (relation : LRA.Relation.Endorelation Carrier) (meetOperation : LRA.Operation.BinaryEndoOperation Carrier) (left right : Carrier), LRA.Order.Meet relation left right (meetOperation left right)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (meetOperation : Carrier → Carrier → Carrier) (left right : Carrier), (relation (meetOperation left right) left ∧ (relation (meetOperation left right) right ∧ ∀ (lower : Carrier), relation lower left → relation lower right → relation lower (meetOperation left right)))

Logical form (Lean):

```lean
def IsMeetOperation {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier)
    (meetOperation : BinaryEndoOperation Carrier) : Prop :=
  forall left right,
    Meet relation left right (meetOperation left right)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def IsMeetOperation {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier)
    (meetOperation : BinaryEndoOperation Carrier) : Prop :=
  forall left right,
    Meet relation left right (meetOperation left right)

/--
`JoinOperationCommutative` TODO

Predicate logic:

  (IsJoinOperation relation joinOperation) → LRA.Operation.Laws.Commutative.Commutative joinOperation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop}, (∀ (x : Carrier), relation x x ∧ (∀ (x y : Carrier), relation x y → relation y x → x = y ∧ ∀ (x y z : Carrier), relation x y → relation y z → relation x z)) → ∀ {joinOperation : Carrier → Carrier → Carrier}, (∀ (left right : Carrier), (relation left (joinOperation left right) ∧ (relation right (joinOperation left right) ∧ ∀ (upper : Carrier), relation left upper → relation right upper → relation (joinOperation left right) upper))) → ∀ (first second : Carrier), joinOperation first second = joinOperation second first

Logical form (Lean):

```lean
theorem JoinOperationCommutative
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {joinOperation : BinaryEndoOperation Carrier}
    (isJoinOperation : IsJoinOperation relation joinOperation) :
    LRA.Operation.Laws.Commutative.Commutative joinOperation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem JoinOperationCommutative
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {joinOperation : BinaryEndoOperation Carrier}
    (isJoinOperation : IsJoinOperation relation joinOperation) :
    LRA.Operation.Laws.Commutative.Commutative joinOperation := by
  sorry
/--
`MeetOperationCommutative` TODO

Predicate logic:

  (IsMeetOperation relation meetOperation) → LRA.Operation.Laws.Commutative.Commutative meetOperation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop}, (∀ (x : Carrier), relation x x ∧ (∀ (x y : Carrier), relation x y → relation y x → x = y ∧ ∀ (x y z : Carrier), relation x y → relation y z → relation x z)) → ∀ {meetOperation : Carrier → Carrier → Carrier}, (∀ (left right : Carrier), (relation (meetOperation left right) left ∧ (relation (meetOperation left right) right ∧ ∀ (lower : Carrier), relation lower left → relation lower right → relation lower (meetOperation left right)))) → ∀ (first second : Carrier), meetOperation first second = meetOperation second first

Logical form (Lean):

```lean
theorem MeetOperationCommutative
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {meetOperation : BinaryEndoOperation Carrier}
    (isMeetOperation : IsMeetOperation relation meetOperation) :
    LRA.Operation.Laws.Commutative.Commutative meetOperation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem MeetOperationCommutative
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {meetOperation : BinaryEndoOperation Carrier}
    (isMeetOperation : IsMeetOperation relation meetOperation) :
    LRA.Operation.Laws.Commutative.Commutative meetOperation := by
  sorry
/--
`JoinOperationIdempotent` TODO

Predicate logic:

  (IsJoinOperation relation joinOperation) → LRA.Operation.Laws.Idempotent.Idempotent joinOperation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop}, (∀ (x : Carrier), relation x x ∧ (∀ (x y : Carrier), relation x y → relation y x → x = y ∧ ∀ (x y z : Carrier), relation x y → relation y z → relation x z)) → ∀ {joinOperation : Carrier → Carrier → Carrier}, (∀ (left right : Carrier), (relation left (joinOperation left right) ∧ (relation right (joinOperation left right) ∧ ∀ (upper : Carrier), relation left upper → relation right upper → relation (joinOperation left right) upper))) → ∀ (element : Carrier), joinOperation element element = element

Logical form (Lean):

```lean
theorem JoinOperationIdempotent
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {joinOperation : BinaryEndoOperation Carrier}
    (isJoinOperation : IsJoinOperation relation joinOperation) :
    LRA.Operation.Laws.Idempotent.Idempotent joinOperation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem JoinOperationIdempotent
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {joinOperation : BinaryEndoOperation Carrier}
    (isJoinOperation : IsJoinOperation relation joinOperation) :
    LRA.Operation.Laws.Idempotent.Idempotent joinOperation := by
  sorry
/--
`MeetOperationIdempotent` TODO

Predicate logic:

  (IsMeetOperation relation meetOperation) → LRA.Operation.Laws.Idempotent.Idempotent meetOperation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop}, (∀ (x : Carrier), relation x x ∧ (∀ (x y : Carrier), relation x y → relation y x → x = y ∧ ∀ (x y z : Carrier), relation x y → relation y z → relation x z)) → ∀ {meetOperation : Carrier → Carrier → Carrier}, (∀ (left right : Carrier), (relation (meetOperation left right) left ∧ (relation (meetOperation left right) right ∧ ∀ (lower : Carrier), relation lower left → relation lower right → relation lower (meetOperation left right)))) → ∀ (element : Carrier), meetOperation element element = element

Logical form (Lean):

```lean
theorem MeetOperationIdempotent
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {meetOperation : BinaryEndoOperation Carrier}
    (isMeetOperation : IsMeetOperation relation meetOperation) :
    LRA.Operation.Laws.Idempotent.Idempotent meetOperation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem MeetOperationIdempotent
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {meetOperation : BinaryEndoOperation Carrier}
    (isMeetOperation : IsMeetOperation relation meetOperation) :
    LRA.Operation.Laws.Idempotent.Idempotent meetOperation := by
  sorry
/--
`JoinOperationAssociative` TODO

Predicate logic:

  (IsJoinOperation relation joinOperation) → LRA.Operation.Laws.Associative.Associative joinOperation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop}, (∀ (x : Carrier), relation x x ∧ (∀ (x y : Carrier), relation x y → relation y x → x = y ∧ ∀ (x y z : Carrier), relation x y → relation y z → relation x z)) → ∀ {joinOperation : Carrier → Carrier → Carrier}, (∀ (left right : Carrier), (relation left (joinOperation left right) ∧ (relation right (joinOperation left right) ∧ ∀ (upper : Carrier), relation left upper → relation right upper → relation (joinOperation left right) upper))) → ∀ (first second third : Carrier), joinOperation (joinOperation first second) third = joinOperation first (joinOperation second third)

Logical form (Lean):

```lean
theorem JoinOperationAssociative
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {joinOperation : BinaryEndoOperation Carrier}
    (isJoinOperation : IsJoinOperation relation joinOperation) :
    LRA.Operation.Laws.Associative.Associative joinOperation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem JoinOperationAssociative
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {joinOperation : BinaryEndoOperation Carrier}
    (isJoinOperation : IsJoinOperation relation joinOperation) :
    LRA.Operation.Laws.Associative.Associative joinOperation := by
  sorry
/--
`MeetOperationAssociative` TODO

Predicate logic:

  (IsMeetOperation relation meetOperation) → LRA.Operation.Laws.Associative.Associative meetOperation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop}, (∀ (x : Carrier), relation x x ∧ (∀ (x y : Carrier), relation x y → relation y x → x = y ∧ ∀ (x y z : Carrier), relation x y → relation y z → relation x z)) → ∀ {meetOperation : Carrier → Carrier → Carrier}, (∀ (left right : Carrier), (relation (meetOperation left right) left ∧ (relation (meetOperation left right) right ∧ ∀ (lower : Carrier), relation lower left → relation lower right → relation lower (meetOperation left right)))) → ∀ (first second third : Carrier), meetOperation (meetOperation first second) third = meetOperation first (meetOperation second third)

Logical form (Lean):

```lean
theorem MeetOperationAssociative
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {meetOperation : BinaryEndoOperation Carrier}
    (isMeetOperation : IsMeetOperation relation meetOperation) :
    LRA.Operation.Laws.Associative.Associative meetOperation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem MeetOperationAssociative
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {meetOperation : BinaryEndoOperation Carrier}
    (isMeetOperation : IsMeetOperation relation meetOperation) :
    LRA.Operation.Laws.Associative.Associative meetOperation := by
  sorry
/--
`JoinMeetOperationAbsorption` TODO

Predicate logic:

  (IsJoinOperation relation joinOperation ∧ IsMeetOperation relation meetOperation) → LRA.Operation.Laws.Absorption.AbsorptionLaw joinOperation meetOperation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop}, (∀ (x : Carrier), relation x x ∧ (∀ (x y : Carrier), relation x y → relation y x → x = y ∧ ∀ (x y z : Carrier), relation x y → relation y z → relation x z)) → ∀ {joinOperation meetOperation : Carrier → Carrier → Carrier}, (∀ (left right : Carrier), (relation left (joinOperation left right) ∧ (relation right (joinOperation left right) ∧ ∀ (upper : Carrier), relation left upper → relation right upper → relation (joinOperation left right) upper)) ∧ ∀ (left right : Carrier), (relation (meetOperation left right) left ∧ (relation (meetOperation left right) right ∧ ∀ (lower : Carrier), relation lower left → relation lower right → relation lower (meetOperation left right)))) → ∀ (left right : Carrier), joinOperation left (meetOperation left right) = left

Logical form (Lean):

```lean
theorem JoinMeetOperationAbsorption
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {joinOperation meetOperation : BinaryEndoOperation Carrier}
    (isJoinOperation : IsJoinOperation relation joinOperation)
    (isMeetOperation : IsMeetOperation relation meetOperation) :
    LRA.Operation.Laws.Absorption.AbsorptionLaw
      joinOperation meetOperation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
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
/--
`MeetJoinOperationAbsorption` TODO

Predicate logic:

  (IsJoinOperation relation joinOperation ∧ IsMeetOperation relation meetOperation) → LRA.Operation.Laws.Absorption.AbsorptionLaw meetOperation joinOperation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop}, (∀ (x : Carrier), relation x x ∧ (∀ (x y : Carrier), relation x y → relation y x → x = y ∧ ∀ (x y z : Carrier), relation x y → relation y z → relation x z)) → ∀ {joinOperation meetOperation : Carrier → Carrier → Carrier}, (∀ (left right : Carrier), (relation left (joinOperation left right) ∧ (relation right (joinOperation left right) ∧ ∀ (upper : Carrier), relation left upper → relation right upper → relation (joinOperation left right) upper)) ∧ ∀ (left right : Carrier), (relation (meetOperation left right) left ∧ (relation (meetOperation left right) right ∧ ∀ (lower : Carrier), relation lower left → relation lower right → relation lower (meetOperation left right)))) → ∀ (left right : Carrier), meetOperation left (joinOperation left right) = left

Logical form (Lean):

```lean
theorem MeetJoinOperationAbsorption
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {joinOperation meetOperation : BinaryEndoOperation Carrier}
    (isJoinOperation : IsJoinOperation relation joinOperation)
    (isMeetOperation : IsMeetOperation relation meetOperation) :
    LRA.Operation.Laws.Absorption.AbsorptionLaw
      meetOperation joinOperation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
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
/--
`JoinMeetOperationMutualAbsorption` TODO

Predicate logic:

  (IsJoinOperation relation joinOperation ∧ IsMeetOperation relation meetOperation) → LRA.Operation.Laws.Absorption.MutualAbsorptionLaw joinOperation meetOperation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop}, (∀ (x : Carrier), relation x x ∧ (∀ (x y : Carrier), relation x y → relation y x → x = y ∧ ∀ (x y z : Carrier), relation x y → relation y z → relation x z)) → ∀ {joinOperation meetOperation : Carrier → Carrier → Carrier}, (∀ (left right : Carrier), (relation left (joinOperation left right) ∧ (relation right (joinOperation left right) ∧ ∀ (upper : Carrier), relation left upper → relation right upper → relation (joinOperation left right) upper)) ∧ ∀ (left right : Carrier), (relation (meetOperation left right) left ∧ (relation (meetOperation left right) right ∧ ∀ (lower : Carrier), relation lower left → relation lower right → relation lower (meetOperation left right)))) → (∀ (left right : Carrier), joinOperation left (meetOperation left right) = left ∧ ∀ (left right : Carrier), meetOperation left (joinOperation left right) = left)

Logical form (Lean):

```lean
theorem JoinMeetOperationMutualAbsorption
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    (relationIsPartialOrder : PartialOrder relation)
    {joinOperation meetOperation : BinaryEndoOperation Carrier}
    (isJoinOperation : IsJoinOperation relation joinOperation)
    (isMeetOperation : IsMeetOperation relation meetOperation) :
    LRA.Operation.Laws.Absorption.MutualAbsorptionLaw
      joinOperation meetOperation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
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
