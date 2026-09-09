import LRA.Operation

universe u v

namespace LRA.Operation.Laws.Absorbing

open LRA.Operation

/--
`BooleanAndOperation` TODO

Predicate logic:

  def BooleanAndOperation : BinaryEndoOperation Bool :=
    fun left right => left && right

Predicate logic (unfolded):

  def BooleanAndOperation : BinaryEndoOperation Bool :=
    fun left right => left && right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BooleanAndOperation : BinaryEndoOperation Bool :=
  fun left right => left && right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def BooleanAndOperation : BinaryEndoOperation Bool :=
  fun left right => left && right

/--
`BooleanFalseIsTwoSidedAbsorbingForAnd` TODO

Predicate logic:

  LRA.Operation.Laws.Absorbing.TwoSidedAbsorbing LRA.Operation.Laws.Absorbing.BooleanAndOperation Bool.false

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (element : Bool), Bool.rec ((fun _ => Bool.false) Unit.unit) ((fun _ => element) Unit.unit) Bool.false = Bool.false) ∧ (∀ (element : Bool), Bool.rec ((fun _ => Bool.false) Unit.unit) ((fun _ => Bool.false) Unit.unit) element = Bool.false))

Logical form (Lean):

```lean
theorem BooleanFalseIsTwoSidedAbsorbingForAnd :
    TwoSidedAbsorbing BooleanAndOperation false
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
theorem BooleanFalseIsTwoSidedAbsorbingForAnd :
    TwoSidedAbsorbing BooleanAndOperation false := by
  sorry
/--
`BooleanOrOperation` TODO

Predicate logic:

  def BooleanOrOperation : BinaryEndoOperation Bool :=
    fun left right => left || right

Predicate logic (unfolded):

  def BooleanOrOperation : BinaryEndoOperation Bool :=
    fun left right => left || right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BooleanOrOperation : BinaryEndoOperation Bool :=
  fun left right => left || right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def BooleanOrOperation : BinaryEndoOperation Bool :=
  fun left right => left || right

/--
`BooleanTrueIsTwoSidedAbsorbingForOr` TODO

Predicate logic:

  LRA.Operation.Laws.Absorbing.TwoSidedAbsorbing LRA.Operation.Laws.Absorbing.BooleanOrOperation Bool.true

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (element : Bool), Bool.rec ((fun _ => element) Unit.unit) ((fun _ => Bool.true) Unit.unit) Bool.true = Bool.true) ∧ (∀ (element : Bool), Bool.rec ((fun _ => Bool.true) Unit.unit) ((fun _ => Bool.true) Unit.unit) element = Bool.true))

Logical form (Lean):

```lean
theorem BooleanTrueIsTwoSidedAbsorbingForOr :
    TwoSidedAbsorbing BooleanOrOperation true
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
theorem BooleanTrueIsTwoSidedAbsorbingForOr :
    TwoSidedAbsorbing BooleanOrOperation true := by
  sorry
end LRA.Operation.Laws.Absorbing

namespace LRA.Operation.Laws.Absorption

open LRA.Operation

/--
`BooleanOrOperation` TODO

Predicate logic:

  def BooleanOrOperation : BinaryEndoOperation Bool :=
    fun left right => left || right

Predicate logic (unfolded):

  def BooleanOrOperation : BinaryEndoOperation Bool :=
    fun left right => left || right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BooleanOrOperation : BinaryEndoOperation Bool :=
  fun left right => left || right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def BooleanOrOperation : BinaryEndoOperation Bool :=
  fun left right => left || right

/--
`BooleanAndOperation` TODO

Predicate logic:

  def BooleanAndOperation : BinaryEndoOperation Bool :=
    fun left right => left && right

Predicate logic (unfolded):

  def BooleanAndOperation : BinaryEndoOperation Bool :=
    fun left right => left && right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BooleanAndOperation : BinaryEndoOperation Bool :=
  fun left right => left && right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def BooleanAndOperation : BinaryEndoOperation Bool :=
  fun left right => left && right

