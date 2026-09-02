import LRA.Operation.Laws.Absorption.Definition
import LRA.Operation.Laws.Absorbing.Definition

namespace LRA.Operation.Laws.Absorption

open LRA.Operation

universe u

/--
`FailsAbsorptionLaw` TODO

Predicate logic:

  ∀ {Carrier : Type u} (outer inner : LRA.Operation.BinaryEndoOperation Carrier), LRA.Operation.Laws.Absorption.AbsorptionLaw outer inner → False

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (outer inner : Carrier → Carrier → Carrier), (∀ (left right : Carrier), outer left (inner left right) = left) → False

Logical form (Lean):

```lean
def FailsAbsorptionLaw {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  Not (AbsorptionLaw outer inner)
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
def FailsAbsorptionLaw {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  Not (AbsorptionLaw outer inner)

/--
`FailsMutualAbsorptionLaw` TODO

Predicate logic:

  ∀ {Carrier : Type u} (first second : LRA.Operation.BinaryEndoOperation Carrier), LRA.Operation.Laws.Absorption.MutualAbsorptionLaw first second → False

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (first second : Carrier → Carrier → Carrier), (∀ (left right : Carrier), first left (second left right) = left ∧ ∀ (left right : Carrier), second left (first left right) = left) → False

Logical form (Lean):

```lean
def FailsMutualAbsorptionLaw {Carrier : Type u}
    (first second : BinaryEndoOperation Carrier) : Prop :=
  Not (MutualAbsorptionLaw first second)
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
def FailsMutualAbsorptionLaw {Carrier : Type u}
    (first second : BinaryEndoOperation Carrier) : Prop :=
  Not (MutualAbsorptionLaw first second)

/--
`NaturalAdditionOperation` TODO

Predicate logic:

  def NaturalAdditionOperation : BinaryEndoOperation Nat :=
  fun left right => left + right

Predicate logic (unfolded):

  def NaturalAdditionOperation : BinaryEndoOperation Nat :=
  fun left right => left + right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NaturalAdditionOperation : BinaryEndoOperation Nat :=
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
def NaturalAdditionOperation : BinaryEndoOperation Nat :=
  fun left right => left + right

/--
`NaturalMultiplicationOperation` TODO

Predicate logic:

  def NaturalMultiplicationOperation : BinaryEndoOperation Nat :=
  fun left right => left * right

Predicate logic (unfolded):

  def NaturalMultiplicationOperation : BinaryEndoOperation Nat :=
  fun left right => left * right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NaturalMultiplicationOperation : BinaryEndoOperation Nat :=
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
def NaturalMultiplicationOperation : BinaryEndoOperation Nat :=
  fun left right => left * right

/--
`NaturalMaxOperation` TODO

Predicate logic:

  def NaturalMaxOperation : BinaryEndoOperation Nat :=
  fun left right => Nat.max left right

Predicate logic (unfolded):

  def NaturalMaxOperation : BinaryEndoOperation Nat :=
  fun left right => Nat.max left right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NaturalMaxOperation : BinaryEndoOperation Nat :=
  fun left right => Nat.max left right
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
def NaturalMaxOperation : BinaryEndoOperation Nat :=
  fun left right => Nat.max left right

/--
`NaturalMinOperation` TODO

Predicate logic:

  def NaturalMinOperation : BinaryEndoOperation Nat :=
  fun left right => Nat.min left right

Predicate logic (unfolded):

  def NaturalMinOperation : BinaryEndoOperation Nat :=
  fun left right => Nat.min left right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NaturalMinOperation : BinaryEndoOperation Nat :=
  fun left right => Nat.min left right
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
def NaturalMinOperation : BinaryEndoOperation Nat :=
  fun left right => Nat.min left right

/--
`NaturalAdditionMultiplicationFailAbsorption` TODO

Predicate logic:

  FailsAbsorptionLaw NaturalAdditionOperation NaturalMultiplicationOperation ∧ FailsAbsorptionLaw NaturalMultiplicationOperation NaturalAdditionOperation

Predicate logic (unfolded):

  ((∀ (left right : Nat), instHAdd.1 left (instHMul.hMul left right) = left) → False ∧ (∀ (left right : Nat), instHMul.1 left (instHAdd.hAdd left right) = left) → False)

Logical form (Lean):

```lean
theorem NaturalAdditionMultiplicationFailAbsorption :
    FailsAbsorptionLaw NaturalAdditionOperation NaturalMultiplicationOperation ∧
      FailsAbsorptionLaw NaturalMultiplicationOperation NaturalAdditionOperation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem NaturalAdditionMultiplicationFailAbsorption :
    FailsAbsorptionLaw NaturalAdditionOperation NaturalMultiplicationOperation ∧
      FailsAbsorptionLaw NaturalMultiplicationOperation NaturalAdditionOperation := by
  sorry
/--
`NaturalMultiplicationHasAbsorberButFailsAbsorption` TODO

Predicate logic:

  LRA.Operation.Laws.Absorbing.TwoSidedAbsorbing NaturalMultiplicationOperation 0 ∧ FailsAbsorptionLaw NaturalMultiplicationOperation NaturalAdditionOperation

Predicate logic (unfolded):

  ((∀ (element : Nat), instHMul.1 (instOfNatNat 0).1 element = instOfNatNat 0.1 ∧ ∀ (element : Nat), instHMul.1 element (instOfNatNat 0).1 = instOfNatNat 0.1) ∧ (∀ (left right : Nat), instHMul.1 left (instHAdd.hAdd left right) = left) → False)

Logical form (Lean):

```lean
theorem NaturalMultiplicationHasAbsorberButFailsAbsorption :
    LRA.Operation.Laws.Absorbing.TwoSidedAbsorbing
      NaturalMultiplicationOperation 0 ∧
      FailsAbsorptionLaw NaturalMultiplicationOperation
        NaturalAdditionOperation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem NaturalMultiplicationHasAbsorberButFailsAbsorption :
    LRA.Operation.Laws.Absorbing.TwoSidedAbsorbing
      NaturalMultiplicationOperation 0 ∧
      FailsAbsorptionLaw NaturalMultiplicationOperation
        NaturalAdditionOperation := by
  sorry
/--
`NaturalMaxHasNoAbsorbingElement` TODO

Predicate logic:

  MutualAbsorptionLaw NaturalMaxOperation NaturalMinOperation ∧ Not ∃ absorber ∈ Nat, LRA.Operation.Laws.Absorbing.TwoSidedAbsorbing NaturalMaxOperation absorber

Predicate logic (unfolded):

  ((∀ (left right : Nat), Nat.instMax.1 left (left.min right) = left ∧ ∀ (left right : Nat), instMinNat.1 left (left.max right) = left) ∧ (Exists fun absorber => (∀ (element : Nat), Nat.instMax.1 absorber element = absorber ∧ ∀ (element : Nat), Nat.instMax.1 element absorber = absorber)) → False)

Logical form (Lean):

```lean
theorem NaturalMaxHasNoAbsorbingElement :
    MutualAbsorptionLaw NaturalMaxOperation NaturalMinOperation ∧
      Not
        (∃ absorber : Nat,
          LRA.Operation.Laws.Absorbing.TwoSidedAbsorbing
            NaturalMaxOperation absorber)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem NaturalMaxHasNoAbsorbingElement :
    MutualAbsorptionLaw NaturalMaxOperation NaturalMinOperation ∧
      Not
        (∃ absorber : Nat,
          LRA.Operation.Laws.Absorbing.TwoSidedAbsorbing
            NaturalMaxOperation absorber) := by
  sorry
end LRA.Operation.Laws.Absorption