/--
`BooleanOrAndMutualAbsorption` TODO

Predicate logic:

  LRA.Operation.Laws.Absorption.MutualAbsorptionLaw LRA.Operation.Laws.Absorption.BooleanOrOperation LRA.Operation.Laws.Absorption.BooleanAndOperation

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (left right : Bool), Bool.rec ((fun _ => LRA.Operation.Laws.Absorption.BooleanAndOperation left right) Unit.unit) ((fun _ => Bool.true) Unit.unit) left = left) ∧ (∀ (left right : Bool), Bool.rec ((fun _ => Bool.false) Unit.unit) ((fun _ => LRA.Operation.Laws.Absorption.BooleanOrOperation left right) Unit.unit) left = left))

Logical form (Lean):

```lean
theorem BooleanOrAndMutualAbsorption :
    MutualAbsorptionLaw BooleanOrOperation BooleanAndOperation
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
theorem BooleanOrAndMutualAbsorption :
    MutualAbsorptionLaw BooleanOrOperation BooleanAndOperation := by
  sorry
/--
`NaturalMaxMinMutualAbsorption` TODO

Predicate logic:

  LRA.Operation.Laws.Absorption.MutualAbsorptionLaw LRA.Operation.Laws.Absorption.NaturalMaxOperation LRA.Operation.Laws.Absorption.NaturalMinOperation

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (left right : Nat), Nat.instMax.1 left (left.min right) = left) ∧ (∀ (left right : Nat), instMinNat.1 left (left.max right) = left))

Logical form (Lean):

```lean
theorem NaturalMaxMinMutualAbsorption :
    MutualAbsorptionLaw NaturalMaxOperation NaturalMinOperation
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
theorem NaturalMaxMinMutualAbsorption :
    MutualAbsorptionLaw NaturalMaxOperation NaturalMinOperation := by
  sorry
end LRA.Operation.Laws.Absorption

namespace LRA.Operation.Laws.Associative

open LRA.Operation

/--
`NaturalAdditionAssociative` TODO

Predicate logic:

  ∀ {Carrier : Type u_1} {NaturalAddition : LRA.Operation.BinaryEndoOperation Carrier}, LRA.Operation.Laws.Associative.Associative NaturalAddition

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    NaturalAddition (NaturalAddition first second) third = NaturalAddition first (NaturalAddition second third)

Logical form (Lean):

```lean
theorem NaturalAdditionAssociative :
    Associative NaturalAddition
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
theorem NaturalAdditionAssociative :
    Associative NaturalAddition := by
  sorry
end LRA.Operation.Laws.Associative

namespace LRA.Operation.Laws.Cancellation

open LRA.Operation

/--
`NaturalAdditionTwoSidedCancellative` TODO

Predicate logic:

  ∀ {Carrier : Type u_1} {NaturalAddition : LRA.Operation.BinaryEndoOperation Carrier}, LRA.Operation.Laws.Cancellation.TwoSidedCancellative NaturalAddition

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (fixed first second : Carrier), NaturalAddition fixed first = NaturalAddition fixed second → first = second) ∧ (∀ (first second fixed : Carrier), NaturalAddition first fixed = NaturalAddition second fixed → first = second))

Logical form (Lean):

```lean
theorem NaturalAdditionTwoSidedCancellative :
    TwoSidedCancellative NaturalAddition
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
theorem NaturalAdditionTwoSidedCancellative :
    TwoSidedCancellative NaturalAddition := by
  sorry
/--
`NaturalMultiplicationForRestrictedCancellation` TODO

Predicate logic:

  def NaturalMultiplicationForRestrictedCancellation : BinaryEndoOperation Nat :=
    fun left right => left * right

Predicate logic (unfolded):

  def NaturalMultiplicationForRestrictedCancellation : BinaryEndoOperation Nat :=
    fun left right => left * right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NaturalMultiplicationForRestrictedCancellation : BinaryEndoOperation Nat :=
  fun left right => left * right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def NaturalMultiplicationForRestrictedCancellation : BinaryEndoOperation Nat :=
  fun left right => left * right

/--
`NaturalMultiplicationLeftCancellativeOnNonzero` TODO

Predicate logic:

  LRA.Operation.Laws.Cancellation.LeftCancellativeOn (fun fixed => Ne fixed 0) LRA.Operation.Laws.Cancellation.NaturalMultiplicationForRestrictedCancellation

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (fixed = 0 → False) → ∀ (first second : Nat), { hMul := fun a b => instMulNat.mul a b }.hMul fixed first = { hMul := fun a b => instMulNat.mul a b }.hMul fixed second → first = second

Logical form (Lean):

```lean
theorem NaturalMultiplicationLeftCancellativeOnNonzero :
    LeftCancellativeOn
      (fun fixed : Nat => fixed ≠ 0)
      NaturalMultiplicationForRestrictedCancellation
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
theorem NaturalMultiplicationLeftCancellativeOnNonzero :
    LeftCancellativeOn
      (fun fixed : Nat => fixed ≠ 0)
      NaturalMultiplicationForRestrictedCancellation := by
  sorry
/--
`NaturalMultiplicationRightCancellativeOnNonzero` TODO

Predicate logic:

  LRA.Operation.Laws.Cancellation.RightCancellativeOn (fun fixed => Ne fixed 0) LRA.Operation.Laws.Cancellation.NaturalMultiplicationForRestrictedCancellation

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (fixed = 0 → False) → ∀ (first second : Nat), { hMul := fun a b => instMulNat.mul a b }.hMul first fixed = { hMul := fun a b => instMulNat.mul a b }.hMul second fixed → first = second

Logical form (Lean):

```lean
theorem NaturalMultiplicationRightCancellativeOnNonzero :
    RightCancellativeOn
      (fun fixed : Nat => fixed ≠ 0)
      NaturalMultiplicationForRestrictedCancellation
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
theorem NaturalMultiplicationRightCancellativeOnNonzero :
    RightCancellativeOn
      (fun fixed : Nat => fixed ≠ 0)
      NaturalMultiplicationForRestrictedCancellation := by
  sorry
end LRA.Operation.Laws.Cancellation

namespace LRA.Operation.Laws.Closure

open LRA.Operation

/--
`NaturalAdditionClosedOnFullCarrier` TODO

Predicate logic:

  ∀ {NaturalAddition : LRA.Operation.BinaryEndoOperation Nat}, LRA.Operation.Laws.Closure.BinaryEndoClosedOn (fun x => True) NaturalAddition

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (True ∧ True) → (fun x => True) (NaturalAddition left right)

Logical form (Lean):

```lean
theorem NaturalAdditionClosedOnFullCarrier :
    BinaryEndoClosedOn (fun _ : Nat => True) NaturalAddition
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
theorem NaturalAdditionClosedOnFullCarrier :
    BinaryEndoClosedOn (fun _ : Nat => True) NaturalAddition := by
  sorry
end LRA.Operation.Laws.Closure

namespace LRA.Operation.Laws.Commutative

open LRA.Operation

/--
`NaturalAdditionCommutative` TODO

Predicate logic:

  ∀ {Carrier : Type u_1} {NaturalAddition : LRA.Operation.BinaryEndoOperation Carrier}, LRA.Operation.Laws.Commutative.Commutative NaturalAddition

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    NaturalAddition first second = NaturalAddition second first

Logical form (Lean):

```lean
theorem NaturalAdditionCommutative :
    Commutative NaturalAddition
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
theorem NaturalAdditionCommutative :
    Commutative NaturalAddition := by
  sorry
end LRA.Operation.Laws.Commutative

namespace LRA.Operation.Laws.Distributive

open LRA.Operation

/--
`NaturalMultiplicationDistributesOverAddition` TODO

Predicate logic:

  ∀ {Carrier : Type u_1} {NaturalMultiplication NaturalAddition : LRA.Operation.BinaryEndoOperation Carrier}, LRA.Operation.Laws.Distributive.TwoSidedDistributive NaturalMultiplication NaturalAddition

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (left right third : Carrier), NaturalMultiplication left (NaturalAddition right third) = NaturalAddition (NaturalMultiplication left right) (NaturalMultiplication left third)) ∧ (∀ (left right third : Carrier), NaturalMultiplication (NaturalAddition left right) third = NaturalAddition (NaturalMultiplication left third) (NaturalMultiplication right third)))

Logical form (Lean):

```lean
theorem NaturalMultiplicationDistributesOverAddition :
    TwoSidedDistributive NaturalMultiplication NaturalAddition
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
theorem NaturalMultiplicationDistributesOverAddition :
    TwoSidedDistributive NaturalMultiplication NaturalAddition := by
  sorry
end LRA.Operation.Laws.Distributive

namespace LRA.Operation.Laws.Idempotent

open LRA.Operation

/--
`BooleanOrOperation` TODO

Predicate logic:

  def BooleanOrOperation : BinaryEndoOperation Bool :=
    fun left right => left || right

Predicate logic (unfolded):

  def BooleanOrOperation : BinaryEndoOperation Bool :=
    fun left right => left || right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BooleanOrOperation : BinaryEndoOperation Bool :=
  fun left right => left || right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def BooleanOrOperation : BinaryEndoOperation Bool :=
  fun left right => left || right

/--
`BooleanOrIdempotent` TODO

Predicate logic:

  LRA.Operation.Laws.Idempotent.Idempotent LRA.Operation.Laws.Idempotent.BooleanOrOperation

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Bool.rec ((fun _ => element) Unit.unit) ((fun _ => Bool.true) Unit.unit) element = element

Logical form (Lean):

```lean
theorem BooleanOrIdempotent :
    Idempotent BooleanOrOperation
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
theorem BooleanOrIdempotent :
    Idempotent BooleanOrOperation := by
  sorry
/--
`BooleanAndOperation` TODO

Predicate logic:

  def BooleanAndOperation : BinaryEndoOperation Bool :=
    fun left right => left && right

Predicate logic (unfolded):

  def BooleanAndOperation : BinaryEndoOperation Bool :=
    fun left right => left && right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BooleanAndOperation : BinaryEndoOperation Bool :=
  fun left right => left && right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def BooleanAndOperation : BinaryEndoOperation Bool :=
  fun left right => left && right

/--
`BooleanAndIdempotent` TODO

Predicate logic:

  LRA.Operation.Laws.Idempotent.Idempotent LRA.Operation.Laws.Idempotent.BooleanAndOperation

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Bool.rec ((fun _ => Bool.false) Unit.unit) ((fun _ => element) Unit.unit) element = element

Logical form (Lean):

```lean
theorem BooleanAndIdempotent :
    Idempotent BooleanAndOperation
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
theorem BooleanAndIdempotent :
    Idempotent BooleanAndOperation := by
  sorry
end LRA.Operation.Laws.Idempotent

namespace LRA.Operation.Laws.Identity

open LRA.Operation

/--
`BooleanOrOperation` TODO

Predicate logic:

  def BooleanOrOperation : BinaryEndoOperation Bool :=
    fun left right => left || right

Predicate logic (unfolded):

  def BooleanOrOperation : BinaryEndoOperation Bool :=
    fun left right => left || right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BooleanOrOperation : BinaryEndoOperation Bool :=
  fun left right => left || right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def BooleanOrOperation : BinaryEndoOperation Bool :=
  fun left right => left || right

/--
`BooleanFalseIsTwoSidedIdentityForOr` TODO

Predicate logic:

  LRA.Operation.Laws.Identity.TwoSidedIdentity LRA.Operation.Laws.Identity.BooleanOrOperation Bool.false

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (element : Bool), Bool.rec ((fun _ => element) Unit.unit) ((fun _ => Bool.true) Unit.unit) Bool.false = element) ∧ (∀ (element : Bool), Bool.rec ((fun _ => Bool.false) Unit.unit) ((fun _ => Bool.true) Unit.unit) element = element))

Logical form (Lean):

```lean
theorem BooleanFalseIsTwoSidedIdentityForOr :
    TwoSidedIdentity BooleanOrOperation false
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
theorem BooleanFalseIsTwoSidedIdentityForOr :
    TwoSidedIdentity BooleanOrOperation false := by
  sorry
/--
`BooleanAndOperation` TODO

Predicate logic:

  def BooleanAndOperation : BinaryEndoOperation Bool :=
    fun left right => left && right

Predicate logic (unfolded):

  def BooleanAndOperation : BinaryEndoOperation Bool :=
    fun left right => left && right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BooleanAndOperation : BinaryEndoOperation Bool :=
  fun left right => left && right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def BooleanAndOperation : BinaryEndoOperation Bool :=
  fun left right => left && right

/--
`BooleanTrueIsTwoSidedIdentityForAnd` TODO

Predicate logic:

  LRA.Operation.Laws.Identity.TwoSidedIdentity LRA.Operation.Laws.Identity.BooleanAndOperation Bool.true

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (element : Bool), Bool.rec ((fun _ => Bool.false) Unit.unit) ((fun _ => element) Unit.unit) Bool.true = element) ∧ (∀ (element : Bool), Bool.rec ((fun _ => Bool.false) Unit.unit) ((fun _ => Bool.true) Unit.unit) element = element))

Logical form (Lean):

```lean
theorem BooleanTrueIsTwoSidedIdentityForAnd :
    TwoSidedIdentity BooleanAndOperation true
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
theorem BooleanTrueIsTwoSidedIdentityForAnd :
    TwoSidedIdentity BooleanAndOperation true := by
  sorry
end LRA.Operation.Laws.Identity

namespace LRA.Operation.Laws.Inverse

open LRA.Operation

/--
`BooleanXorOperation` TODO

Predicate logic:

  def BooleanXorOperation : BinaryEndoOperation Bool :=
    fun left right => Bool.xor left right

Predicate logic (unfolded):

  def BooleanXorOperation : BinaryEndoOperation Bool :=
    fun left right => Bool.xor left right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BooleanXorOperation : BinaryEndoOperation Bool :=
  fun left right => Bool.xor left right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def BooleanXorOperation : BinaryEndoOperation Bool :=
  fun left right => Bool.xor left right

/--
`BooleanXorInverse` TODO

Predicate logic:

  def BooleanXorInverse : UnaryEndoOperation Bool :=
    fun element => element

Predicate logic (unfolded):

  def BooleanXorInverse : UnaryEndoOperation Bool :=
    fun element => element (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BooleanXorInverse : UnaryEndoOperation Bool :=
  fun element => element
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def BooleanXorInverse : UnaryEndoOperation Bool :=
  fun element => element

/--
`BooleanXorSelfInverse` TODO

Predicate logic:

  LRA.Operation.Laws.Inverse.TwoSidedInverse LRA.Operation.Laws.Inverse.BooleanXorOperation Bool.false LRA.Operation.Laws.Inverse.BooleanXorInverse

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (element : Bool), cond.match_1 (fun x => Bool) (instBEqOfDecidable.beq = LRA.Operation.Laws.Inverse.BooleanXorInverse element element) (fun _ => Bool.false) fun _ => Bool.true = Bool.false) ∧ (∀ (element : Bool), cond.match_1 (fun x => Bool) (instBEqOfDecidable.beq = element(LRA.Operation.Laws.Inverse.BooleanXorInverse element)) (fun _ => Bool.false) fun _ => Bool.true = Bool.false))

Logical form (Lean):

```lean
theorem BooleanXorSelfInverse :
    TwoSidedInverse BooleanXorOperation false BooleanXorInverse
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
theorem BooleanXorSelfInverse :
    TwoSidedInverse BooleanXorOperation false BooleanXorInverse := by
  sorry
/--
`IntegerAdditionForInverseExample` TODO

Predicate logic:

  def IntegerAdditionForInverseExample : BinaryEndoOperation Int :=
    fun left right => left + right

Predicate logic (unfolded):

  def IntegerAdditionForInverseExample : BinaryEndoOperation Int :=
    fun left right => left + right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def IntegerAdditionForInverseExample : BinaryEndoOperation Int :=
  fun left right => left + right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def IntegerAdditionForInverseExample : BinaryEndoOperation Int :=
  fun left right => left + right

/--
`IntegerAdditiveInverse` TODO

Predicate logic:

  def IntegerAdditiveInverse : UnaryEndoOperation Int :=
    fun element => -element

Predicate logic (unfolded):

  def IntegerAdditiveInverse : UnaryEndoOperation Int :=
    fun element => -element (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def IntegerAdditiveInverse : UnaryEndoOperation Int :=
  fun element => -element
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def IntegerAdditiveInverse : UnaryEndoOperation Int :=
  fun element => -element

/--
`IntegerAdditionNegationTwoSidedInverse` TODO

Predicate logic:

  LRA.Operation.Laws.Inverse.TwoSidedInverse LRA.Operation.Laws.Inverse.IntegerAdditionForInverseExample 0 LRA.Operation.Laws.Inverse.IntegerAdditiveInverse

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (element : Int), { hAdd := fun a b => Int.instAdd.add a b }.hAdd (Int.instNegInt.neg element) element = 0) ∧ (∀ (element : Int), { hAdd := fun a b => Int.instAdd.add a b }.hAdd element (Int.instNegInt.neg element) = 0))

Logical form (Lean):

```lean
theorem IntegerAdditionNegationTwoSidedInverse :
    TwoSidedInverse IntegerAdditionForInverseExample 0 IntegerAdditiveInverse
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
theorem IntegerAdditionNegationTwoSidedInverse :
    TwoSidedInverse IntegerAdditionForInverseExample 0 IntegerAdditiveInverse := by
  sorry
end LRA.Operation.Laws.Inverse

namespace LRA.Operation.Laws.Nilpotent

open LRA.Operation

/--
`NaturalMultiplicationForNilpotenceExample` TODO

Predicate logic:

  def NaturalMultiplicationForNilpotenceExample : BinaryEndoOperation Nat :=
    fun left right => left * right

Predicate logic (unfolded):

  def NaturalMultiplicationForNilpotenceExample : BinaryEndoOperation Nat :=
    fun left right => left * right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NaturalMultiplicationForNilpotenceExample : BinaryEndoOperation Nat :=
  fun left right => left * right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def NaturalMultiplicationForNilpotenceExample : BinaryEndoOperation Nat :=
  fun left right => left * right

/--
`NaturalZeroNilpotentUnderMultiplication` TODO

Predicate logic:

  LRA.Operation.Laws.Nilpotent.NilpotentElement LRA.Operation.Laws.Nilpotent.NaturalMultiplicationForNilpotenceExample 0 0

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun positiveExponent => LRA.Operation.Laws.Nilpotent.PositivePower LRA.Operation.Laws.Nilpotent.NaturalMultiplicationForNilpotenceExample 0 positiveExponent = 0

Logical form (Lean):

```lean
theorem NaturalZeroNilpotentUnderMultiplication :
    NilpotentElement NaturalMultiplicationForNilpotenceExample 0 0
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
theorem NaturalZeroNilpotentUnderMultiplication :
    NilpotentElement NaturalMultiplicationForNilpotenceExample 0 0 := by
  sorry
end LRA.Operation.Laws.Nilpotent
